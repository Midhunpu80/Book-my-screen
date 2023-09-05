// ignore_for_file: prefer_const_constructors

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget upcomingdataList() {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Card(
      color: bl,
      child: SizedBox(
        height: 82.h,
        width: 200.w,
        child: ListView.separated(
            reverse: true,
            itemBuilder: (context, index) {
              final activesdata =
                  getalluser_order.reply.data.activeOrders[index];

              return Card(
                child: Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.h), color: wh),
                  child: Row(
                    children: [
                      Container(
                        width: 37.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(1.h),
                                bottomLeft: Radius.circular(1.h)),
                            color: bl.withOpacity(0.3),
                            image: DecorationImage(
                                image: NetworkImage(
                                  activesdata.image.toString(),
                                ),
                                fit: BoxFit.cover)),
                      ),
                      upcomingticketdetails(
                          moviename: activesdata.movieName,
                          lang: activesdata.language,
                          screen: activesdata.screen,
                          seats: activesdata.selectedSeats
                              .map((e) => e.id)
                              .toList(),
                          ownername: activesdata.ownerName,
                          location: activesdata.location,
                          date: activesdata.date,
                          showtime: activesdata.showTime,
                          qyt: activesdata.selectedSeats.length,
                          price: activesdata.total)
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 1.h,
              );
            },
            itemCount: getalluser_order.reply.data.activeOrders.length),
      ),
    ),
  );
}

Widget upcomingticketdetails(
    {required var moviename,
    required var lang,
    required var screen,
    required var seats,
    required var ownername,
    required var location,
    required var date,
    required var showtime,
    required var qyt,
    required var price}) {
  return Padding(
    padding: EdgeInsets.only(left: 5.h),
    child: SizedBox(
      height: 50.h,
      width: 45.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          alltext(
              txt:
                  // ignore: unnecessary_string_interpolations
                  "${moviename.toString().substring(10, moviename.toString().length)}",
              col: bl,
              siz: 12.sp,
              wei: FontWeight.bold),
          alltext(
              txt:
                  "(${lang.toString().substring(9, lang.toString().length)})  | screen-${screen.toString()}",
              col: bl,
              siz: 9.sp,
              wei: FontWeight.bold),
          alltext(
              txt:
                  "Seats:${seats.toString().substring(1, seats.toString().length - 1)}",
              col: bl,
              siz: 8.sp,
              wei: FontWeight.bold),
          alltext(
              txt:
                  "${ownername.toString().substring(10, ownername.toString().length)} | ${location.toString().substring(9, location.toString().length)}",
              col: bl,
              siz: 9.sp,
              wei: FontWeight.bold),
          alltext(
              txt:
                  "${date.toString().substring(0, 11)} | ${showtime.toString().toString().substring(9, showtime.toString().length)}",
              col: bl,
              siz: 8.sp,
              wei: FontWeight.bold),
          alltext(
              txt: "Qyt:${qyt.toString()}         Rs : ₹${price.toString()}",
              col: bl,
              siz: 8.sp,
              wei: FontWeight.bold),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 3.h,
                width: 20.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.h), color: gr),
                child: Center(
                    child: alltext(
                        txt: "Ticket",
                        col: wh,
                        siz: 8.sp,
                        wei: FontWeight.bold)),
              ),
              SizedBox(
                width: 5.5,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 3.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.h), color: re),
                  child: Center(
                      child: alltext(
                          txt: "cancel",
                          col: wh,
                          siz: 8.sp,
                          wei: FontWeight.bold)),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
