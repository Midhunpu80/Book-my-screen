// ignore_for_file: non_constant_identifier_names

import 'package:bookticket/service/user/allmovies/allmoviesSevice.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/service/user/currentuser/currentuserservice.dart';
import 'package:bookticket/service/user/serchmovies/serchmovies_service.dart';
import 'package:bookticket/view/screens/Home.dart/Home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

// ignore: non_constant_identifier_names
final currentuser_controll = Get.put(get_currentuser_service());
final view_movie_controll = Get.put(ServiceViewMovies());
final search_controll = Get.put(get_serch_Movies());

///final serch_controll = Get.put(get_serch_Movies());////

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: GoogleFonts.inter().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Home(),
        ),
      );
    });
  }
}
