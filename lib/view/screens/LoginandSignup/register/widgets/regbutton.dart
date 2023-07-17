// ignore_for_file: non_constant_identifier_names

import 'package:bookticket/service/user/Authentication/otp/OTPauth.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/LoginandSignup/Login/Login.dart';
import 'package:bookticket/view/screens/LoginandSignup/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

////<------register button---------->///
Widget regbutton() {
  return SizedBox(
    height: 7.h,
    width: 70.w,
    child: ElevatedButton.icon(
      onPressed: () async {
        ////<-------validate ---------->///
        if (formkey.currentState!.validate()) {
          authOTP s = authOTP();
          s.getOtp(
            email: Regemail.text,
          );

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
        Get.to(login());
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
