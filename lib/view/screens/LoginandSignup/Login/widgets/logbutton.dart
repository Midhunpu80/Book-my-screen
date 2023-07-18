import 'package:bookticket/service/user/Authentication/Login/authLogin.dart';
import 'package:bookticket/service/user/allmovies/allmoviesSevice.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/LoginandSignup/Login/Login.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

////<-------Login Button--------->///
Widget newlogbutton() {
  // ignore: unused_local_variable
  final controller = Get.put(authLogin());
  final con2 = Get.put(service_ViewMovies());
  final con1 = Get.put(ServiceViewMovies());
  return SizedBox(
    height: 7.h,
    width: 70.w,
    child: ElevatedButton.icon(
      onPressed: () async {
        authLogin s = authLogin();

        if (formkey2.currentState!.validate()) {
          s.getLogin(email: email2.text, password: pass2.text);
          con2.getViewMovies();

          // ignore: unused_local_variable
          var sata = con2.reply.data.map((e) => e.movieId).forEach((element) {
            con1.getMovies(ids: element);
          });
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
