// ignore_for_file: sort_child_properties_last, non_constant_identifier_names

import 'package:bookticket/service/user/allmovies/banner.dart';
import 'package:bookticket/utils/colors/colors.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

carousal() {
  final con = Get.put(banner_ViewMovies());
  return Obx(() => con.isLoading.value
      ? const Center(child: CircularProgressIndicator())
      : CarouselSlider(
          options: CarouselOptions(autoPlay: true, height: 32.h),
          items: [0,1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.sp, bottom: 10, top: 10),
                  child: Container(
                    margin: EdgeInsets.only(right: 10.sp),
                    width: 100.w,
                    height: 4.h,
                    child: Image.network(
                        "https://image.tmdb.org/t/p/original/${con.data_banner.results[i].posterPath.toString()}"),

                    //  margin:const  EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: bl,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://image.tmdb.org/t/p/original/${con.data_banner.results[i].posterPath.toString()}",
                          ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(1, 1),
                              blurRadius: 3,
                              color: gy)
                        ]
                        // border: Border.all(width: 1, color: wh)

                        ),
                  ),
                );
              },
            );
          }).toList(),
        ));
}
