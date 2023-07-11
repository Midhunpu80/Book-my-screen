import 'package:bookticket/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: non_constant_identifier_names
////<-------textfield--------->///
Widget pro_textfield(String hint, IconData ico, String mess,
    TextEditingController cont, var type, String help) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 9.h,
      width: 65.w,
      child: TextFormField(
        style: TextStyle(color: bl),
        keyboardType: type,

        controller: cont,
        decoration: InputDecoration(
            helperText: help,
            prefixIconColor: bl,
            filled: true,
            // ignore: sort_child_properties_last
            prefixIcon: Icon(ico),
            fillColor: wh,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(1.h),
            ),
            hintText: hint,
            helperStyle: TextStyle(color: wh, fontSize: 9.sp),
            hintStyle: TextStyle(color: bl, fontSize: 9.sp)),
        ////<-------validation--------->///
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


