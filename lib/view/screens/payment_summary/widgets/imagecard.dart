import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/selectSeats/widget/seats.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget imagecard({required var img}) {
  return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.h),
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover)));
}

Widget detailscard(
    {required var moviename,
    required var screen,
    required var ownername,
    required var date,
    required var showtime,
    required var location}) {
  return SizedBox(
    height: 50.h,
    width: 35.w,
    child: Column(
      children: [
        readetailcontainer(
            txt:
                "${button_controllers.countickets.map((element) => element.toString()).toList()}",
            siz: 5.h,
            txtsize: 9.sp,
            col: bl),
        readetailcontainer(
            txt: "(${button_controllers.counter.toString()}Tickets)",
            siz: 5.h,
            txtsize: 8.sp,
            col: bl),
        readetailcontainer(
            txt: "Screen-${screen.toString()}",
            siz: 4.h,
            txtsize: 8.sp,
            col: bl),
        readetailcontainer(
            txt: moviename.toString(), siz: 4.h, txtsize: 8.sp, col: bl),
        readetailcontainer(
            txt: "${ownername.toString()}:${location.toString()}",
            siz: 4.h,
            txtsize: 8.sp,
            col: bl),
        readetailcontainer(
            txt: "${showtime}|${date}", siz: 4.h, txtsize: 8.sp, col: bl),
      ],
    ),
  );
}

readetailcontainer(
    {var txt, double? siz, required double? txtsize, required Color col}) {
  return SizedBox(
    height: siz,
    child: Center(
        child:
            alltext(txt: txt, col: col, siz: txtsize!, wei: FontWeight.bold)),
  );
}
