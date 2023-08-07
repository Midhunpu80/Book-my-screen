import 'package:bookticket/service/user/allmovies/cast.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/moviedetails/Moviedetails.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

movielsit() {
  final cos = Get.put(ServiceViewMovies());
  final cas = Get.put(cast_ViewMovies());
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 75.h,
        width: 100.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.h)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: gr,
                  onTap: () {
                    cas.getMovies_Cast(ids: cos.idt[index]);
                    Get.to(moviedetatils(
                        gen2: cos.gene[index],
                        gen3: cos.gene[index],
                        gen4: cos.gene[index],
                        img: cos.newposter[index],
                        title: cos.newdata[index],
                        overview: cos.overview[index],
                        lan: cos.lan[index],
                        dates: cos.rele[index],
                        dur: cos.dur[index],
                        rating: cos.rate[index],
                        votes: cos.rate[index],
                        genre: cos.gene[index]));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 12.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original/${cos.newposter[index].toString()}"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(1.h),
                            color: wh),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/original/${cos.newposter[index].toString()}",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                            width: 50.w,
                            child: alltext(
                                txt: cos.newdata[index],
                                col: wh,
                                siz: 12.sp,
                                wei: FontWeight.bold)),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 2.h,
                );
              },
              itemCount: cos.newdata.length),
        ),
      ));
}
