// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, must_be_immutable, unnecessary_string_interpolations, avoid_print

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/nav.dart';
import 'package:bookticket/view/screens/Theaters/widgets/MovieDate.dart';
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
  double ticketprices = button_controllers.price.value ?? 0.0;
  double convicefees = seat_controll.allseat.data.showData.price / 6 ?? 0.0;

  ///dynamic alltotal = button_controllers.price.value.toInt() +
  ///  seat_controll.allseat.data.showData.price / 6.toInt();

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
              onPressed: () async {
                dynamic alltotal = button_controllers.price.value.toInt() +
                    seat_controll.allseat.data.showData.price / 6.toInt();
                print(button_controllers.price.value.toDouble().toString());
                if (button_controllers.countickets.isEmpty) {
                  Get.snackbar("select seats ", "please select  seats ",
                      backgroundColor: blu);
                } else {
                  Get.to(() => payment_summary_screen(
                        ownerid: ownerid,
                        language: lang,
                        id: fetchapis.ofuser[0].data.id.toString(),
                        moviename: moviename.toString(),
                        img: img.toString(),
                        location: location.toString(),
                        date: date.toString(),
                        screen: screen.toString(),
                        showtime: showtime.toString(),
                        ownername: ownername.toString(),
                      ));
                  dynamic loss = fetchapis.ofuser[0].data.id.toString();

                  print("--<>----${alltotal.toString()}");
                  print(loss.toString());
                  print(ownerid.toString());
                  print(ownername.toString());

                  print("screeen ----${screen.toString()}");
                  print(location);
                  print(showtime.toString());

                  print(">----->${date.toString()}>----?");
                  print(button_controllers.countickets
                      .map((e) => {"id": e.toString()})
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
