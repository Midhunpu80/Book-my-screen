// ignore_for_file: unnecessary_null_comparison, camel_case_types

import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/avaliblemovies/widget/allmoviesList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class avalible_Movies extends StatelessWidget {
  final con = Get.put(ServiceViewMovies());

  avalible_Movies();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: bl,
            appBar: AppBar(
              toolbarHeight: 9.h,
              centerTitle: true,
              title: alltext(
                  txt: "Now Showing",
                  col: yl,
                  siz: 14.sp,
                  wei: FontWeight.w600),
              leading: back(),
              backgroundColor: Colors.transparent,
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
            ),
            body: Obx(() => con.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      allmoviesList(img: con.newposter, tit: con.newdata)
                    ],
                  ))));
  }
}
