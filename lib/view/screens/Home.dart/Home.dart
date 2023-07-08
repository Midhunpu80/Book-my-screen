// ignore_for_file: file_names

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/carousal.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/carousalAvailMovies.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/drawer.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/nav.dart';
import 'package:bookticket/view/screens/avaliblemovies/AvalibleMovies.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: wh,),
      backgroundColor: bl,

      endDrawer: Drawer(
          width: 80.w, backgroundColor: bl.withOpacity(0.8), child: newdrwer()),

      // appBar: AppBar(),
      body: ListView(
        children: [
          nav(context),
          const SizedBox(
            height: 25,
          ),
          carousal(),
          Padding(
            padding: EdgeInsets.only(left: 1.h, right: 1.h, top: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: alltext(
                      txt: "Avalible movies",
                      col: wh,
                      siz: 12.sp,
                      wei: FontWeight.bold),
                ),
                TextButton.icon(
                    onPressed: () {
                      Get.to(avalible_Movies());
                    },
                    icon: alltext(
                        txt: "see all", col: re, siz: 15, wei: FontWeight.bold),
                    label: Icon(
                      Icons.arrow_forward_ios,
                      color: re,
                      size: 9.sp,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          carousalAvailMovies()
          // carousal_avaliblemovies()
        ],
      ),
    );
  }
}
