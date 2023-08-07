// ignore_for_file: unused_local_variable

import 'package:bookticket/service/user/allmovies/allmoviesSevice.dart';
import 'package:bookticket/service/user/allmovies/cast.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/moviedetails/Moviedetails.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

carousalAvailMovies() {
  final con = Get.put(ServiceViewMovies());
  final con2 = Get.put(service_ViewMovies());
  final con3 = Get.put(cast_ViewMovies());
  return Obx(
    () => con.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : Container(
            height: 35.h,
            width: 100.w,
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var jas = con2.reply.data[index].movieId;
                  return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              con3.getMovies_Cast(ids: jas);

                              Get.to(moviedetatils(
                                gen2: con.gene[index],
                                gen3: con.gene[index],
                                gen4: con.gene[index],
                                lan: con.lan[index],
                                img:
                                    "https://image.tmdb.org/t/p/original/${con.newposter[index].toString()}",
                                title: con.newdata[index].toString(),
                                overview: con.overview[index].toString(),
                                dates: con.rele[index],
                                dur: con.dur[index],
                                genre: con.gene[index],
                                rating: con.rate[index],
                                votes: con.rate[index],
                              ));
                            },
                            child: Container(
                              height: 22.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //       "https://image.tmdb.org/t/p/original/${con.newposter[index].toString()}",
                                  //     ),
                                  //     fit: BoxFit.cover),
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
                                    txt: con.rate[index],
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
                                        "${con.newdata[index].toString()}",
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
                itemCount: con.newdata.length > 5 ? 5 : con.newdata.length),
          ),
  );
}
