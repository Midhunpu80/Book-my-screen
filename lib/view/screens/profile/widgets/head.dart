// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/nav.dart';
import 'package:bookticket/view/screens/profile/widgets/editsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Widget head() {
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 38.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.h),
            color: re,
            gradient: LinearGradient(
                colors: [pp, yl, re, pp],
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => fetchapis.isLoading.value
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        ////<--------user profile--------->///
                        CircleAvatar(
                          backgroundColor: wh,
                          radius: 9.h,
                          backgroundImage: const AssetImage(
                            "images/cas.jpg",
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        ////<-------user name ---------->///

                        SizedBox(
                          child: Obx(() => alltext(
                              txt: currentuser_controll.name.value.toString() !=
                                      fetchapis.ofuser[0].data.signName
                                          .toString()
                                  ? edit_con_name.value.text
                                  : currentuser_controll.name.value.toString(),
                              col: wh,
                              siz: 15.sp,
                              wei: FontWeight.bold)),
                        ),

                        SizedBox(
                          height: 2.h,
                        ),
                        ////<-------user email---------->///
                        SizedBox(
                          child: Obx(
                            () => alltext(
                                txt: currentuser_controll.emails.value !=
                                        fetchapis.ofuser[0].data.signEmail
                                            .toString()
                                    ? edit_con_email.value.text
                                    : currentuser_controll.emails.value
                                        .toString(),
                                col: bl,
                                siz: 12.sp,
                                wei: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ////<-------user phone number --------->///
                        SizedBox(
                          child: Obx(
                            () => alltext(
                                txt: currentuser_controll.phones.value !=
                                        fetchapis.ofuser[0].data.signPhone
                                            .toString()
                                    ? edit_con_phone.value.text
                                    : currentuser_controll.phones.value
                                        .toString(),
                                col: bl,
                                siz: 11.sp,
                                wei: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
            ),
          )));
}
