// ignore_for_file: prefer_const_constructors

import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/userorders/previous_booking.dart';
import 'package:bookticket/view/screens/userorders/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class userorders_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: re,
          appBar: AppBar(
            title: alltext(
                txt: "Booking Status",
                col: wh,
                siz: 12.sp,
                wei: FontWeight.bold),
            centerTitle: true,
            leading: back(),
            bottom: TabBar(
              indicatorPadding: EdgeInsets.only(bottom: 1.h),

              // indicatorPadding:EdgeInsets.all(5.h),
              labelStyle: TextStyle(
                  color: wh, fontSize: 11.sp, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h),
                color: wh,
              ),
              indicatorColor: wh,
              labelColor: bl,
              //labelPadding: EdgeInsets.only(bottom: 1.h,top: 1.h,right: 9.h),
              tabs: const [
                Tab(
                  text: "Upcoming Booking",
                ),
                Tab(
                  text: "Previous Booking",
                )
              ],
            ),
            backgroundColor: bl,
          ),
          body: TabBarView(children: [
            upcoming_booking_screen(),
            previous_booking_screen(),
          ]),
        ));
  }
}
