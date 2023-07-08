import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget movieposter(String img) {
  return Container(
    height: 55.h,
    width: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.h),
        image: DecorationImage(
            image: NetworkImage(
              img.toString(),
            ),
            fit: BoxFit.cover),
        color: gy.withOpacity(0.3)),
  );
}

Widget langaugaecard() {
  return Container(
    height: 25,
    width: 25,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: wh,
    ),
    child: Center(
        child: alltext(txt: "En", col: bl, siz: 10.sp, wei: FontWeight.bold)),
  );
}

Widget titlecard(String title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      alltext(txt: title, col: wh, siz: 12.sp, wei: FontWeight.bold),
      const SizedBox(
        height: 12,
      ),
      Row(
        //mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.star,
            color: yl,
            size: 2.h,
          ),
          alltext(
              txt: "StarRating: 222.4k",
              col: wh,
              siz: 11.sp,
              wei: FontWeight.w400),
        ],
      ),
      alltext(txt: " 2235 votes", col: wh, siz: 9.sp, wei: FontWeight.bold),
      const SizedBox(
        height: 12,
      ),
      alltext(
          txt: "2h 22m Action,. Crime,.Thriller. May 17, 2023",
          col: wh,
          siz: 9.sp,
          wei: FontWeight.bold)
    ],
  );
}

Widget subtitlecard() {
  return Column(
    children: [
      alltext(
          txt:
              "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever",
          col: wh,
          siz: 8.sp,
          wei: FontWeight.bold)
    ],
  );
}
