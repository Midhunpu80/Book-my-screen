// ignore_for_file: file_names

import 'package:bookticket/service/user/allmovies/allmoviesSevice.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
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
  final cons = Get.put(service_ViewMovies());
  final cons1 = Get.put(ServiceViewMovies());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: wh,),
      backgroundColor: bl,

      endDrawer: Drawer(
          width: 80.w, backgroundColor: bl.withOpacity(0.8), child: newdrwer()),

      // appBar: AppBar(),
      body: Obx(
        () => cons1.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView(
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
                              cons.getViewMovies();

                              // ignore: unused_local_variable
                              var sata = cons.reply.data
                                  .map((e) => e.movieId.toString())
                                  .forEach((element) {
                                cons1.getMovies(ids: element);
                              });

                              // List cat = [];

                              // cat.add(cons1.now_Movies.title);
                              // print(cons1.now_Movies.title.toString());
                              // print("6666666666666666${cat.length}");

                              //cons.getViewMovies();

                              Get.to(avalible_Movies());
                            },
                            icon: alltext(
                                txt: "see all",
                                col: re,
                                siz: 15,
                                wei: FontWeight.bold),
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
      ),
    );
  }
}
