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

// ignore: must_be_immutable
class allmoviesList extends StatelessWidget {
  final availmoviesx = Get.put(ServiceViewMovies());
  final con2 = Get.put(service_ViewMovies());
  final cas = Get.put(cast_ViewMovies());
  var tit;
  var img;

  allmoviesList();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: 100.w,
      color: Colors.transparent,
      child: Obx(
        () =>availmoviesx.allmoviesdetailsdata.value.isEmpty?Center(child: CircularProgressIndicator()): GridView.builder(
            itemCount: availmoviesx.allmoviesdetailsdata.length,
            padding: const EdgeInsets.only(left: 5, right: 5, top: 9),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.6,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              String sas = availmoviesx.idt[index];
              final snap = availmoviesx.allmoviesdetailsdata[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      jata = con2.reply.data[index].movieId.toString();
                      con2.getViewMovies();

                      availmoviesx.getMovies(ids: jata);
                      cas.getMovies_Cast(ids: sas.toString());

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
                      height: 30.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.h),
                          border: Border.all(width: 1, color: wh),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original/${snap["poster"].toString()}"),
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
                                    txt: snap["rate"].toString(),
                                    col: bl,
                                    siz: 10.sp,
                                    wei: FontWeight.bold,
                                  )),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                "${snap["title"].toString()}",
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
      ),
    );
  }
}
