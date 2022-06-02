import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  TextEditingController myController = TextEditingController();
  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNodes = FocusNode();
  RxBool isOpenKeyboard  = false.obs;


  @override
  void onInit() {
    // TODO: implement dispose
    focusNode.addListener(() {
      //controller.isOpenKeyboard.value = controller.focusNode.hasFocus;
      // setState(() {});
   focusNode.hasFocus
          ? isOpenKeyboard.value = true
          : isOpenKeyboard.value = false;
    });
    super.onInit();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

}
