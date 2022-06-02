import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:whatsdirect/modules/controller/controller.dart';
import 'package:whatsdirect/modules/num_pad.dart';
import 'package:whatsdirect/utils/app_color.dart';
import 'package:whatsdirect/utils/string_utils.dart';
import 'package:whatsdirect/widgets/button_box.dart';
import 'package:whatsdirect/widgets/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Get.put(Controller());
  TextEditingController myController = TextEditingController();
  TextEditingController textController = TextEditingController();

  // launchWhatsApp() async {
  //   const link = WhatsAppUnilink(
  //     phoneNumber: "+918155970347",
  //     text: "",
  //   );
  //   await launch('$link');
  // }

  launchWhatsApp() async{
  // final url =
  //     "https://wa.me/+${data}${myController}?text=${textController}";
  // await launch(url);

  }

  String url = '';

  // void launchUrl() async {
  //   if (!await launchUrl(url)) throw 'Could not launch $url';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Stack(
          children: [
            Image.asset(
              "assets/image/Splesh Screen background.png",
              width: 100.w,
              height: 100.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.w, left: 5.w, right: 5.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "WhatsDirect",
                          style: TextStyle(
                              fontSize: 24,
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(Icons.more_vert_rounded)
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    phoneNumberTextField(
                      myController,
                      false,
                      controller.focusNodes,
                      StringsUtils.phoneNumber,
                      TextInputType.none,
                          (country) {
                        // data = country.dialCode;
                        //  url =
                        //     "https://wa.me/+${country.dialCode}${myController}?text=${textController}";
                        print('Country changed to: ' + country.dialCode);
                      },
                      // (value){
                      //   data = "${value}";
                      //   print("000000000000000000000000$myController");
                      // }
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    textField(textController, true, controller.focusNode,
                        StringsUtils.typeYourMessage, TextInputType.text),
                    SizedBox(
                      height: 8.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        button(
                            onTap: ()async{
                              // url =
                              // "https://wa.me/+${country.dialCode}${myController}?text=${textController}";
                              // await launch(url);
                            },
                              // if (myController.value.text.isNotEmpty) {
                              // } else {
                              //   Get.snackbar(
                              //     "Error",
                              //     "Enter Phone Number",
                              //     snackPosition: SnackPosition.TOP,
                              //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                              //
                              //     colorText: Colors.black,
                              //     borderRadius: 10,
                              //     icon: Image.asset(
                              //       "assets/image/star.png",
                              //       height: 25,
                              //       width: 25,
                              //     ),
                              //   );
                              // }
                          //  },
                            text: StringsUtils.openWhatsApp,
                            iconData: Icons.whatsapp,
                            iconColor: Colors.green),
                        button(
                            onTap: () {},
                            text: StringsUtils.shareLocation,
                            iconData: Icons.location_on_outlined,
                            iconColor: Colors.green),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    controller.isOpenKeyboard.value
                        ? const SizedBox()
                        : NumPad(
                            buttonSize: 15.w,
                            buttonColor: AppColors.darkBlue,
                            iconColor: Colors.deepOrange,
                            controller: myController,
                            delete: () {
                              myController.text = myController.text
                                  .substring(0, myController.text.length - 1);
                            },
                            clear: () {
                              myController.clear();
                            },
                            onSubmit: () {
                              debugPrint('Your code: ${myController.text}');
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  content: Text(
                                    "You code is ${myController.text}",
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
          ],
        ),
      ),
    );
  }
}
