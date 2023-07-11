import 'package:bookticket/service/user/Authentication/otp/OTPauth.dart';
import 'package:bookticket/service/user/Authentication/otp/forgetOtp.dart';
import 'package:bookticket/service/user/Authentication/singup/signup.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/LoginandSignup/otp/otp.dart';
import 'package:bookticket/view/screens/LoginandSignup/register/register.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

final h = Get.put(authsignup());
final s = Get.put(autforget());
////<-------otp verify button---------->///
Widget verifyotp() {
  String otpsnumber =
      con1.text + con2.text + con3.text + con4.text + con5.text + con6.text;
  return SizedBox(
    height: 5.h,
    width: 70.w,
    child: ElevatedButton.icon(
      onPressed: () async {
        // print("${otpsnumber.toString()}");

        h.getsignup(
            name: Regname.text.toString(),
            email: Regemail.text.toString(),
            phone: Regphone.text.toString(),
            password: Regpass.text.toString(),
            password2: Regpass.text.toString(),
            otp: otpsnumber);
        s.getForget_Otp(otp: otpsnumber.toString());

        //  print("--------------------------${all.toString()}");
      },
      icon: const Icon(
        Icons.login,
        color: Colors.transparent,
      ),
      label: alltext(
          txt: "Verify", col: Colors.white, siz: 14.sp, wei: FontWeight.bold),
      style: ElevatedButton.styleFrom(backgroundColor: pp),
    ),
  );
}
