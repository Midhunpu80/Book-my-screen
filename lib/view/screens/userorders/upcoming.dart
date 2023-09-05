// ignore_for_file: prefer_const_literals_to_create_immutables, camel_case_types

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/userorders/widgets/listofdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class upcoming_booking_screen extends StatelessWidget {
  const upcoming_booking_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bl,
        //  appBar: AppBar(
        /// backgroundColor: blu,
        // ),
        // ignore: prefer_const_constructors
        body: Obx(
          () => getalluser_order.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  // ignore: prefer_const_constructors
                  child: Column(
                    children: [
                      upcomingdataList()
                    ],
                  ),
                ),
        ));
  }
}
