// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, must_be_immutable

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/payment_summary/widgets/payment%20card.dart';
import 'package:bookticket/view/screens/selectSeats/widget/seats.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class payment_summary_screen extends StatelessWidget {
  var img;
  var moviename;
  var screen;
  var ownername;
  var date;
  var showtime;
  var location;
  // ignore: use_key_in_widget_constructors
  payment_summary_screen(
      {required this.img,
      required this.moviename,
      required this.screen,
      required this.ownername,
      required this.date,
      required this.showtime,
      required this.location});
  double ticketprice = button_controllers.price.value.toDouble();
  double convicefee = seat_controll.allseat.data.showData.price / 6.toDouble();
// button_controllers.totals = ticketprice.toDouble() + convicefee.toDoible();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SizedBox(
          width: 90.w,
          height: 6.h,
          child: FloatingActionButton(
            onPressed: () {
              ///dynamic sw = convicefee.toString().substring(0, 2);
              dynamic data = ticketprice.toDouble() + convicefee.toDouble();
              // ignore: avoid_print
              print(data);
            },
            child: alltext(
                txt: "procced", col: wh, siz: 12.sp, wei: FontWeight.bold),
            backgroundColor: re,
          ),
        ),
        backgroundColor: bl,
        appBar: AppBar(
          backgroundColor: bl,
          leading: back(),
          centerTitle: true,
          title: alltext(
              txt: "Booking-Summary",
              col: wh,
              siz: 12.sp,
              wei: FontWeight.bold),
          toolbarHeight: 8.h,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 4.h,
              ),
              paymentcard(
                  img: img,
                  moviename: moviename,
                  date: date,
                  ownername: ownername.toString(),
                  showtime: showtime.toString(),
                  screen: screen.toString(),
                  location: location.toString()),
            ],
          ),
        ));
  }
}
