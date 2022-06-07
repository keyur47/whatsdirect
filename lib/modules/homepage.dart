import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reviews_slider/reviews_slider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsdirect/helper/shared_preferences.dart';
import 'package:whatsdirect/main.dart';
import 'package:whatsdirect/modules/controller/controller.dart';
import 'package:whatsdirect/modules/num_pad.dart';
import 'package:whatsdirect/utils/app_color.dart';
import 'package:whatsdirect/utils/appsnackbar.dart';
import 'package:whatsdirect/utils/string_utils.dart';
import 'package:whatsdirect/widgets/add-number_list.dart';
import 'package:whatsdirect/widgets/button_box.dart';
import 'package:whatsdirect/widgets/custom_textfield.dart';
import 'package:whatsdirect/widgets/privacy.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/homePage_screen';

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Obx(
          () => Container(
            child: Padding(
              padding: EdgeInsets.only(
                top: 2.w,
                left: 5.w,
                // right: 5.w,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.whatsapp,
                              size: 16.w,
                              color: AppColor.appColors,
                              shadows: [
                                BoxShadow(
                                  color: AppColor.appColors.withOpacity(0.8),
                                  spreadRadius: 10,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      2, 1), // changes position of shadow
                                ),
                              ]),
                          SizedBox(
                            width: 1.w,
                          ),
                          const Text(
                            StringsUtils.whatsDirects,
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.darkBlue,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      PopupMenuButton(
                          // enableFeedback: true,
                          onSelected: (int value) {
                            if (value == 1) {
                              Get.to(AddList());
                            } else if (value == 2) {
                              FlutterShare.share(
                                  title: "Direct WhatsApp",
                                  linkUrl:
                                      "https://play.google.com/store/games");
                            } else if (value == 4) {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(22.sp),
                                    topRight: Radius.circular(22.sp),
                                  ),
                                ),
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return Container(
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(22.sp),
                                        topRight: Radius.circular(22.sp),
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 5.w,
                                                left: 5.w,
                                                top: 5.h),
                                            child: textField(
                                                controller: controller
                                                    .emailFeedBackController,
                                                hintText: StringsUtils.email,
                                                textInputType:
                                                    TextInputType.text,
                                                onTap: () {},
                                                maxLines: 1,
                                                color: AppColors.grey,
                                                textStyle: TextStyle(
                                                    color: AppColors.grey[200],
                                                    fontSize: 14),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: AppColors.white),
                                                cursorColor: Colors.white),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 5.w,
                                                left: 5.w,
                                                top: 1.h),
                                            child: textField(
                                                controller: controller
                                                    .FeedBackController,
                                                hintText: StringsUtils.feedback,
                                                textInputType:
                                                    TextInputType.text,
                                                onTap: () {},
                                                maxLines: 4,
                                                color: AppColors.grey,
                                                textStyle: TextStyle(
                                                    color: AppColors.grey[200],
                                                    fontSize: 14),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: AppColors.white),
                                                cursorColor: Colors.white),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 5.w,
                                                left: 5.w,
                                                top: 5.h),
                                            child: ReviewSlider(
                                                onChange: (int value) {
                                              print(value);
                                            }),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 5.h),
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text(
                                                    StringsUtils.sendFeedBack)),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              Get.to(Privacy());
                            }
                            print("Value:- $value");
                          },
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text(StringsUtils.aboutApp),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  // onTap: () {
                                  //   FlutterShare.share(
                                  //       title: "Direct WhatsApp",
                                  //       linkUrl:
                                  //           "https://play.google.com/store/games");
                                  // },
                                  child: Text(StringsUtils.shareApp),
                                  value: 2,
                                ),
                                PopupMenuItem(
                                  child: Text(StringsUtils.rateApp),
                                  value: 3,
                                ),
                                PopupMenuItem(
                                  child: Text(StringsUtils.feedback),
                                  value: 4,
                                ),
                                PopupMenuItem(
                                  child: Text(StringsUtils.termsAndPrivacy),
                                  value: 5,
                                ),
                              ])
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h, right: 5.w),
                    child: Column(
                      children: [
                        InkWell(
                          child: phoneNumberTextField(
                              controller: controller.myController,
                              showCursor: false,
                              onTapV: () async {
                                FocusScope.of(context).unfocus();
                                await Future.delayed(
                                    const Duration(milliseconds: 200));
                                showNumericContainer.value = true;
                              },
                              // focusNode: controller.focusNodes,
                              hintText: StringsUtils.phoneNumber,
                              textInputType: TextInputType.none,
                              valueChanged: (country) {
                                controller.data.value = country.dialCode;
                                print(
                                    'Country changed to: ${country.dialCode}');
                              },
                              onTap: () async {
                                List<String> data = await SharedPrefs.getNumberList();
                                var dataType = controller.myController.text = data.join();
                                print("dataType:-  $dataType");
                                // var data =  controller.myController.text = AppSharedPreference.lastNumber.toString();
                                // // AppSharedPreference.clear();
                                //   controller.data.value = AppSharedPreference.lastNumberCode.toString();
                              }),
                          onTap: () {
                            // Get.to(AddList());
                          },
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        textField(
                            controller: controller.textController,
                            hintText: StringsUtils.typeYourMessage,
                            textInputType: TextInputType.text,
                            onTap: () {
                              showNumericContainer.value = false;
                            },
                            maxLines: 7,
                            color: AppColor.whiteColor,
                            textStyle:
                                TextStyle(color: AppColors.grey, fontSize: 14),
                            style: const TextStyle(
                                fontSize: 16, color: AppColors.grey),
                            cursorColor: Colors.black),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            button(
                                onTap: () async {
                                  if (controller.myController.text.isNotEmpty) {
                                    if (controller.data.isNotEmpty) {
                                      List<String> tempList = [];
                                      tempList
                                          .add(controller.myController.text);
                                      SharedPrefs.numberList(tempList);
                                      // List<String> data = await SharedPrefs.getNumberList();

                                      // AppSharedPreference.setLastNumber(tempList);
                                      // tempList.add(controller.myController.text);
                                      // AppSharedPreference.setLastNumberCode(controller.myController.text);
                                      // tempList.add(controller.data.value);
                                      controller.url.value =
                                          "https://wa.me/+${controller.data.value}${controller.myController.text}?text=${controller.textController.text}";
                                      await launch(controller.url.value);
                                      print("------${controller.url.value}");
                                    } else {
                                      AppSnackBar.showErrorSnackBar(
                                        message: "Please enter Country Code",
                                        title: 'Error',
                                        snackPosition: SnackPosition.TOP,
                                      );
                                    }
                                  } else {
                                    AppSnackBar.showErrorSnackBar(
                                      message: "Please enter Phone Number",
                                      title: 'Error',
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  }
                                },
                                text: StringsUtils.openWhatsApp,
                                iconData: Icons.whatsapp,
                                textColor: AppColor.whiteColor,
                                boxColor: AppColors.darkBlue,
                                iconColor: Colors.green),
                            button(
                                onTap: () async {
                                  if (controller.myController.text.isNotEmpty) {
                                    if (controller.data.isNotEmpty) {
                                      // AppSharedPreference.setLastNumber(
                                      //     controller.myController.text);
                                      // AppSharedPreference.setLastNumberCode(
                                      //     controller.data.value);
                                      await Geolocator.requestPermission();
                                      if (await Permission.location.isGranted) {
                                        Position? position;
                                        try {
                                          position = await Geolocator
                                              .getCurrentPosition(
                                            desiredAccuracy: LocationAccuracy
                                                .bestForNavigation,
                                            timeLimit:
                                                const Duration(seconds: 5),
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
                                    } else {
                                      AppSnackBar.showErrorSnackBar(
                                        message: "Please enter Country Code",
                                        title: 'Error',
                                        snackPosition: SnackPosition.TOP,
                                      );
                                    }
                                  } else {
                                    AppSnackBar.showErrorSnackBar(
                                      message: "Please enter Phone Number",
                                      title: 'Error',
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  }
                                },
                                text: StringsUtils.shareLocation,
                                iconData: Icons.location_on_outlined,
                                boxColor: AppColor.whiteColor,
                                textColor: AppColors.black,
                                iconColor: Colors.green),
                          ],
                        ),
                        showNumericContainer.value
                            ? NumPad(
                                buttonSize: 15.w,
                                buttonColor: AppColors.darkBlue,
                                iconColor: AppColors.green,
                                controller: controller.myController,
                                delete: () {
                                  controller.myController.text =
                                      controller.myController.text.substring(
                                          0,
                                          controller.myController.text.length -
                                              1);
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
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
