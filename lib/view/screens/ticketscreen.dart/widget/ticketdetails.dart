// ignore_for_file: non_constant_identifier_names

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget ticket_details() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.h),
              image: const DecorationImage(
                  image: AssetImage("images/download.png"))),
          width: 28.w,
          height: 15.h,
        ),
      ),
      alltext(txt: "Booking ID", col: bl, siz: 9.sp, wei: FontWeight.bold),
      alltext(
          txt: single_ticket.singleticket.data.bookingId.toString(),
          col: bl,
          siz: 16.sp,
          wei: FontWeight.bold),
      SizedBox(
        height: 9.h,
      ),
      alltext(
          txt: " .............................................................",
          col: bl,
          siz: 13.sp,
          wei: FontWeight.bold),
      SizedBox(
        height: 4.h,
      ),
      ticket_other_details(),
    ],
  );
}

Widget ticket_other_details() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 33.h,
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          alltext(
              txt: single_ticket.singleticket.data.movieName.toString(),
              col: bl,
              siz: 20.sp,
              wei: FontWeight.bold),
          alltext(
              txt: "(${single_ticket.singleticket.data.language.toString()})",
              col: bl,
              siz: 14.sp,
              wei: FontWeight.bold),
          alltext(
              txt: single_ticket.singleticket.data.userName.toString(),
              col: bl,
              siz: 10.sp,
              wei: FontWeight.bold),
          alltext(
              txt:
                  "${single_ticket.singleticket.data.location.toString()},screen(${single_ticket.singleticket.data.screen.toString()})",
              col: bl,
              siz: 10.sp,
              wei: FontWeight.bold),
          alltext(
              txt:
                  "${single_ticket.singleticket.data.showTime.toString()} ${single_ticket.singleticket.data.date.toString().substring(0, 11)}",
              col: bl,
              siz: 10.sp,
              wei: FontWeight.bold),
          alltext(
              txt:
                  "Quantity : ${single_ticket.singleticket.data.selectedSeats.length.toString()}",
              col: bl,
              siz: 10.sp,
              wei: FontWeight.bold),
          alltext(
              txt: single_ticket.singleticket.data.selectedSeats
                  .map((e) => e.id.toString())
                  .toList()
                  .toString()
                  .toString(),
              col: bl,
              siz: 10.sp,
              wei: FontWeight.bold),
          SizedBox(
            height: 2.h,
          ),
          alltext(
              txt:
                  ".........................................................................",
              col: bl,
              siz: 12.sp,
              wei: FontWeight.bold),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.add_box,
                  color: bl,
                ),
                label: alltext(
                    txt: "Amount paid",
                    col: bl,
                    siz: 10.sp,
                    wei: FontWeight.bold),
              ),
              alltext(
                  txt: "Rs:${single_ticket.singleticket.data.total.toString()}",
                  col: bl,
                  siz: 10.sp,
                  wei: FontWeight.bold)
            ],
          )
        ],
      ),
    ),
  );
}
