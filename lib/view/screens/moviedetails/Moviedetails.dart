// ignore_for_file: avoid_print, camel_case_types, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Theaters/theaters.dart';
import 'package:bookticket/view/screens/moviedetails/Widget/cast.dart';
import 'package:bookticket/view/screens/moviedetails/Widget/movieposter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class moviedetatils extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  moviedetatils({required this.img, required this.title});
  var img;
  var title;

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
              onPressed: () {
                Get.to(theaters(img: img,txt: title,));
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
                      child: titlecard(title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.topLeft, child: langaugaecard()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: subtitlecard(),
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
