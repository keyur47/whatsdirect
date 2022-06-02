import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget button(
    {required String text,
     required VoidCallback onTap,
    required IconData iconData,
    required Color iconColor}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 14.w,
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.w)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 2.w, right: 2.w),
          child: Row(
            children: [
              Icon(
                iconData,
                color: iconColor,
              ),
              SizedBox(width: 1.w,),
              Text(
                text,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


