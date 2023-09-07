// ignore_for_file: non_constant_identifier_names

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/shimmerWidgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

Widget shimmer_thatertime() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Shimmer.fromColors(
      highlightColor: highcol,
      baseColor: basecol,
      child: Container(
        margin: EdgeInsets.only(left: 2.h, right: 1.h),
        height: 16.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: highcol, border: Border.all(width: 0, color: highcol)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              trailing: Icon(
                Icons.arrow_circle_down,
                color: highcol,
              ),
              title: alltext(txt: "", col: wh, siz: 9.sp, wei: FontWeight.bold),
              subtitle:
                  alltext(txt: "", col: wh, siz: 8.sp, wei: FontWeight.bold),
            ),
            SizedBox(
              height: 7.h,
              width: 100.w,

              /// color: blu,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    /// final snap2 = date_controll.reply.data[index];

                    return Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          // splashColor: gy,
                          onTap: () async {},
                          child: Shimmer.fromColors(
                            highlightColor: highcol,
                            baseColor: basecol,
                            child: Container(
                              height: 4.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: index.isOdd ? yl : gr)),
                              child: Center(
                                  child: alltext(
                                      txt: "",
                                      col: index.isOdd ? yl : gr,
                                      siz: 8.sp,
                                      wei: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ),
  );
}
