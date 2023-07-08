import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/search/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sizer/sizer.dart';

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

Widget searchico() {
  return CircleAvatar(
    backgroundColor: wh.withOpacity(0.3),
    child: IconButton(
        onPressed: () {
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

Widget settingico() {
  return CircleAvatar(
    backgroundColor: wh.withOpacity(0.3),
    child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.settings,
          color: wh,
          size: 3.h,
        )),
  );
}
