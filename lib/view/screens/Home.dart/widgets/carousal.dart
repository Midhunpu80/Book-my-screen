// ignore_for_file: sort_child_properties_last, non_constant_identifier_names

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
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
                  color: wh,
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

carousal_avaliblemovies() {
  return CarouselSlider(
    options: CarouselOptions(autoPlay: true, height: 39.h),
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(left: 5.sp),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 2.sp),
                  width: 100.w,
                  height: 25.h,
                  child: Image.network(
                      "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5"),
                  //  margin:const  EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color:wh.withOpacity(0.3)),
                      color: bl.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5"),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 12.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: bl.withOpacity(0.3)),
                  child: Column(
                    children: [
                      alltext(
                          txt: "Shazam fury of gods",
                          col: wh,
                          siz: 15,
                          wei: FontWeight.bold),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.star,
                            color: yl,
                          ),
                          label: alltext(
                              txt: "777.256",
                              col: yl,
                              siz: 15,
                              wei: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }).toList(),
  );
}
