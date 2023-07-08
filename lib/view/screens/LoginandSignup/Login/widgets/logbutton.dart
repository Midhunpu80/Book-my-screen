import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/Home.dart';
import 'package:bookticket/view/screens/LoginandSignup/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sizer/sizer.dart';

Widget newlogbutton() {
  return SizedBox(
    height: 7.h,
    width: 70.w,
    child: ElevatedButton.icon(
      onPressed: () {
        if (formkey2.currentState!.validate()) {
          Get.to(const Home());
        } else {
          // ignore: avoid_print
          print("data");
        }
      },
      icon: const Icon(
        Icons.login,
        color: Colors.transparent,
      ),
      label: alltext(txt: "Login", col: wh, siz: 14.sp, wei: FontWeight.bold),
      style: ElevatedButton.styleFrom(backgroundColor: blu),
    ),
  );
}
