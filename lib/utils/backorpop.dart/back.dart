// ignore_for_file: invalid_use_of_protected_member

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/search/searchscreen.dart';
import 'package:bookticket/view/screens/selectSeats/widget/seats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

///////<-----------back button------------->////
Widget back() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: CircleAvatar(
      radius: 2,
      backgroundColor: wh.withOpacity(0.2),
      child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: wh,
          )),
    ),
  );
}
///////<-----search icon for every nav bar -------------->////

Widget searchico() {
  return CircleAvatar(
    backgroundColor: wh.withOpacity(0.3),
    child: IconButton(
        onPressed: () {
          /// fetch.fetchproduct(query: "Dangal");
          ///   serch_controll.getSerch_Movies(query: "Dangal");

          // ignore: prefer_const_constructors
          Get.to(Searchscreen());
        },
        icon: Icon(
          Icons.search_rounded,
          color: wh,
          size: 3.h,
        )),
  );
}

//<---------setting icon for every nava bar ---------->//////
Widget settingico() {
  ///  final fetch = Get.put(fetchcontroll());
  return CircleAvatar(
    backgroundColor: wh.withOpacity(0.3),
    child: IconButton(
        onPressed: () {
          /// Get.to(() => h());
          ///fetch.fetchproduct(query: "Dangal");
        },
        icon: Icon(
          Icons.settings,
          color: wh,
          size: 3.h,
        )),
  );
}
