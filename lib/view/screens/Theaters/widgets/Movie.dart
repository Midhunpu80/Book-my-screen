// ignore_for_file: sized_box_for_whitespace

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget sliverMovie({
  required String img,
  required String txt,
  required String cat1,
}) {
  return SliverAppBar(
    //  pinned: true,
    floating: true,
    stretch: true,
    leading: const Icon(
      Icons.abc,
      color: Colors.transparent,
    ),
    toolbarHeight: 35.h,
    flexibleSpace: Stack(
      children: [
        Positioned.fill(
            child: Container(
          color: bl.withOpacity(0.8),
          height: 50.h,
          width: 100.w,
          child: Image.network(
            img.toString(),
            fit: BoxFit.cover,
          ),
        )),
        Container(
          color: bl.withOpacity(0.4),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      child: alltext(
                          txt: "${txt.toString().substring(0)}-",
                          col: wh,
                          siz: 14.sp,
                          wei: FontWeight.bold)),

                  ///   alltext(
                  ///        tx t: "English", col: wh, siz: 14.sp, wei: FontWeight.bold)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Expanded(child: moviecard(cat1))],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget moviecard(String name) {
  return Container(
      height: 5.h,
      width: 100.w,
      child: ListView.builder(
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 3.h, right: 20),
              child: Container(
                height: 4.h,
                width: 86.w,
                decoration: BoxDecoration(
                    color: bl.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 2, color: wh)),
                child: Center(
                    child: alltext(
                        txt: name.toString(),
                        col: wh,
                        siz: 10.sp,
                        wei: FontWeight.w800)),
              ),
            );
          }));
}
