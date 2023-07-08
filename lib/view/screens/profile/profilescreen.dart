// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/profile/widgets/head.dart';
import 'package:bookticket/view/screens/profile/widgets/walland%20pay.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        centerTitle: true,
        title:
            alltext(txt: "Profile", col: wh, siz: 12.sp, wei: FontWeight.bold),
        leading: back(),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              head(),
              SizedBox(
                height: 3.h,
              ),
              /////////wallet and orders ////////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.h),
                        color: Color.fromARGB(31, 255, 255, 255)),
                    child: walletandOrders()),
              ),
              //////////////////////////////////////////////////////////
            ],
          ),
          Positioned(
            top: 36.h,
            left: 36.w,
            child: SizedBox(
              height: 6.h,
              width: 30.w,
              child: ElevatedButton(
                onPressed: () {},
                child: alltext(
                    txt: "Edit", col: bl, siz: 12.sp, wei: FontWeight.bold),
                style: ElevatedButton.styleFrom(
                  //    shape: ContinuousRectangleBorder(),
                  backgroundColor: wh,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
