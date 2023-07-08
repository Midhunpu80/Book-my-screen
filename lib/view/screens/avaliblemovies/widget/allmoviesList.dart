// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/moviedetails/Moviedetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class allmoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79.h,
      width: 100.w,
      color: Colors.transparent,
      child: GridView.builder(
          itemCount: 20,
          padding: const EdgeInsets.only(left: 5, right: 5, top: 9),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.6,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            //mainAxisExtent: 200,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(moviedetatils(
                        img:
                            "https://sportshub.cbsistatic.com/i/2023/05/05/75a5162e-60b8-4bf4-9902-3c0ef49af85f/oppenheimer-poster-cillian-murphy.jpg?auto=webp&width=1500&height=2375&crop=0.632:1,smart",
                        title: "openheimer"));
                  },
                  child: Container(
                    height: 30.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.h),
                        border: Border.all(width: 1, color: wh),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://sportshub.cbsistatic.com/i/2023/05/05/75a5162e-60b8-4bf4-9902-3c0ef49af85f/oppenheimer-poster-cillian-murphy.jpg?auto=webp&width=1500&height=2375&crop=0.632:1,smart"),
                            fit: BoxFit.cover)),
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
                                  txt: "77.56k",
                                  col: bl,
                                  siz: 10.sp,
                                  wei: FontWeight.bold,
                                )),
                              ],
                            ),
                          ),
                          alltext(
                              txt: " OPEN HEIMER ",
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
