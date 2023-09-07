import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Theaters/widgets/MovieDate.dart';
import 'package:bookticket/view/screens/Theaters/widgets/shimmer.dart';
import 'package:bookticket/view/screens/selectSeats/selectseats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_animation_transition/animations/bottom_to_top_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import 'package:sizer/sizer.dart';

Widget movieTime({required var img, required var lang, required var alldate}) {
  return SliverList.separated(
    itemBuilder: (context, index) {
      //  final seatdata = seat_controll.allseats[index];
      final snap = date_controll.showtimes[index];
      //final snap = date_controll.reply.data[index];

      return Obx(() {
        if (date_controll.isLoading.value) {
          return shimmer_thatertime();
        }
        // ignore: empty_statements
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
                          /// final snap2 = date_controll.reply.data[index];

                          return Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                // splashColor: gy,
                                onTap: () async {
                                  // final seatdata =
                                  //     seat_controll.allseat.data.showData;
                                  seat_controll.get_theater_seats(
                                      date: tt.alldates.toString(),
                                      showid: date_controll.showtimes[0].id
                                          .toString());
                                  Navigator.of(context).push(
                                      PageAnimationTransition(
                                          page: selectseats(
                                              ownerid: snap.ownerId.toString(),
                                              lang: lang.toString(),
                                              moviename:
                                                  snap.movieName.toString(),
                                              img: img,
                                              movie: snap.movieName.toString(),
                                              time: snap.showTime.toString(),
                                              date: tt.alldates
                                                  .toString()
                                                  .substring(0, 11),
                                              ownername:
                                                  snap.ownerName.toString(),
                                              location:
                                                  snap.location.toString(),
                                              screen: snap.screen.toString(),
                                              showtime:
                                                  snap.showTime.toString()),
                                          pageAnimationType:
                                              BottomToTopFadedTransition()));

                                  // ignore: avoid_print
                                  print(
                                      " ----123-------${tt.alldates.toString()}--------123----");
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
    itemCount: date_controll.showtimes.length,
  );
}
