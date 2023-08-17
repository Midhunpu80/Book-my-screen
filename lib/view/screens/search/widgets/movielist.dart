import 'package:bookticket/service/user/allmovies/cast.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/moviedetails/Moviedetails.dart';
import 'package:bookticket/view/screens/search/contro;l.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

List<dynamic> consand = [];
void datas() {}
final serch_contolx = Get.put(search_controll12());
final availmoviesx = Get.put(ServiceViewMovies());

movielsit() {
  final cos = Get.put(ServiceViewMovies());
  final cas = Get.put(cast_ViewMovies());

  //consand = cos.newdata;
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
                  final snap = serch_contolx.fonts[index];
                  // consand = cos.newdata;
                  return InkWell(
                    splashColor: gr,
                    onTap: () {
                      // ignore: avoid_print
                      print("----------${consand.toString()}");
                      cas.getMovies_Cast(ids: cos.idt[index]);
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
                    child: Obx(
                      () => Row(
                        children: [
                          Container(
                            height: 12.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original/${serch_contolx.fonts[index]["poster"].toString()}"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(1.h),
                                color: wh),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/original/${serch_contolx.fonts[index]["poster"].toString()}",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                                width: 50.w,
                                child: alltext(
                                    txt: serch_contolx.fonts[index]["title"]
                                        .toString(),
                                    col: wh,
                                    siz: 12.sp,
                                    wei: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 2.h,
                  );
                },
                itemCount: serch_contolx.fonts.length,
              ))));
}
