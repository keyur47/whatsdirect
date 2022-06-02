import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sizer/sizer.dart';

Widget phoneNumberTextField(TextEditingController? controller, bool? showCursor,
    FocusNode? focusNode, String hintText, TextInputType textInputType,ValueChanged<Country>? valueChanged) {
  return Container(
    height: 6.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.h), color: Colors.white),
    child: Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: IntlPhoneField(
        disableLengthCheck: true,
        dropdownIconPosition: IconPosition.trailing,
        dropdownIcon: const Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Colors.black,
        ),
        onCountryChanged: valueChanged,
        // onChanged: (phone) {
        //   print("-------------${phone.countryCode}");
        // },
        // onCountryChanged:  valueChanged,
        // onCountryChanged: (country) {
        //
        //
        //   print('Country changed to: ' + country.dialCode);
        // },
         initialCountryCode: 'IN',
        showCountryFlag: false,
        invalidNumberMessage: "",
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 1.8.h),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
        ),
        controller: controller,
        showCursor: showCursor,
        style: const TextStyle(
          fontSize: 16,
        ),
        keyboardType: textInputType,
        cursorColor: Colors.black,
      ),
    ),
  );
}

Widget textField(TextEditingController? controller, bool? showCursor,
    FocusNode? focusNode, String? hintText, TextInputType textInputType) {
  return Container(
    height: 18.h,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(2.w)),
    child: Padding(
      padding: EdgeInsets.only(left: 2.w),
      child: TextFormField(
        maxLines: 100,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
        controller: controller,
        showCursor: showCursor,
        style: const TextStyle(fontSize: 16),
        keyboardType: textInputType,
        focusNode: focusNode,
        cursorColor: Colors.black,
      ),
    ),
  );
}
