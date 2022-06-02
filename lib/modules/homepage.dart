import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Controller controller = Get.put(Controller());

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
                          style: TextStyle(fontSize: 24,color: AppColors.darkBlue,fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.more_vert_rounded)
                      ],
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    phoneNumberTextField(controller.myController, false,
                        controller.focusNodes,
                        StringsUtils.phoneNumber,
                        TextInputType.none),
                    SizedBox(
                      height: 4.w,
                    ),
                    textField(
                        controller.textController,
                        true,
                        controller.focusNode,
                        StringsUtils.typeYourMessage,
                        TextInputType.text),
                    SizedBox(
                      height: 8.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        button(
                            text: StringsUtils.openWhatsApp,
                            iconData: Icons.whatsapp,
                            iconColor: Colors.green),
                        button(
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
                            controller: controller.myController,
                            delete: () {
                              controller.myController.text =
                                  controller.myController.text.substring(0,
                                      controller.myController.text.length - 1);
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
          ],
        ),
      ),
    );
  }
}
