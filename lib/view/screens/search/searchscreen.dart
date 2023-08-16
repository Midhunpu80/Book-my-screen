// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/search/widgets/movielist.dart';
import 'package:bookticket/view/screens/search/widgets/searchfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Searchscreen extends StatelessWidget {
  final cos = Get.put(ServiceViewMovies());
  TextEditingController serchcontoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        centerTitle: true,
        title:
            alltext(txt: "Search", col: wh, siz: 13.sp, wei: FontWeight.bold),
        backgroundColor: Colors.transparent,
        leading: back(),
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            search_textfield(
                hint: "Serch Your Fvourite Movies",
                ico: Icons.search,
                mess: "search Something",
                cont: serchcontoller,
                type: TextInputType.text,
                help: "search"),
            Obx(
              () =>serch_contolx.fonts.isEmpty 
                  ? CircularProgressIndicator()
                  : movielsit(),
            )
          ],
        ),
      ),
    );
  }
}
