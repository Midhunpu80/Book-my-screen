// ignore_for_file: non_constant_identifier_names

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

Widget shimmer_avalible_movies() {
  // ignore: unused_local_variable
  Color basecola = Colors.grey[400]!;
  Color highcola = Colors.grey[300]!;
  return GridView.builder(
      itemCount: 4,
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
              onTap: () {},
              child: Container(
                height: 30.h,
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.h),
                  color: highcola,
                ),

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
                    color: bl,
                    borderRadius: BorderRadius.circular(1.sp),
                  ),
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                      highlightColor: highcola,
                      baseColor: basecola,
                        child: Container(
                          width: 45.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: highcola),
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
                                txt: "",
                                col: bl,
                                siz: 10.sp,
                                wei: FontWeight.bold,
                              )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          "",
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
      });
}
