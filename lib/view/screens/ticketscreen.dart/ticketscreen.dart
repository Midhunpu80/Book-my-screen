import 'package:bookticket/main.dart';
import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/ticketscreen.dart/widget/ticketdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';

class ticket_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: alltext(
            txt: "Movie Ticket", col: wh, siz: 13.sp, wei: FontWeight.bold),
        centerTitle: true,
        leading: back(),
        backgroundColor: bl,
      ),
      backgroundColor: bl,
      body: Obx(
        () => single_ticket.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Column(

                /// mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: Card(
                        child: Stack(
                          children: [
                            Container(
                              height: 80.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    yl,
                                    re,
                                  ]),
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.2),
                                          BlendMode.dstATop),
                                      image: NetworkImage(
                                        single_ticket.singleticket.data.image
                                            .toString(),
                                      ),
                                      fit: BoxFit.cover),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset.infinite,
                                      color: wh,
                                      spreadRadius: 8.8,
                                      blurRadius: 0.5,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(1.h),
                                  color: wh),
                              // ignore: prefer_const_constructors
                              child: ticket_details(),
                            ),
                            Positioned(
                              top: 30.h,
                              child: Container(
                                height: 6.h,
                                width: 8.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(6.h),
                                        bottomRight: Radius.circular(6.h)),
                                    color: bl),
                              ),
                            ),
                            Positioned(
                              top: 30.h,
                              left: 41.h,
                              child: Container(
                                  height: 6.h,
                                  width: 8.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(6.h),
                                          bottomLeft: Radius.circular(6.h)),
                                      color: bl)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
      ),
    );
  }
}
