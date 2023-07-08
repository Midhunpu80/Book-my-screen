import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
              onPressed: () {},
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
