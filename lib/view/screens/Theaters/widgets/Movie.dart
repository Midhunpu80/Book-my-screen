import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget sliverMovie(var img, var txt) {
  return SliverAppBar(
    //  pinned: true,
    floating: true,
    stretch: true,
    leading: const Icon(
      Icons.abc,
      color: Colors.transparent,
    ),
    toolbarHeight: 35.h,

    //backgroundColor: Color.fromARGB(255, 4, 0, 255),
    flexibleSpace: Stack(
      children: [
        Positioned.fill(
            child: Container(
          color: bl.withOpacity(0.8),
          height: 50.h,
          width: 100.w,
          child: Image.network(
            img,
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
                  alltext(
                      txt: "${txt.toString().substring(0, 10)}-",
                      col: wh,
                      siz: 17.sp,
                      wei: FontWeight.bold),
                  alltext(
                      txt: "English", col: wh, siz: 18.sp, wei: FontWeight.bold)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  moviecard("Thriller"),
                  moviecard("Drama"),
                  moviecard("Action")
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget moviecard(String name) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 4.h,
      width: 26.w,
      decoration: BoxDecoration(
          color: bl.withOpacity(0.5),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 2, color: wh)),
      child: Center(
          child: alltext(txt: name, col: wh, siz: 10.sp, wei: FontWeight.w800)),
    ),
  );
}
