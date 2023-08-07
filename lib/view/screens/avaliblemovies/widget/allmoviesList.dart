// ignore_for_file: camel_case_types, use_key_in_widget_constructors, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables

import 'package:bookticket/service/user/allmovies/allmoviesSevice.dart';
import 'package:bookticket/service/user/allmovies/cast.dart';
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
  final cas = Get.put(cast_ViewMovies());
  var tit;
  var img;

  allmoviesList({required this.img, required this.tit});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: 100.w,
      color: Colors.transparent,
      child: GridView.builder(
          itemCount: cons.newdata.toSet().length,
          padding: const EdgeInsets.only(left: 5, right: 5, top: 9),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.6,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            String sas = con.idt[index];
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    jata = con2.reply.data[index].movieId.toString();
                    con2.getViewMovies();

                    con.getMovies(ids: jata);
                    cas.getMovies_Cast(ids: sas.toString());

                    Get.to(moviedetatils(
                      gen2: con.gene[index],
                      gen3: con.gene[index],
                      gen4: con.gene[index],
                      genre: con.gene[index],
                      lan: con.lan[index],
                      overview: con.overview[index],
                      img:
                          "https://image.tmdb.org/t/p/original/${img[index].toString()}",
                      title: con.newdata[index].toString(),
                      dates: con.rele[index].toString(),
                      dur: con.dur[index].toString(),
                      rating: con.rate[index].toString(),
                      votes: con.rate[index].toString(),
                    ));
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
                                  txt: con.rate[index],
                                  col: bl,
                                  siz: 10.sp,
                                  wei: FontWeight.bold,
                                )),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              "${tit[index]}",
                              style: TextStyle(
                                color: wh,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            );
          }),
    );
  }
}
