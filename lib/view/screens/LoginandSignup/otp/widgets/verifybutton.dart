import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/LoginandSignup/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sizer/sizer.dart';

Widget verifyotp() {
  return SizedBox(
    height: 5.h,
    width: 70.w,
    child: ElevatedButton.icon(
      onPressed: () {
        Get.to(login());
      },
      icon: const Icon(
        Icons.login,
        color: Colors.transparent,
      ),
      label: alltext(txt: "Verify", col: Colors.white, siz: 14.sp, wei: FontWeight.bold),
      style: ElevatedButton.styleFrom(backgroundColor: pp),
    ),
  );
}
