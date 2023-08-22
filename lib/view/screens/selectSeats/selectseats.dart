import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/selectSeats/widget/screen.dart';
import 'package:bookticket/view/screens/selectSeats/widget/seats.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class selectseats extends StatelessWidget {
  var movie;
  var time;
  var date;
  var ownername;

  selectseats({
    super.key,
    required this.movie,
    required this.time,
    required this.date,
    required this.ownername,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 80.w,
            height: 6.h,
            child: FloatingActionButton(
              onPressed: () {},
              child: alltext(
                  txt: "PayNow ₹${200}",
                  col: wh,
                  siz: 11.sp,
                  wei: FontWeight.bold),
              backgroundColor: re,
            )),
      ),
      backgroundColor: bl,
      appBar: AppBar(
        toolbarHeight: 9.h,
        centerTitle: true,
        title: alltext(
            txt: "Open Heimer", col: yl, siz: 14.sp, wei: FontWeight.w600),
        leading: back(),
        backgroundColor: Colors.transparent,
        actions: [
          searchico(),

          const SizedBox(
            width: 8,
          ),
          //  Spacer(flex: 1,),
          settingico(),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
      body:Column(
        children: [
          ////<-------movie information ---------->///
          informationaboutmovie(
              movie: movie, ownername: ownername, date: date, time: time),
      
          Padding(
              padding: EdgeInsets.only(left: 35.h),
              child: 
               SizedBox(
                  child:    Obx(()=> alltext(
                      txt: " & ${ button_controllers.counter.value.toString()} tickets",
                      col: re,
                      siz: 10.sp,
                      wei: FontWeight.bold),
                ),
              
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          SizedBox(
            child: alltext(
                txt: "Screen", col: wh, siz: 12.sp, wei: FontWeight.bold),
          ),
          SizedBox(
            height: 2.h,
          ),
          ////<-------theater screen---------->///
          screens(),
          ////<-------theater ststus avalible seats and alredy booked seats all informations ---------->///
          status(),
        ],
      ),
    );
  }
}
