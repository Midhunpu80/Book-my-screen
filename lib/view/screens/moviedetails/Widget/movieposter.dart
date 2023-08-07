import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

////<-------movie poster-------->///
Widget movieposter(String img) {
  return Container(
    height: 55.h,
    width: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.h),
        image: DecorationImage(
            image: NetworkImage(
              "https://image.tmdb.org/t/p/original/${img.toString()}",
            ),
            fit: BoxFit.cover),
        color: gy.withOpacity(0.3)),
    child:
        Image.network("https://image.tmdb.org/t/p/original/${img.toString()}"),
  );
}

////<-------Movie language --------->///
Widget langaugaecard({required String lan}) {
  return Container(
    height: 25,
    width: 25,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: wh,
    ),
    ////<-------Language of the movie --------->///
    child: Center(
        child: alltext(txt: lan, col: bl, siz: 10.sp, wei: FontWeight.bold)),
  );
}

////<-------Movie titiel and rating others --------->///
Widget titlecard(
    {required title,
    required var dur,
    required var rating,
    required var votes,
    required var dates,
    required var genre}) {
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
          ////<-------movie Rating --------->///
          alltext(
              txt: rating.toString(),
              col: wh,
              siz: 11.sp,
              wei: FontWeight.w400),
        ],
      ),
      ////<-------Movie votes------>///
      alltext(txt: "votes:${votes}", col: wh, siz: 9.sp, wei: FontWeight.bold),
      const SizedBox(
        height: 1,
      ),
      ////<-------Movie duration-------->///
      Row(
        children: [
          alltext(
              txt: "${dur.toString()}min",
              col: wh,
              siz: 9.sp,
              wei: FontWeight.bold),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: SizedBox(
              height: 3.h,
              width: 52.w,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genre.length,
                  itemBuilder: (context, index) {
                    return alltext(
                        txt: "${genre[index]}",
                        col: wh,
                        siz: 9.sp,
                        wei: FontWeight.bold);
                  }),
            ),
          ),
          alltext(
              txt: "${dates.toString().substring(0, 10)}",
              col: wh,
              siz: 9.sp,
              wei: FontWeight.bold)
        ],
      )
    ],
  );
}

////<-------subtitle of the movie --------->///
Widget subtitlecard(String overview) {
  return Column(
    children: [
      alltext(
          txt: overview.toString(), col: wh, siz: 8.sp, wei: FontWeight.bold)
    ],
  );
}
