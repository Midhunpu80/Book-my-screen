// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, must_be_immutable

import 'package:bookticket/main.dart';
import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/Home.dart';
import 'package:bookticket/view/screens/payment_summary/widgets/payment%20card.dart';
import 'package:bookticket/view/screens/selectSeats/widget/seats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
// ignore: depend_on_referenced_packages
import 'package:razorpay_flutter/razorpay_flutter.dart';

class payment_summary_screen extends StatefulWidget {
  var img;
  var moviename;
  var screen;
  var ownername;
  var date;
  var showtime;
  var location;
  // ignore: use_key_in_widget_constructors

  // ignore: use_key_in_widget_constructors
  payment_summary_screen(
      {required this.img,
      required this.moviename,
      required this.screen,
      required this.ownername,
      required this.date,
      required this.showtime,
      required this.location});

  @override
  State<payment_summary_screen> createState() => _payment_summary_screenState();
}

class _payment_summary_screenState extends State<payment_summary_screen> {
  double ticketprice = button_controllers.price.value.toDouble();

  double convicefee = seat_controll.allseat.data.showData.price / 6.toDouble();

// button_controllers.totals = ticketprice.toDouble() + convicefee.toDoible();'
  var razorpay = Razorpay();

  @override
  void initState() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("sucess");
    Get.to(Home());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SizedBox(
          width: 90.w,
          height: 6.h,
          child: FloatingActionButton(
            onPressed: () async {
              dynamic options = {
                'key': 'rzp_test_LS04j2FVS1akZj',
                'amount': 500 * 100,
                'name': "BuyMyticket",
                'timeout': 300,
              };

              razorpay.open(options);
            },
            child: alltext(
                txt: "procced", col: wh, siz: 12.sp, wei: FontWeight.bold),
            backgroundColor: re,
          ),
        ),
        backgroundColor: bl,
        appBar: AppBar(
          backgroundColor: bl,
          leading: back(),
          centerTitle: true,
          title: alltext(
              txt: "Booking-Summary",
              col: wh,
              siz: 12.sp,
              wei: FontWeight.bold),
          toolbarHeight: 8.h,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 4.h,
              ),
              paymentcard(
                  img: widget.img,
                  moviename: widget.moviename,
                  date: widget.date,
                  ownername: widget.ownername.toString(),
                  showtime: widget.showtime.toString(),
                  screen: widget.screen.toString(),
                  location: widget.location.toString()),
            ],
          ),
        ));
  }
}
