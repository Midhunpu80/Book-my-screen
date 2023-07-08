import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget sliverbar() {
  return SliverAppBar(
    // pinned: true,
    floating: true,
    stretch: true,
    snap: true,
    centerTitle: true,
    leading: back(),
    title: alltext(txt: "Theaters", col: wh, siz: 15.sp, wei: FontWeight.bold),
    backgroundColor: bl,
    // toolbarHeight: 10.h,
    actions: [
      searchico(),

      const SizedBox(
        width: 8,
      ),
      //  Spacer(flex: 1,),
      settingico(),
      const SizedBox(
        width: 8,
      ),
    ],
  );
}
