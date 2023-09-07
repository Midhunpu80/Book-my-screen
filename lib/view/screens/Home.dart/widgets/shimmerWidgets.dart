import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/shimmerWidgets.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/shimmerWidgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

Color basecol = Colors.grey[600]!;
Color highcol = Colors.grey[400]!;

Widget shimmer_carouals() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[600]!,
    highlightColor: Colors.grey[400]!,
    child: SizedBox(
      height: 35.h,
      width: 100.w,

      ///  color: Colors.transparent,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  children: [
                    Container(
                      height: 22.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: highcol),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 4.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.sp), color: wh),
                      child: Shimmer.fromColors(
                        baseColor: basecol,
                        highlightColor: highcol,
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.star,
                              color: yl,
                              size: 2.h,
                            ),
                            label: alltext(
                                txt: "                    ",
                                col: bl,
                                siz: 8.sp,
                                wei: FontWeight.bold)),
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                      width: 28.w,
                      child: Center(
                          child: alltext(
                              // ignore: unnecessary_string_interpolations
                              txt:
                                  // ignore: unnecessary_string_interpolations
                                  "",
                              col: wh,
                              siz: 11,
                              wei: FontWeight.bold)),
                    )),
                  ],
                ));
          },
          separatorBuilder: (context, index) {
            return const SizedBox();
          },
          itemCount: 5),
    ),
  );
}

Widget shimmercarousal_auto() {
  return CarouselSlider(
    options: CarouselOptions(autoPlay: true, height: 32.h),
    items: [0, 1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Shimmer.fromColors(
            baseColor: basecol,
            highlightColor: highcol,
            child: Padding(
              padding: EdgeInsets.only(left: 10.sp, bottom: 10, top: 10),
              child: Container(
                margin: EdgeInsets.only(right: 10.sp),
                width: 100.w,
                height: 4.h,

                //  margin:const  EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: highcol,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(1, 1), blurRadius: 3, color: gy)
                    ]
                    // border: Border.all(width: 1, color: wh)

                    ),
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}

Widget shimmer_nav() {
  return Column(
    children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: basecol,
              highlightColor: highcol,
              child: Padding(
                  padding: EdgeInsets.only(left: 2.h, top: 2.h),
                  child: alltext(
                      txt: "           ",
                      col: highcol,
                      siz: 18.sp,
                      wei: FontWeight.w200)),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[600]!,
              highlightColor: Colors.grey[400]!,
              child: Padding(
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
                        onPressed: () {},
                        tooltip: MaterialLocalizations.of(context)
                            .openAppDrawerTooltip,
                      );
                    },
                  ),
                ),
              ),
            )
          ]),
      shimmer_nav2(),
      // navsearch()
    ],
  );
}

Widget shimmer_nav2() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: basecol,
            highlightColor: highcol,
            child: Padding(
                padding: EdgeInsets.only(left: 2.h, top: 0.h),
                child: alltext(
                    txt: "Featured \nMovies ",
                    col: highcol,
                    siz: 25.sp,
                    wei: FontWeight.bold)),
          ),
          Shimmer.fromColors(
            baseColor: basecol,
            highlightColor: highcol,
            child: Padding(
              padding: EdgeInsets.only(right: 1.h, top: 2.h),
              child: Container(
                height: 6.h,
                width: 13.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), color: wh),
                child: Center(
                    child: IconButton(
                        onPressed: () {
                          //cons.getViewMovies();
                        },
                        icon: Icon(
                          Icons.search,
                          size: 4.h,
                        ))),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
