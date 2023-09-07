// ignore_for_file: file_names


import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/Home.dart';
import 'package:bookticket/view/screens/ticketscreen.dart/ticketscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

// Widget paymentDone() {
//   return Container(
//     height: 100.h,
//     width: 100.w,
//     color: yl,
//     child: Column(
//       children: [Container()],
//     ),
//   );
// }
class payment_done_screen extends StatelessWidget {
  //var order_id;
  ////payment_done_screen({ required this.order_id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bl,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 25.h,
                width: 60.w,
                child: Lottie.asset(
                  "images/gpay.json",
                ),
              ),
            ),
            alltext(
                txt: "Payment Done", col: gr, siz: 14.sp, wei: FontWeight.bold),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
                width: 80.w,
                child: alltext(
                    txt:
                        "Thank you for completing your secure online\n                 payment.Have a great day!",
                    col: wh,
                    siz: 10.sp,
                    wei: FontWeight.w200)),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Get.to(Home());
                  },
                  icon: Icon(
                    Icons.home,
                    color: wh,
                  ),
                  label: alltext(
                      txt: "Go Home",
                      col: wh,
                      siz: 12.sp,
                      wei: FontWeight.bold),
                  style: ElevatedButton.styleFrom(backgroundColor: gr),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.to(ticket_screen());
                    // single_ticket.getsingleorder(
                    //     id: "64f5a8d8dc80ea33286ee058");
                  },
                  icon: Icon(
                    Icons.airplane_ticket,
                    color: wh,
                  ),
                  label: alltext(
                      txt: "Get Ticket",
                      col: wh,
                      siz: 12.sp,
                      wei: FontWeight.bold),
                  style: ElevatedButton.styleFrom(backgroundColor: re),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
