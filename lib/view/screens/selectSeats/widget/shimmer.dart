import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/shimmerWidgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

shimmer_selectseats() {
  return SizedBox(
      height: 40.h,
      width: 90.w,
      child: GridView.builder(
          itemCount: seat_controll.allseat.data.screen.totalSeats,
          // ignore: prefer_const_constructors
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisCount: seat_controll.allseat.data.screen.columns,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            // int rowss = index ~/ 12;

            return InkWell(
                onTap: () {},
                child: Shimmer.fromColors(
                  highlightColor: highcol,
                  baseColor: basecol,
                  child: Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color:bl,
                      border: Border.all(
                          width: 1,
                          color: highcol),
                    ),
                    child: Center(
                      child: alltext(
                          txt: "", col: wh, siz: 4.sp, wei: FontWeight.bold),
                    ),
                  ),
                ));
          }));
}
