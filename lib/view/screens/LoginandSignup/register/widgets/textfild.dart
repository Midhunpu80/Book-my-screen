import 'package:bookticket/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget textfield(
    String hint, IconData ico, String mess, TextEditingController cont,var type) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 7.h,
      child: TextFormField(
        keyboardType:type ,

        controller: cont,
        decoration: InputDecoration(
            prefixIconColor: bl,
            filled: true,
           // helperText: "love",
            // ignore: sort_child_properties_last
            prefixIcon: Icon(ico),
            fillColor: gy.withOpacity(0.3),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(1.h),
            ),
            hintText: hint,
            hintStyle: TextStyle(color: bl,fontSize: 8.sp)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return mess ?? "error";
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
