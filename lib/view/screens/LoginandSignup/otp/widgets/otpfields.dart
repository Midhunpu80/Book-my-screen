// ignore_for_file: non_constant_identifier_names

import 'package:bookticket/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

Widget otp_fields(
    {required String mess,
    required TextEditingController cont,
    required var type,
    required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.only(left: 1.h, right: 1.h),
    child: Container(
      height: 7.h,
      width: 12.w,
      decoration: BoxDecoration(),
    
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.length == 1) {
            FocusScope.of(context).previousFocus();
          }
        },
        style: TextStyle(
       color: wh
          ,
          fontSize: 16.sp,
        ),
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        keyboardType: type,
        controller: cont,
        decoration: InputDecoration(
          prefixIconColor: bl,
          filled: true,
          fillColor: gy.withOpacity(0.3),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 10.w, color: pp),
            borderRadius: BorderRadius.circular(1.h),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return mess;
          } else if (value.length < 6) {
            return "Enter Minimum 6 Key words ";
          } else {
            return null;
          }
        },
      ),
    ),
  );
}
