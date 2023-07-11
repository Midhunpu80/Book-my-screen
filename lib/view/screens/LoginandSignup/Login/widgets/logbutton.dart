import 'package:bookticket/service/user/Authentication/Login/authLogin.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/Home.dart';
import 'package:bookticket/view/screens/LoginandSignup/Login/Login.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

////<-------Login Button--------->///
Widget newlogbutton() {
  // ignore: unused_local_variable
  final controller = Get.put(authLogin());
  return SizedBox(
    height: 7.h,
    width: 70.w,
    child: ElevatedButton.icon(
      onPressed: () async {
        authLogin s = authLogin();

        if (formkey2.currentState!.validate()) {
          //  Get.to(const Home());
          s.getLogin(email: email2.text, password: pass2.text);
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
