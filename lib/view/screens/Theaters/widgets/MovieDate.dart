// ignore_for_file: file_names

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

bool isfalse = true;

Widget moviedate() {
  return SliverAppBar(
    //  pinned: true,
    floating: true,
    stretch: true,

    toolbarHeight: 14.h,
    backgroundColor: bl.withOpacity(0.3),
    leading: const Icon(
      Icons.abc,
      color: Colors.transparent,
    ),
    flexibleSpace: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        datecard("MON", "6", "JUL", gy.withOpacity(0.3)),
        datecard("TUE", "7", "JUL", re),
        datecard("WED", "8", "JUL", gy.withOpacity(0.3))
      ],
    ),
  );
}

Widget datecard(String data, String day, String month, Color col) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      splashColor: gy,
      onTap: () {
        print("data");
      },
      child: Container(
        decoration: BoxDecoration(
            color: col,
            border: Border.all(width: 1, color: wh),
            borderRadius: BorderRadius.circular(1.h)),
        height: 12.h,
        width: 18.w,
        child: Column(
          children: [
            Center(
              child:
                  alltext(txt: data, col: wh, siz: 11.sp, wei: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            alltext(txt: day, col: wh, siz: 11.sp, wei: FontWeight.w800),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: alltext(
                  txt: month, col: wh, siz: 11.sp, wei: FontWeight.w400),
            ),
          ],
        ),
      ),
    ),
  );
}
