import 'package:bookticket/service/user/Authentication/otp/resendOTP.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/LoginandSignup/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

////<-------resend otp --------->///
final resend = Get.put(authResendOTP());
Widget resendotp() {
  return Padding(
    padding: EdgeInsets.only(left: 7.h),
    child: Row(
      children: [
        SizedBox(
          child: alltext(
              txt: "Didnt you Recieve any code ?",
              col: gy,
              siz: 10.sp,
              wei: FontWeight.bold),
        ),
        SizedBox(
          child: TextButton(
              onPressed: () {
                resend.getResendOtp(email: Regemail.text);
              },
              child: alltext(
                  txt: "Resend Code ",
                  col: pp,
                  siz: 10.sp,
                  wei: FontWeight.bold)),
        )
      ],
    ),
  );
}
