// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, must_be_immutable

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/Theaters/widgets/Movie.dart';
import 'package:bookticket/view/screens/Theaters/widgets/MovieDate.dart';
import 'package:bookticket/view/screens/Theaters/widgets/movietime.dart';
import 'package:bookticket/view/screens/Theaters/widgets/sliverappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class theaters extends StatelessWidget {
  var img;
  var txt;
  var cat1;
  var lang;

  // ignore: use_key_in_widget_constructors
  theaters(
      {required this.img,
      required this.txt,
      required this.cat1,
      required this.lang});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: bl,
            body: CustomScrollView(
              slivers: [
                sliverbar(),
                sliverMovie(
                  img: img,
                  txt: txt,
                  cat1: cat1,
                ),
                moviedate(moviename: txt.toString()),
                Obx(() => movieTime(
                    img: img,
                    lang: lang,
                    alldate: tt.datesall.value.toString()))
              ],
            )));
  }
}
