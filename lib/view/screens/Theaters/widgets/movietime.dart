import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/selectSeats/selectseats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:page_animation_transition/animations/bottom_to_top_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:sizer/sizer.dart';

Widget movieTime() {
  return SliverList.separated(
    itemBuilder: (context, index) {
      final snap = date_controll.showtimes[index];
      //final snap = date_controll.reply.data[index];

      return Obx(() {
        if (date_controll.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: yl,
            ),
          );
        }
        ;
        bool iswork = date_controll.showtimes.isEmpty;
        // ignore: unnecessary_null_comparison, iterable_contains_unrelated_type
        if (iswork) {
          return Container(
            height: 50.h,
            width: 100.w,
            color: bl,
            child: Lottie.asset("images/72235-watch-a-movie-with-popcorn.json"),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(left: 2.h, right: 1.h),
              height: 16.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: bl.withOpacity(0.3),
                  border: Border.all(width: 0, color: wh)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    trailing: Icon(
                      Icons.arrow_circle_down,
                      color: wh,
                    ),
                    title: alltext(
                        txt: snap.ownerName.toString(),
                        col: wh,
                        siz: 9.sp,
                        wei: FontWeight.bold),
                    subtitle: alltext(
                        txt: "English-3D",
                        col: wh,
                        siz: 8.sp,
                        wei: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 7.h,
                    width: 100.w,

                    /// color: blu,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: date_controll.showtimes.length,
                        itemBuilder: (context, index) {
                          //  final snap2 = date_controll.reply.data[index];

                          return Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                splashColor: gy,
                                onTap: () {
                                  Navigator.of(context).push(
                                      PageAnimationTransition(
                                          page: const selectseats(),
                                          pageAnimationType:
                                              BottomToTopFadedTransition()));
                                },
                                child: Container(
                                  height: 4.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 1,
                                          color: index.isOdd ? yl : gr)),
                                  child: Center(
                                      child: alltext(
                                          txt: date_controll
                                              .showtimes[index].showTime
                                              .toString(),
                                          col: index.isOdd ? yl : gr,
                                          siz: 8.sp,
                                          wei: FontWeight.bold)),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        }
      });
    },
    separatorBuilder: (context, index) {
      return const SizedBox();
    },
    itemCount: date_controll.showtimes.length ,
  );
}
