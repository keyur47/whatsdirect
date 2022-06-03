import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {

  TextEditingController myController = TextEditingController();
  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNodes = FocusNode();
  RxBool isOpenKeyboard  = false.obs;
  RxString url = ''.obs;
  RxString data = ''.obs;

  @override
    void onInit() {
      focusNode.addListener(() {
      //controller.isOpenKeyboard.value = controller.focusNode.hasFocus;// setState(() {});
      focusNode.hasFocus?isOpenKeyboard.value = true:isOpenKeyboard.value = false;
      });
     super.onInit();
   }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

}
