// import 'package:flutter/material.dart';
// import 'package:whatsdirect/utils/app_color.dart';
// import 'package:whatsdirect/utils/assets_path.dart';
// import 'package:whatsdirect/utils/size_utils.dart';
//
// class AppTextStyle {
//   AppTextStyle._();
//
//   static TextStyle defaultStyle = const TextStyle(
//     fontFamily: AssetsPath.roboto,
//     color: AppColors.black,
//     fontSize: 12,
//     height: 1.0, // Notes: Using Font Size without any baseline
//   );
//
//   static TextStyle bold = defaultStyle.copyWith(fontWeight: FontWeight.w700);
//   static TextStyle semiBold = defaultStyle.copyWith(fontWeight: FontWeight.w600);
//   static TextStyle medium = defaultStyle.copyWith(fontWeight: FontWeight.w500);
//   static TextStyle regular = defaultStyle.copyWith(fontWeight: FontWeight.w400);
//   static TextStyle light = defaultStyle.copyWith(fontWeight: FontWeight.w300);
//
//   static Map<int, TextStyle> bodyBold = {
//     18: bold.copyWith(fontSize: SizeUtils.fSize_18()),
//   };
//
//   static Map<int, TextStyle> bodySemiBold = {
//     15: semiBold.copyWith(fontSize: SizeUtils.fSize_15()),
//     16: semiBold.copyWith(fontSize: SizeUtils.fSize_16()),
//     13: semiBold.copyWith(fontSize: SizeUtils.fSize_13()),
//     18: semiBold.copyWith(fontSize: SizeUtils.fSize_18()),
//     20: semiBold.copyWith(fontSize: SizeUtils.fSize_20()),
//     30: semiBold.copyWith(fontSize: SizeUtils.fSize_30()),
//   };
//
//   static Map<int, TextStyle> bodyMedium = {
//     20: medium.copyWith(fontSize: SizeUtils.fSize_20()),
//     18: medium.copyWith(fontSize: SizeUtils.fSize_18()),
//     13: medium.copyWith(fontSize: SizeUtils.fSize_13()),
//     14: medium.copyWith(fontSize: SizeUtils.fSize_14()),
//   };
//
//   static Map<int, TextStyle> bodyRegular = {
//     10: regular.copyWith(fontSize: SizeUtils.fSize_10()),
//     12: regular.copyWith(fontSize: SizeUtils.fSize_12()),
//     13: regular.copyWith(fontSize: SizeUtils.fSize_13()),
//     14: regular.copyWith(fontSize: SizeUtils.fSize_14()),
//     15: regular.copyWith(fontSize: SizeUtils.fSize_15()),
//     16: regular.copyWith(fontSize: SizeUtils.fSize_16()),
//     18: regular.copyWith(fontSize: SizeUtils.fSize_18()),
//     20: regular.copyWith(fontSize: SizeUtils.fSize_20()),
//     24: regular.copyWith(fontSize: SizeUtils.fSize_24()),
//   };
//   static Map<int, TextStyle> bodyLight = {
//     10: light.copyWith(fontSize: SizeUtils.fSize_10()),
//     16: light.copyWith(fontSize: SizeUtils.fSize_16()),
//     14: light.copyWith(fontSize: SizeUtils.fSize_14()),
//   };
//
//   static Map<int, TextStyle> bodyLightItalic = {
//     16: defaultStyle.copyWith(fontSize: SizeUtils.fSize_16(), fontStyle: FontStyle.italic),
//   };
// }
