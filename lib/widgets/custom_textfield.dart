import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';
import 'package:whatsdirect/utils/app_color.dart';


Widget phoneNumberTextField({
  required TextEditingController? controller,
  required bool? showCursor,
  required FocusNode? focusNode,
  required String? hintText,
  required TextInputType textInputType,
  required ValueChanged<Country>? valueChanged,
  required GestureTapCallback onTap,
}) {
  return Container(
    height: 6.h,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(5.h),
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor.withOpacity(0.8),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white),
    child: SizedBox(
      height: 4.h,
      child: Padding(
        padding: EdgeInsets.only(
          left: 3.w,
          top: 2.w,
          bottom: 2.w,
        ),
        child: IntlPhoneField(
          disableLengthCheck: true,
          dropdownIconPosition: IconPosition.leading,
          dropdownIcon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.darkBlue,
          ),
          flagsButtonMargin: EdgeInsets.only(right: 3.w),
          dropdownDecoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey, width: 1)),
          ),
          onCountryChanged: valueChanged,
          initialCountryCode: "",
          dropdownTextStyle: const TextStyle(color: AppColors.grey, fontSize: 16),
          showDropdownIcon: true,
          showCountryFlag: false,
          invalidNumberMessage: "",
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isCollapsed: true,
            suffixIcon:
                GestureDetector(onTap: onTap, child: const Icon(Icons.history,color: AppColors.green,)),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.grey),
          ),
          controller: controller,
          showCursor: showCursor,
          style: const TextStyle(
            fontSize: 16,
              color: AppColors.grey
          ),
          keyboardType: textInputType,
          cursorColor: Colors.black,
        ),
      ),
    ),
  );
}

///
Widget textField(TextEditingController? controller, bool? showCursor,
    FocusNode? focusNode, String? hintText, TextInputType textInputType) {
  return Container(
    height: 18.h,
    decoration: BoxDecoration(
        color: AppColor.whiteColor, borderRadius: BorderRadius.circular(2.w)),
    child: Padding(
      padding: EdgeInsets.only(left: 2.w),
      child: TextFormField(
        maxLines: 100,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle( color: AppColors.grey,fontSize: 15),
        ),
        controller: controller,
        showCursor: showCursor,
        style: const TextStyle(fontSize: 16, color: AppColors.grey),
        keyboardType: textInputType,
        focusNode: focusNode,
        cursorColor: Colors.black,
      ),
    ),
  );
}
