// ignore_for_file: file_names

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget walletandOrders() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            alltext(txt: "WALLET", col: wh, siz: 12.sp, wei: FontWeight.bold),
            alltext(txt: "ORDERS", col: wh, siz: 12.sp, wei: FontWeight.bold)
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          orderandwalletcontainer(icon: Icons.wallet),
          orderandwalletcontainer(icon: Icons.shopping_cart)
        ],
      )
    ],
  );
}

Widget orderandwalletcontainer({required IconData icon}) {
  return Container(
    height: 31.h,
    width: 39.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2.h),
      color: wh,
      gradient: LinearGradient(
          colors: [pp, yl, re, pp],
          begin: Alignment.bottomLeft,
          end: Alignment.topCenter),
    ),
    child: IconButton(
      onPressed: () {},
      icon: Icon(icon),
      color: wh,
      iconSize: 13.h,
    ),
  );
}
