import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget seats() {
  return SizedBox(
      height: 40.h,
      width: 90.w,
      child: GridView.builder(
        itemCount: 104,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 13,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          if (index % 13 == 0) {
            // Check if it's the first column
            return Container(
              height: 18,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: pp),
              ),
              child: Center(
                child: alltext(
                    // ignore: unnecessary_string_interpolations
                    txt:
                        // ignore: unnecessary_string_interpolations
                        "${String.fromCharCode(index ~/ 13 + 65).toString().toUpperCase()}",
                    col: wh,
                    siz: 7.sp,
                    wei: FontWeight.bold),
              ),
            );
          } else if (index % 13 == 9 || index % 13 == 8 || index % 13 == 4) {
            return Container(
                height: 18,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 1, color: Colors.transparent),
                ),
                child: const Center(
                  child: SizedBox(),
                ));
          } else {
            return Container(
              height: 18,
              width: 100,
              decoration: BoxDecoration(
                border:
                    Border.all(width: 1, color:wh),
              ),
              child: Center(
                  child: alltext(
                      txt: "${index + 1 * 1}",
                      col: wh,
                      siz: 6.sp,
                      wei: FontWeight.bold)),
            );
          }
        },
      ));
}
