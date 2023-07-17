import 'package:bookticket/service/user/allmovies/allmoviesSevice.dart';
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
                  return Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(moviedetatils(
                                img:
                                    "https://sm.ign.com/t/ign_in/gallery/s/spider-man/spider-man-far-from-home-official-movie-posters_epch.1080.jpg",
                                title: 'SPIDERMAN NOWAY HOME',
                              ));
                            },
                            child: Container(
                              height: 22.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original/${con.newposter[index].toString()}",
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
                                    txt: "77.56k",
                                    col: bl,
                                    siz: 8.sp,
                                    wei: FontWeight.bold)),
                          ),
                          alltext(
                              // ignore: unnecessary_string_interpolations
                              txt: "${con.newdata[index].toString()}",
                              col: wh,
                              siz: 11,
                              wei: FontWeight.bold)
                        ],
                      ));
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: con.newdata.length),
          ),
  );
}
