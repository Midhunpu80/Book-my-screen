// ignore_for_file: file_names, unnecessary_string_interpolations, prefer_const_constructors

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Theaters/controller/contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

bool isfalse = true;
final tt = Get.put(theatercontroller());
DateTime currentdate = DateTime.now();
DateTime tomorrowDate = currentdate.add(Duration(days: 1));
DateTime thirdday = currentdate.add(Duration(days: 2));
String changedate = DateFormat.yMMMEd().format(currentdate).toString();
String tommarow = DateFormat.yMMMEd().format(tomorrowDate).toString();
String thirddate = DateFormat.yMMMEd().format(thirdday).toString();
List<dynamic> alldates = [changedate, tommarow, thirddate];
List<dynamic> alldate_orgin = [currentdate, tomorrowDate, thirdday];

Widget moviedate({required var moviename}) {
  return SliverAppBar(
    //  pinned: true,
    floating: true,
    stretch: true,

    toolbarHeight: 14.h,
    backgroundColor: bl.withOpacity(0.3),
    leading: const Icon(
      Icons.abc,
      color: Colors.transparent,
    ),
    flexibleSpace: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        datecard(moviename: moviename),

        // datecard(
        //     tommarow.toString().substring(0, 3),
        //     tommarow.toString().substring(8, 11),
        //     tommarow.toString().substring(4, 8),
        //     re),
        // datecard(
        //     thirddate.toString().substring(0, 3),
        //     thirddate.toString().substring(8, 11),
        //     thirddate.toString().substring(4, 8),
        //     gy.withOpacity(0.3))
      ],
    ),
  );
}

Widget datecard({required var moviename}) {
  final tt = Get.put(theatercontroller());

  return SizedBox(
    height: 20.h,
    width: 100.w,
    child: Center(
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(left: 5.h),
                child: InkWell(
                  splashColor: blu,
                  onTap: () {
                    date_controll.getcurrent_Dates(
                        date: alldate_orgin[index],
                        movie: moviename.toString());
                    // ignore: avoid_print
                    print(moviename.toString());
                    // tt.alldates = alldate_orgin[index];
                    dynamic s = alldate_orgin[index];
                    tt.alldates = s;
                    // ignore: avoid_print
                    print(
                        "-----------${tt.alldates.toString()}------------------");

                    // ignore: avoid_print
                    print(alldate_orgin[index]);
                    // ignore: unused_local_variable
                    var jay = tt.change(index: index);
                    // ignore: avoid_print
                    // print("${alldates[index]}");
                    //  print("${changedate}");
                  },
                  child: Obx(
                    () => Container(
                        decoration: BoxDecoration(
                            color:
                                tt.cr.value == index ? re : gy.withOpacity(0.3),
                            border: Border.all(width: 1, color: wh),
                            borderRadius: BorderRadius.circular(1.h)),
                        height: 12.h,
                        width: 18.w,
                        child: Column(
                          children: [
                            Center(
                              child: alltext(
                                  txt: alldates[index]
                                      .toString()
                                      .substring(0, 3),
                                  col: wh,
                                  siz: 11.sp,
                                  wei: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            alltext(
                                txt:
                                    alldates[index].toString().substring(9, 11),
                                col: wh,
                                siz: 11.sp,
                                wei: FontWeight.w800),
                            SizedBox(
                              height: 2.h,
                            ),
                            Center(
                              child: alltext(
                                  txt: alldates[index]
                                      .toString()
                                      .substring(4, 9),
                                  col: wh,
                                  siz: 11.sp,
                                  wei: FontWeight.w400),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox();
          },
          itemCount: 3),
    ),
  );
}
