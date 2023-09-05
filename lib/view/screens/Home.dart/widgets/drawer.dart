import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/nav.dart';
import 'package:bookticket/view/screens/avaliblemovies/AvalibleMovies.dart';
import 'package:bookticket/view/screens/profile/profilescreen.dart';
import 'package:bookticket/view/screens/search/searchscreen.dart';
import 'package:bookticket/view/screens/userorders/userorders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

List<String> drwData = ["Your orders", "Wallet", "Chat", "Settings", "Exit"];
List<IconData> drwicon = [
  Icons.shopping_cart,
  Icons.wallet,
  Icons.chat_bubble_outline,
  Icons.settings,
  Icons.exit_to_app
];

newdrwer() {
  return SafeArea(
    child: Column(
      children: [
        //Container(child: alltext(txt: "Hi Midhun ", col: wh, siz: 15.sp, wei: FontWeight.bold),),
        Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: Container(
            height: 10.h,
            width: 20.w,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: wh),
              borderRadius: BorderRadius.circular(
                100.h,
              ),
              color: re,
            ),
            child: IconButton(
              onPressed: () {
                // ignore: prefer_const_constructors
                Get.to(profileScreen());
              },
              icon: Icon(
                Icons.person,
                size: 5.h,
                color: wh,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          child: alltext(
              txt: "Profile", col: wh, siz: 14.sp, wei: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        drwlists(),
        SizedBox(
          height: 10.h,
        ),

        logout(),
      ],
    ),
  );
}

Widget drwlists() {
  return Container(
    height: 50.h,
    width: 100.w,
    color: Colors.transparent,
    child: ListView.separated(
        itemBuilder: (context, index) {
          // ignore: avoid_unnecessary_containers
          return Container(
            child: ListTile(
              onTap: () async {
                fetchapis.fetch();

                if (index == 4) {
                  Get.back();
                } else if (index == 0) {
                  // ignore: prefer_const_constructors
                  Get.to(userorders_screen());
                  await getalluser_order.getuser_orders(
                      userid: fetchapis.ofuser[0].data.id.toString());
                  print(fetchapis.ofuser[0].data.id.toString());
                } else if (index == 3) {
                  Get.to(avalible_Movies());
                } else if (index == 2) {
                  // ignore: prefer_const_constructors
                  Get.to(profileScreen());
                } else {
                  Get.back();
                }

                //  index != 1 ? Get.back() : Get.to(avalible_Movies());
              },
              leading: Icon(
                drwicon[index],
                color: wh,
                size: 4.h,
              ),
              title: alltext(
                  txt: drwData[index],
                  col: wh,
                  siz: 10.sp,
                  wei: FontWeight.bold),
            ),
          );
        },
        separatorBuilder: (context, index) {
          // ignore: prefer_const_constructors
          return Divider();
        },
        itemCount: 5),
  );
}

logout() {
  return GestureDetector(
    onTap: () {
      print("Logout");
    },
    child: Container(
      height: 6.h,
      width: 70.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.h),
          color: bl,
          border: Border.all(width: 2, color: wh)),
      child: Center(
          child: alltext(
              txt: "Logout", col: wh, siz: 15.sp, wei: FontWeight.w500)),
    ),
  );
}
