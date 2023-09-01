// ignore_for_file: avoid_print, camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Theaters/theaters.dart';
import 'package:bookticket/view/screens/Theaters/widgets/MovieDate.dart';
import 'package:bookticket/view/screens/moviedetails/Widget/cast.dart';
import 'package:bookticket/view/screens/moviedetails/Widget/movieposter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class moviedetatils extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  moviedetatils(
      {required this.img,
      required this.title,
      required this.overview,
      required this.lan,
      required this.dates,
      required this.dur,
      required this.rating,
      required this.votes,
      required this.genre});
  var img;
  var title;
  var overview;
  var lan;
  var dur;
  var rating;
  var votes;
  var dates;
  var genre;
  var gen2;
  var gen3;
  var gen4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 80.w,
            child: FloatingActionButton(
              onPressed: () async {
                await date_controll.getcurrent_Dates(
                    movie: title.toString(), date: currentdate.toString());
                date_controll.getcurrent_Dates(
                    movie: title.toString(), date: thirddate.toString());
                date_controll.getcurrent_Dates(
                    movie: title.toString(), date: tomorrowDate.toString());

                ///  tt.alldates = alldate_orgin[0]la;

                Get.to(theaters(
                  lang: lan,
                  cat1: genre.toString(),
                  img: img,
                  txt: title,
                ));
                print("name");
              },
              child: alltext(
                  txt: "Book Now", col: bl, siz: 13.sp, wei: FontWeight.bold),
              backgroundColor: const Color.fromARGB(255, 255, 154, 2),
            ),
          ),
        ),
        backgroundColor: bl,
        appBar: AppBar(
          toolbarHeight: 10.h,
          centerTitle: true,
          title: alltext(txt: title, col: yl, siz: 20, wei: FontWeight.bold),
          leading: back(),
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
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: movieposter(img),
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: titlecard(
                          title: title,
                          dur: dur,
                          rating: rating,
                          votes: votes,
                          dates: dates,
                          genre: genre),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: langaugaecard(lan: lan)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: subtitlecard(overview),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                            child: alltext(
                                txt: "Cast",
                                col: wh,
                                siz: 14.sp,
                                wei: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              cast(),
              SizedBox(
                height: 9.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
