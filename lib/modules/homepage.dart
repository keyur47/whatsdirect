import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsdirect/utils/appsnackbar.dart';
import 'package:whatsdirect/helper/shared_preferences.dart';
import 'package:whatsdirect/modules/controller/controller.dart';
import 'package:whatsdirect/modules/num_pad.dart';
import 'package:whatsdirect/utils/app_color.dart';
import 'package:whatsdirect/utils/string_utils.dart';
import 'package:whatsdirect/widgets/button_box.dart';
import 'package:whatsdirect/widgets/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Padding(
          padding: EdgeInsets.only(top: 10.w, left: 5.w, right: 5.w,),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Row(
                    children: [
                      Icon(Icons.whatsapp,size: 12.w,color: AppColor.appColors,shadows: [
                          BoxShadow(
                            color: AppColor.appColors.withOpacity(0.8),
                            spreadRadius: 10,
                            blurRadius: 7,
                            offset: const Offset(2, 1), // changes position of shadow
                          ),
                      ]),
                      SizedBox(width: 1.w,),
                      const Text(
                        StringsUtils.whatsDirect,
                        style: TextStyle(
                            fontSize: 24,
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  PopupMenuButton(
                    // enableFeedback: true,
                      onSelected: (value){
                      print("Value:- $value");
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("About App"),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Share App"),
                          value: 2,
                        ),
                        PopupMenuItem(
                          child: Text("Rate App"),
                          value: 3,
                        ),
                        PopupMenuItem(
                          child: Text("Terms and Privacy"),
                          value: 4,
                        ),
                      ]
                  )
                  // InkWell(
                  //     onTap: _displayNameAndPopupMenu,
                  //     child: const Icon(Icons.more_vert_rounded))
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 5.w,),
                  phoneNumberTextField(
                      controller: controller.myController,
                      showCursor: false,
                      focusNode: controller.focusNodes,
                      hintText: StringsUtils.phoneNumber,
                      textInputType: TextInputType.none,
                      valueChanged: (country) {
                        controller.data.value = country.dialCode;
                        print('Country changed to: ${country.dialCode}');
                      },
                      onTap: () {
                        controller.myController.text =
                            AppSharedPreference.lastNumber.toString();
                        controller.data.value =
                            AppSharedPreference.lastNumberCode.toString();
                      }),
                  SizedBox(
                    height: 5.w,
                  ),
                  textField(
                      controller.textController,
                      true,
                      controller.focusNode,
                      StringsUtils.typeYourMessage,
                      TextInputType.text),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      button(
                          onTap: () async {
                            if (controller.myController.text.isNotEmpty) {
                              AppSharedPreference.setLastNumber(
                                  controller.myController.text);
                              AppSharedPreference.setLastNumberCode(
                                  controller.data.value);
                              controller.url.value =
                                  "https://wa.me/+${controller.data.value}${controller.myController.text}?text=${controller.textController.text}";
                              await launch(controller.url.value);
                              print("------${controller.url.value}");
                            } else {
                              AppSnackBar.showErrorSnackBar(
                                  message: "Please enter amount & image",
                                  title: 'Error');
                            }
                          },
                          text: StringsUtils.openWhatsApp,
                          iconData: Icons.whatsapp,
                          textColor: AppColor.whiteColor,
                          boxColor: AppColors.darkBlue,
                          iconColor: Colors.green),
                      button(
                          onTap: () async {
                            AppSharedPreference.setLastNumber(
                                controller.myController.text);
                            AppSharedPreference.setLastNumberCode(
                                controller.data.value);
                            await Geolocator.requestPermission();
                            if (await Permission.location.isGranted) {
                              Position? position;
                              try {
                                position =
                                    await Geolocator.getCurrentPosition(
                                  desiredAccuracy:
                                      LocationAccuracy.bestForNavigation,
                                  timeLimit: const Duration(seconds: 5),
                                );
                                var urls =
                                    "https://www.google.com/maps/?q=${position.latitude},${position.longitude}"
                                        .toString();
                                final url =
                                    "https://wa.me/+${controller.data.value}${controller.myController.text}?text=See my real-time location on Maps:$urls";
                                await launch(url);
                                print("Location$url");
                                print("Location121$urls");
                              } catch (e) {}
                            }
                          },
                          text: StringsUtils.shareLocation,
                          iconData: Icons.location_on_outlined,
                          boxColor: AppColor.whiteColor,
                          textColor: AppColors.black,
                          iconColor: Colors.green),
                    ],
                  ),
                ],
              ),
              controller.isOpenKeyboard.value
                  ? const SizedBox()
                  : NumPad(
                      buttonSize: 15.w,
                      buttonColor: AppColors.darkBlue,
                      iconColor: AppColors.green,
                      controller: controller.myController,
                      delete: () {
                        controller.myController.text =
                            controller.myController.text.substring(0,
                                controller.myController.text.length - 1);
                      },
                      clear: () {
                        controller.myController.clear();
                      },
                      onSubmit: () {
                        debugPrint(
                            'Your code: ${controller.myController.text}');
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: Text(
                              "You code is ${controller.myController.text}",
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

}
