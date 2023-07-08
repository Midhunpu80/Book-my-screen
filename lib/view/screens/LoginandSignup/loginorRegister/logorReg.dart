import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/LoginandSignup/Login/Login.dart';
import 'package:bookticket/view/screens/LoginandSignup/register/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class logorReg extends StatelessWidget {
  const logorReg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wh,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: 40.h,
              width: 200.w,
              color: wh,
              child:
                  Lottie.asset("images/72235-watch-a-movie-with-popcorn.json"),
            ),
            SizedBox(
              height: 8.h,
            ),
            alltext(
                txt: "create new account ?",
                col: bl,
                siz: 13.sp,
                wei: FontWeight.bold),
            SizedBox(
              height: 3.h,
            ),

            SizedBox(
                width: 80.w,
                height: 6.h,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(register());
                    },
                    child: alltext(
                        txt: "Register",
                        col: wh,
                        siz: 13.sp,
                        wei: FontWeight.bold),
                    style: ElevatedButton.styleFrom(backgroundColor: blu))),
            SizedBox(
              height: 2.h,
            ),
            alltext(txt: "or", col: bl, siz: 13.sp, wei: FontWeight.bold),
            SizedBox(
              height: 2.h,
            ),

            SizedBox(
                width: 80.w,
                height: 6.h,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(login());
                    },
                    child: alltext(
                        txt: "Login",
                        col: wh,
                        siz: 13.sp,
                        wei: FontWeight.bold),
                    style: ElevatedButton.styleFrom(backgroundColor: yl))),
            SizedBox(
              height: 5.h,
            ),
            alltext(
                txt: "Alredy have an account ? Signup",
                col: bl,
                siz: 11.sp,
                wei: FontWeight.bold)
          ],
        ),
      ),
    );
  }
}
