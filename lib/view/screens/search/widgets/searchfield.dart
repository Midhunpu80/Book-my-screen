// ignore_for_file: non_constant_identifier_names

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/search/widgets/movielist.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget search_textfield(
    {required String hint,
    required IconData ico,
    required String mess,
    required TextEditingController cont,
    required var type,
    required String help}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 9.h,
      child: TextFormField(
        onChanged: (val) {
          // serch_contol.fetch(val);
          serch_contolx.newfetch(val.toString());

          /// sss.function(val.toString());
        },

        style: TextStyle(color: wh),
        keyboardType: type,
        // controller: cont,
        decoration: InputDecoration(
            helperText: help,
            prefixIconColor: wh,
            filled: true,
            // ignore: sort_child_properties_last
            prefixIcon: Icon(ico),
            fillColor: gy.withOpacity(0.3),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(1.h),
            ),
            hintText: hint,
            hintStyle: TextStyle(color: wh, fontSize: 10.sp)),
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
