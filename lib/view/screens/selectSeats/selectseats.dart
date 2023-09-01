// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, must_be_immutable, unnecessary_string_interpolations, avoid_print

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/nav.dart';
import 'package:bookticket/view/screens/payment_summary/payment_summaryscreen.dart';
import 'package:bookticket/view/screens/selectSeats/widget/screen.dart';
import 'package:bookticket/view/screens/selectSeats/widget/seats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class selectseats extends StatelessWidget {
  var movie;
  var time;
  var date;
  var ownername;
  var img;
  var moviename;
  var screen;

  var showtime;
  var location;
  var lang;
  var ownerid;

  /// var ownername;

  selectseats(
      {super.key,
      required this.movie,
      required this.time,
      required this.date,
      required this.ownername,
      required this.img,
      required this.moviename,
      required this.location,
      required this.screen,
      required this.showtime,
      required this.lang,
      required this.ownerid});
  double ticketprice = button_controllers.price.value.toDouble();
  double convicefee = seat_controll.allseat.data.showData.price / 6.toDouble();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 80.w,
            height: 6.h,
            child: FloatingActionButton(
              onPressed: () {
                dynamic data = ticketprice.toDouble() + convicefee.toDouble();
                if (button_controllers.countickets.isEmpty) {
                  Get.snackbar("select seats ", "please select  seats ",
                      backgroundColor: blu);
                } else {
                  Get.to(() => payment_summary_screen(
                        moviename: moviename,
                        img: img,
                        location: location,
                        date: date,
                        screen: screen,
                        showtime: showtime,
                        ownername: ownername,
                      ));
                  dynamic loss = fetchapis.ofuser[0].data.id.toString();

                  payment_controll.getuserpayment(
                    username: fetchapis.ofuser[0].data.signName.toString(),
                    fees: "${seat_controll.allseat.data.showData.price / 6}",
                    subtotal: "${button_controllers.price.toString()}",
                    total: data.toString(),
                    image: img.toString(),
                    id: loss.toString(),
                    language: lang.toString(),
                    date: date.toString(),
                    seats:
                        button_controllers.countickets.map((e) => e).toList(),
                    location: location,
                    showtime: showtime,
                    screen: screen,
                    moviename: movie,
                    ownerid: ownerid,
                    ownername: ownername,
                  );
                  print(ownerid.toString());
                  print(ownername.toString());

                  print(screen.toString());
                  print(location);
                  print(showtime.toString());

                  print(date.toString());
                  print(button_controllers.countickets
                      .map((e) => e)
                      .toList()
                      .toString());
                  print(img.toString());
                  print(
                      "fantssy --------->--------->>>>>>>${loss.toString()}----->---->");
                  print(fetchapis.ofuser[0].data.signName.toString());
                }

                print("${seat_controll.allseat.data.showData.price / 6}");
              },
              // ignore: sort_child_properties_last
              child: Obx(() => seat_controll.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : alltext(
                      txt: "PayNow ₹${button_controllers.price.toString()}",
                      col: wh,
                      siz: 11.sp,
                      wei: FontWeight.bold)),
              backgroundColor: re,
            )),
      ),
      backgroundColor: bl,
      appBar: AppBar(
        toolbarHeight: 9.h,
        centerTitle: true,
        title: alltext(
            txt: moviename.toString(),
            col: yl,
            siz: 14.sp,
            wei: FontWeight.w600),
        leading: back(),
        backgroundColor: Colors.transparent,
        actions: [
          searchico(),

          const SizedBox(
            width: 8,
          ),
          //  Spacer(flex: 1,),
          settingico(),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body: Column(
        children: [
          ////<-------movie information ---------->///
          informationaboutmovie(
              movie: movie, ownername: ownername, date: date, time: time),

          Padding(
            padding: EdgeInsets.only(left: 35.h),
            child: SizedBox(
              child: Obx(
                () => seat_controll.isLoading.value
                    ? const CircularProgressIndicator()
                    : alltext(
                        txt:
                            " & ${button_controllers.counter.value.toString()} tickets",
                        col: re,
                        siz: 10.sp,
                        wei: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            child: alltext(
                txt: "Screen", col: wh, siz: 12.sp, wei: FontWeight.bold),
          ),
          SizedBox(
            height: 2.h,
          ),
          ////<-------theater screen---------->///
          screens(),
          ////<-------theater ststus avalible seats and alredy booked seats all informations ---------->///
          status(),
        ],
      ),
    );
  }
}
