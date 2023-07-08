// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget head() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 38.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.h),
        color: re,
        gradient: LinearGradient(
            colors: [pp, yl, re, pp],
            begin: Alignment.bottomLeft,
            end: Alignment.topCenter),
      ),
      // ignore: prefer_const_constructors
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            CircleAvatar(
              backgroundColor: wh,
              radius: 9.h,
              backgroundImage: const AssetImage(
                "images/cas.jpg",
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              child: alltext(
                  txt: "Midhun pu", col: wh, siz: 15.sp, wei: FontWeight.bold),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              child: alltext(
                  txt: "midhunpu80@gmail.com",
                  col: bl,
                  siz: 12.sp,
                  wei: FontWeight.bold),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              child: alltext(
                  txt: "Ph:9061603159",
                  col: bl,
                  siz: 11.sp,
                  wei: FontWeight.bold),
            )
          ],
        ),
      ),
    ),
  );
}
