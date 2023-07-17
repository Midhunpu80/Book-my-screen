// ignore_for_file: camel_case_types, use_key_in_widget_constructors, unnecessary_brace_in_string_interps

import 'package:bookticket/service/user/allmovies/allmoviesSevice.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/moviedetails/Moviedetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

var jata;

class allmoviesList extends StatelessWidget {
  final con = Get.put(ServiceViewMovies());
  final con2 = Get.put(service_ViewMovies());

  var tit;
  var img;
  // var img;

  allmoviesList({required this.img, required this.tit});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79.h,
      width: 100.w,
      color: Colors.transparent,
      child: GridView.builder(
          itemCount: con2.reply.data.length,
          padding: const EdgeInsets.only(left: 5, right: 5, top: 9),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.6,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    jata = con2.reply.data[index].movieId.toString();
                    con2.getViewMovies();
                    // for (var i in jata) {
                    con.getMovies(ids: jata);
                    //   }
                    var vata = con.now_Movies.title[index];

                    print("=====${vata.toString()}---------========");

                    Get.to(moviedetatils(
                        img:
                            "https://image.tmdb.org/t/p/original/${img[index].toString()}",
                        title: con.newdata[index].toString()));
                  },
                  child: Container(
                    height: 30.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.h),
                        border: Border.all(width: 1, color: wh),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original/${img[index]}"),
                            fit: BoxFit.fill)),

                    //  margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 22.h,
                            width: 35.w,
                          ),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Container(
                      height: 3.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.sp),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 45.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: wh),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: yl,
                                  size: 3.h,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                SizedBox(
                                    child: alltext(
                                  txt: "openheimer",
                                  col: bl,
                                  siz: 10.sp,
                                  wei: FontWeight.bold,
                                )),
                              ],
                            ),
                          ),
                          alltext(
                              txt: "${tit[index]}",
                              col: wh,
                              siz: 11.sp,
                              wei: FontWeight.w600),
                        ],
                      )),
                ),
              ],
            );
          }),
    );
  }
}
