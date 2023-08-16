// ignore_for_file: unused_label

import 'package:bookticket/main.dart';
import 'package:bookticket/service/user/allmovies/allmoviesSevice.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/search/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

nav(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 2.h, top: 2.h),
              child: alltext(
                  txt: "Hi ${currentuser_controll.reply.data.signName.toString()}", col: re, siz: 18.sp, wei: FontWeight.w200)),
          Padding(
            padding: EdgeInsets.only(right: 6.sp, top: 5.sp),
            child: CircleAvatar(
              radius: 3.h,
              child: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Icon(
                      Icons.person,
                      color: wh,
                      size: 4.h,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      navsearch()
    ],
  );
}

navsearch() {
  final con1 = Get.put(ServiceViewMovies());
  // ignore: unused_local_variable
  final con = Get.put(service_ViewMovies());
  final cons = Get.put(service_ViewMovies());
  // ignore: unused_local_variable
  ServiceViewMovies s = ServiceViewMovies();
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 2.h, top: 0.h),
              child: alltext(
                  txt: "Featured \nMovies ",
                  col: wh,
                  siz: 25.sp,
                  wei: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(right: 1.h, top: 2.h),
            child: Container(
              height: 6.h,
              width: 13.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: wh),
              child: Center(
                  child: IconButton(
                      onPressed: () {
                        cons.getViewMovies();
                        



                        // ignore: unused_local_variable
                        var sata = cons.reply.data
                            .map((e) => e.movieId.toString())
                            .forEach((element) {
                          con1.getMovies(ids: element);
                        });
                        Get.to(Searchscreen());

                        //cons.getViewMovies();
                      },
                      icon: Icon(
                        Icons.search,
                        size: 4.h,
                      ))),
            ),
          ),
        ],
      ),
    ],
  );
}
