// ignore_for_file: non_constant_identifier_names

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/LoginandSignup/Login/Login.dart';
import 'package:bookticket/view/screens/LoginandSignup/otp/otp.dart';
import 'package:bookticket/view/screens/LoginandSignup/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Widget regbutton() {
  return SizedBox(
    height: 7.h,
    width: 70.w,
    child: ElevatedButton.icon(
      onPressed: () {
        if (formkey.currentState!.validate()) {
          // Get.snackbar(title: const Text("is corrct "),backgroundColor: wh,messageText: const Text("now time"));

          getvalidate();
          // ignore: avoid_print
          print("is validate");
        } else {}
      },
      icon: Icon(
        Icons.verified,
        color: wh,
      ),
      label: alltext(txt: "Sign up", col: wh, siz: 14.sp, wei: FontWeight.bold),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
    ),
  );
}

Widget logbutton() {
  return SizedBox(
    height: 7.h,
    width: 70.w,
    child: ElevatedButton.icon(
      onPressed: () {
        Get.to(otpscreen());
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

getvalidate() {
  var NAME = email.text;
  var Email = email.text;
  var PHONE = email.text;
  var PASS = email.text;
  var REPASS = email.text;
  if (NAME.isNotEmpty ||
      Email.isNotEmpty ||
      PHONE.isNotEmpty ||
      PASS.isNotEmpty ||
      REPASS.isNotEmpty) {
    Get.to(login());
  } else {
    print("not");
  }
}
