// ignore_for_file: file_names

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/payment_summary/widgets/imagecard.dart';
import 'package:bookticket/view/screens/selectSeats/widget/seats.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget paymentcard(
    {required var img,
    required var moviename,
    required var screen,
    required var ownername,
    required var date,
    required var showtime,
    required var location}) {
  /// dynamic convicefee = seat_controll.allseat.data.showData.price / 6;

// dynamic  ticketprice = button_controllers.price;
// button_controllers.totals =ticketprice + convicefee;
  double ticketprice = button_controllers.price.value.toDouble();
  double convicefee = seat_controll.allseat.data.showData.price / 6.toDouble();
  dynamic data = ticketprice.toDouble() + convicefee.toDouble();

  return Padding(
    padding: EdgeInsets.all(1.0.h),
    child: Card(
      child: Container(
        height: 65.h,
        width: 100.w,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(2.h), color: wh),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.h), color: wh),
                height: 30.h,
                //  color: yl,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imagecard(img: img),
                      detailscard(
                          moviename: moviename,
                          date: date,
                          location: location,
                          screen: screen,
                          ownername: ownername,
                          showtime: showtime),
                    ],
                  ),
                ),
              ),
            ),
            alltext(
                txt: "------------------------------------------------",
                col: gy,
                siz: 11.sp,
                wei: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  readetailcontainer(txt: "Sub Total", txtsize: 10.sp, col: bl),
                  readetailcontainer(
                      txt: "₹${button_controllers.price.toString()}",
                      txtsize: 10.sp,
                      col: bl),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  readetailcontainer(
                      txt: "convince fees", siz: 5.h, txtsize: 11.sp, col: bl),
                  readetailcontainer(
                      txt: "₹${convicefee.toString().substring(0, 4)}",
                      siz: 5.h,
                      txtsize: 11.sp,
                      col: bl),
                ],
              ),
            ),
            alltext(
                txt: "------------------------------------------------",
                col: gy,
                siz: 11.sp,
                wei: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  readetailcontainer(
                      txt: "Total Amount", siz: 5.h, txtsize: 11.sp, col: gr),
                  readetailcontainer(
                      txt: "₹${data.toString().substring(0, 5)}",
                      siz: 5.h,
                      txtsize: 11.sp,
                      col: gr),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
