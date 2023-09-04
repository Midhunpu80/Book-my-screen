// ignore_for_file: non_constant_identifier_names

import 'package:bookticket/contollerbinding/controller_binding.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/service/user/currentuser/currentuserservice.dart';
import 'package:bookticket/service/user/getdates/getdates.dart';
import 'package:bookticket/service/user/seats_service/seatsservice.dart';
import 'package:bookticket/service/user/serchmovies/serchmovies_service.dart';
import 'package:bookticket/service/user/single_order_service/singleorder_service.dart';
import 'package:bookticket/service/user/userpayment/userpayment.dart';
import 'package:bookticket/view/screens/Home.dart/Home.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

final single_ticket = Get.put(single_order_service());

final currentuser_controll = Get.put(get_currentuser_service());
final view_movie_controll = Get.put(ServiceViewMovies());
final search_controll = Get.put(get_serch_Movies());

final date_controll = Get.put<getdates_service>(getdates_service());
final seat_controll = Get.put(theater_seats_service10());
final payment_controll = Get.put(user_payment_service());

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
        initialBinding: controlllerbinding(),
      );
    });
  }
}

//////////payment corret query parmas////////////////////////////////


// {
//     "fee": " 75",
//     "subtotal": "452",
//     "total": "527",
//     "image": "https://image.tmdb.org/t/p/original//pTmMxAHqX4vsIDE6HPPxOR0Q6TN.jpg",
//     "user": {
//         "user": {
//             "_id": "64e32a06ce747b2b2d18426d",
//             "signName": "Lcu"
//         }
//     },
//     "language": "Tamil",
//     "details": {
//         "selectedSeats": [
//             {
//                 "id": "A-2"
//             }
//             // ... (more seat objects)
//         ],
//         "date": "2023-08-23",   // Date in a specific format
//         "showDetails": {
//             "status": "Booked",
//             "ownerId": "6465ed40be6fc018b42248d6",
//             "ownerName": "Gokul",
//             "movieName": "Jailer",
//             "location": "Banglore",
//             "showTime": "05:09am",
//             "screen": "36"
//            // "_id": 
//         }
//     }
// }


