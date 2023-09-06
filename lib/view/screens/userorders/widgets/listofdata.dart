// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:bookticket/constant/storage.dart';
import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/ticketscreen.dart/ticketscreen.dart';
import 'package:bookticket/view/screens/userorders/controller/userorder_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

var usercolorstore = "color";

FlutterSecureStorage storeage = FlutterSecureStorage();

// ignore: non_constant_identifier_names
final order_controll = Get.put(userorder_controller());

Widget upcomingdataList() {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Card(
      color: bl,
      child: SizedBox(
        height: 82.h,
        width: 200.w,
        child: ListView.separated(
            // reverse: true,
            itemBuilder: (context, index) {
              final activesdata =
                  getalluser_order.reply.data.activeOrders[index];

              return Card(
                child: Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.h), color: wh),
                  child: Row(
                    children: [
                      Container(
                        width: 37.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(1.h),
                                bottomLeft: Radius.circular(1.h)),
                            color: bl.withOpacity(0.3),
                            image: DecorationImage(
                                image: NetworkImage(
                                  activesdata.image.toString(),
                                ),
                                fit: BoxFit.cover)),
                      ),
                      upcomingticketdetails(
                          status: activesdata.status,
                          index: index,
                          id: activesdata.id,
                          moviename: activesdata.movieName,
                          lang: activesdata.language,
                          screen: activesdata.screen,
                          seats: activesdata.selectedSeats
                              .map((e) => e.id)
                              .toList(),
                          ownername: activesdata.ownerName,
                          location: activesdata.location,
                          date: activesdata.date,
                          showtime: activesdata.showTime,
                          qyt: activesdata.selectedSeats.length,
                          price: activesdata.total)
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 1.h,
              );
            },
            itemCount: getalluser_order.reply.data.activeOrders.length),
      ),
    ),
  );
}

Widget upcomingticketdetails(
    {required var index,
    required var moviename,
    required var lang,
    required var screen,
    required var seats,
    required var ownername,
    required var location,
    required var date,
    required var showtime,
    required var qyt,
    required var price,
    required var id,
    required var status}) {
  ///var read = await storeage.read(key: colorstore);
  return Padding(
    padding: EdgeInsets.only(left: 5.h),
    child: SizedBox(
      height: 50.h,
      width: 45.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          alltext(
              txt:
                  // ignore: unnecessary_string_interpolations
                  "${moviename.toString().substring(0, moviename.toString().length)}",
              col: bl,
              siz: 12.sp,
              wei: FontWeight.bold),
          alltext(
              txt:
                  "(${lang.toString().substring(0, lang.toString().length)})  | screen-${screen.toString()}",
              col: bl,
              siz: 9.sp,
              wei: FontWeight.bold),
          alltext(
              txt: "Seats:${seats.toString().substring(1)}",
              col: bl,
              siz: 8.sp,
              wei: FontWeight.bold),
          alltext(
              txt: "${ownername.toString()} | ${location.toString()}",
              col: bl,
              siz: 9.sp,
              wei: FontWeight.bold),
          alltext(
              txt:
                  "${date.toString().substring(0, 12)} | ${showtime.toString()}",
              col: bl,
              siz: 8.sp,
              wei: FontWeight.bold),
          alltext(
              txt: "Qyt:${qyt.toString()}         Rs : ₹${price.toString()}",
              col: bl,
              siz: 8.sp,
              wei: FontWeight.bold),
          // ignore: invalid_use_of_protected_member
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  await storeage.write(
                      key: colorstore,
                      value: cancelorder_controll.reply.data[index].status
                          .toString());
                  Get.to(ticket_screen());
                  await single_ticket.getsingleorder(id: id.toString());

                  ///print(read.toString());
                },
                child: Container(
                  height: 3.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.h), color: gr),
                  child: Center(
                      child: alltext(
                          txt: "Ticket",
                          col: wh,
                          siz: 8.sp,
                          wei: FontWeight.bold)),
                ),
              ),
              SizedBox(
                width: 5.5,
              ),
              InkWell(
                onTap: () async {
                  order_controll.change(index);
                  cancelorder_controll.getcancel_order(ids: id);

                  print(storeage.read(key: colorstore));
                  print(
                      "<----88888----->${localstores.read_thecode(key: colorstore.toLowerCase().toString())}>----8888---->");

                  //  storeage.write(
                  //       key: usercolorstore,
                  //       value: order_controll.change(index));
                },
                child: Container(
                  height: 3.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.h), color: re),
                  child: Obx(
                    () => cancelorder_controll.isLoading.value
                        ? Center(
                            child: alltext(
                                // ignore: invalid_use_of_protected_member
                                txt: status.toString(),
                                col: wh,
                                siz: 8.sp,
                                wei: FontWeight.bold))
                        : Center(
                            child: alltext(
                                // ignore: invalid_use_of_protected_member
                                txt: order_controll.cancelllist.value[index]
                                    ? "canceled"
                                    : cancelorder_controll
                                        .reply.data[index].status
                                        .toString(),
                                col: wh,
                                siz: 8.sp,
                                wei: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
