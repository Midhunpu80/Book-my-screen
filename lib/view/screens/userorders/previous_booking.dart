// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';

import 'package:bookticket/view/screens/userorders/widgets/previousbookingList.dart';
import 'package:bookticket/view/screens/userorders/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class previous_booking_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      body: Obx(
        () => getalluser_order.isLoading.value
            ? shimmer_userorder()
            : SingleChildScrollView(
                // ignore: prefer_const_constructors
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [previous_bookingList()],
                ),
              ),
      ),
    );
  }
}
