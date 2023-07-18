import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';

import 'package:flutter/material.dart';


import 'package:sizer/sizer.dart';

movielsit() {
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
                  splashColor: wh,
                  onTap: () {
                  //   Get.to(moviedetatils(
                  //       img:
                  //           "https://m.media-amazon.com/images/I/81F5PF9oHhL._AC_UF894,1000_QL80_.jpg",
                  //       title: "JHON WICK"));
                },
                  child: Row(
                    children: [
                      Container(
                        height: 12.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/81F5PF9oHhL._AC_UF894,1000_QL80_.jpg",
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(1.h),
                            color: wh),
                        child: Image.network(
                            "https://m.media-amazon.com/images/I/81F5PF9oHhL._AC_UF894,1000_QL80_.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                            child: alltext(
                                txt: "JHON WICK",
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
              itemCount: 20),
        ),
      ));
}
