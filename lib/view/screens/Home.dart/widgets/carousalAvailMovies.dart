// ignore_for_file: unused_local_variable

import 'package:bookticket/service/user/allmovies/allmoviesSevice.dart';
import 'package:bookticket/service/user/allmovies/cast.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/shimmerWidgets.dart';
import 'package:bookticket/view/screens/moviedetails/Moviedetails.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

carousalAvailMovies() {
  final availmoviesx = Get.put(ServiceViewMovies());
  final con2 = Get.put(service_ViewMovies());
  final con3 = Get.put(cast_ViewMovies());
  return Obx(
    () => availmoviesx.allmoviesdetailsdata.isEmpty
        ? shimmer_carouals()
        : Container(
            height: 35.h,
            width: 100.w,
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final snap = availmoviesx.allmoviesdetailsdata[index];
                  var jas = con2.reply.data[index].movieId;
                  return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              con3.getMovies_Cast(ids: jas);

                              Get.to(moviedetatils(
                                genre: availmoviesx.gene[index].toString(),
                                lan: snap["language"].toString(),
                                overview: snap["overview"].toString(),
                                img:
                                    "https://image.tmdb.org/t/p/original/${snap["poster"].toString()}",
                                title: snap["title"].toString(),
                                dates: snap["release"].toString(),
                                dur: snap["duration"].toString(),
                                rating: snap["rate"].toString(),
                                votes: snap["rate"].toString(),
                              ));
                            },
                            child: Container(
                              height: 22.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original/${snap["poster"].toString()}",
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: wh.withOpacity(0.3)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 4.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.sp),
                                color: wh),
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.star,
                                  color: yl,
                                  size: 2.h,
                                ),
                                label: alltext(
                                    txt: snap["rate"],
                                    col: bl,
                                    siz: 8.sp,
                                    wei: FontWeight.bold)),
                          ),
                          // Text(
                          //   "${con.newdata[index].toString().substring(0,8)}",
                          //   style: TextStyle(
                          //     color: wh,
                          //     fontSize: 11,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // )
                          Expanded(
                              child: SizedBox(
                            width: 28.w,
                            child: Center(
                                child: alltext(
                                    // ignore: unnecessary_string_interpolations
                                    txt:
                                        // ignore: unnecessary_string_interpolations
                                        "${snap["title"].toString()}",
                                    col: wh,
                                    siz: 11,
                                    wei: FontWeight.bold)),
                          )),
                        ],
                      ));
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: availmoviesx.allmoviesdetailsdata.length > 5
                    ? 5
                    : availmoviesx.allmoviesdetailsdata.length),
          ),
  );
}
