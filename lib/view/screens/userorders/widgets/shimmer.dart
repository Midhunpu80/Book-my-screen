// ignore_for_file: non_constant_identifier_names

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/shimmerWidgets.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

Widget shimmer_userorder() {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Card(
      color: bl,
      child: SizedBox(
        height: 82.h,
        width: 200.w,
        child: ListView.separated(
            // reverse: true,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                highlightColor: highcol,
                baseColor: basecol,
                child: Card(
                  child: Container(
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.h), color: wh),
                    child: Row(
                      children: [
                        Container(
                          width: 37.w,
                          height: 80.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(1.h),
                                bottomLeft: Radius.circular(1.h)),
                            color: bl.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 1.h,
              );
            },
            itemCount: 3),
      ),
    ),
  );
}
