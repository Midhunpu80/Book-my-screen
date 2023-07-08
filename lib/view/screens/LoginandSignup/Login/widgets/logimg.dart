// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

Widget logimage() {
  // ignore: unused_local_variable
  var h;
  return SizedBox(
    height: 38.h,
    width: 100.w,
    child: Lottie.asset("images/sata.json"),
  );
}
