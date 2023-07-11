import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
////<-------all cast of this movie --------->///
Widget cast() {
  return SizedBox(
    height: 18.h,
    width: 200.w,
    child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ////<-------images of all actors who acted in this movie --------->///
                Container(
                  height: 11.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://hips.hearstapps.com/hmg-prod/images/henry-cavill-6455184b166f4.jpg?crop=1xw:0.39223802103622907xh;center,top&resize=1200:*"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(205.h),
                      color: bl.withOpacity(0.3)),
                ),
                ////<-------all actors name who acted in this movie---------->///
                alltext(
                    txt: "Henry cavil",
                    col: wh,
                    siz: 12.sp,
                    wei: FontWeight.w400)
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 1.w,
          );
        },
        itemCount: 10),
  );
}
