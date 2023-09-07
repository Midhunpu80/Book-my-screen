// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookticket/constant/storage.dart';
import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/nav.dart';
import 'package:bookticket/view/screens/LoginandSignup/loginorRegister/logorReg.dart';
import 'package:bookticket/view/screens/avaliblemovies/AvalibleMovies.dart';
import 'package:bookticket/view/screens/profile/profilescreen.dart';
import 'package:bookticket/view/screens/userorders/userorders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

newdrwer(BuildContext context) {
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

        logout(context),
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
                  getalluser_order.getuser_orders(
                      userid: fetchapis.ofuser[0].data.id.toString());
                  print(fetchapis.ofuser[0].data.id.toString());
                } else if (index == 3) {
                  Get.to(avalible_Movies());
                } else if (index == 2) {
                  // ignore: prefer_const_constructors
                  Get.to(profileScreen());
                } else {
                  Get.back();
                  themedatas.change(data: false);
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

logout(BuildContext context) {
  // ignore: prefer_const_declarations
  final rata = const FlutterSecureStorage();
  return GestureDetector(
    onTap: () async {
      // ignore: await_only_futures
      var data = await rata.read(key: usertoken);
      print("<--row------${data.toString()}----row----->");

      print("Logout");
      // ignore: avoid_single_cascade_in_expression_statements
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Logout',
        desc: 'Are you sure',
        btnCancelOnPress: () async {
          Get.back();
          var lesson = await rata.read(key: usertoken);
          print(lesson.toString());
        },
        btnOkOnPress: () async {
          // ignore: unused_local_variable
          var latea = await rata.delete(key: usertoken.toString());
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const logorReg()),
              (route) => false);
        },
      )..show();
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
