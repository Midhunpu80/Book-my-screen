// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, must_be_immutable

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/Theaters/widgets/Movie.dart';
import 'package:bookticket/view/screens/Theaters/widgets/MovieDate.dart';
import 'package:bookticket/view/screens/Theaters/widgets/movietime.dart';
import 'package:bookticket/view/screens/Theaters/widgets/sliverappbar.dart';
import 'package:flutter/material.dart';

class theaters extends StatelessWidget {
  var img;
  var txt;
  // ignore: use_key_in_widget_constructors
  theaters({required this.img, required this.txt});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bl,
        body: CustomScrollView(
          slivers: [
            sliverbar(),
            sliverMovie(img: img, txt: txt),
            moviedate(),
            movieTime()
          ],
        ),
      ),
    );
  }
}
