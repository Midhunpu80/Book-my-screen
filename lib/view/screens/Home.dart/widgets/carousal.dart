// ignore_for_file: sort_child_properties_last, non_constant_identifier_names

import 'package:bookticket/utils/colors/colors.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

carousal() {
  return CarouselSlider(
    options: CarouselOptions(autoPlay: true, height: 32.h),
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(left: 10.sp, bottom: 10, top: 10),
            child: Container(
              margin: EdgeInsets.only(right: 10.sp),
              width: 100.w,
              height: 4.h,
              child: Image.network(
                "https://rukminim1.flixcart.com/image/850/1000/jf8khow0/poster/a/u/h/small-hollywood-movie-poster-blade-runner-2049-ridley-scott-original-imaf3qvx88xenydd.jpeg?q=90",
              ),
              //  margin:const  EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: bl,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://rukminim1.flixcart.com/image/850/1000/jf8khow0/poster/a/u/h/small-hollywood-movie-poster-blade-runner-2049-ridley-scott-original-imaf3qvx88xenydd.jpeg?q=90",
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(1, 1), blurRadius: 3, color: gy)
                  ]
                  // border: Border.all(width: 1, color: wh)

                  ),
            ),
          );
        },
      );
    }).toList(),
  );
}
