import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/selectSeats/widget/seats.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';

////<-------theater white screen---------->///
Widget screens() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: const BoxDecoration(),
      height: 50.h,
      width: 100.w,
      child: Column(
        children: [
          Column(
            children: [
              Center(
                  child: Container(
                height: 1.h,
                width: 60.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: wh,
                    boxShadow: [BoxShadow(color: wh, blurRadius: 10)]),
              )),
              SizedBox(
                height: 6.h,
              ),
              Container(
                height: 1.h,
                width: 30.w,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                          color: yl,
                          blurRadius: 90,
                          offset: const Offset(05, 5))
                    ]),
              ),
              seats(),
            ],
          )
        ],
      ),
    ),
  );
}

////<-------  theater status avalile seats and booked status --------->///
Widget status() {
  return Container(
    height: 8.h,
    width: 95.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.h), color: wh.withOpacity(0.3)),
    child: Row(
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(bottom: 1.h),
          child: ListTile(
            title: alltext(
                txt: "Avalible", col: wh, siz: 8.sp, wei: FontWeight.bold),
            leading: Container(
              height: 3.h,
              width: 6.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: bl), color: wh),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(bottom: 1.h),
          child: ListTile(
            title:
                alltext(txt: "Sold", col: wh, siz: 8.sp, wei: FontWeight.bold),
            leading: Container(
              height: 3.h,
              width: 6.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: bl), color: yl),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(bottom: 1.h),
          child: ListTile(
            title: alltext(
                txt: "Select", col: wh, siz: 8.sp, wei: FontWeight.bold),
            leading: Container(
              height: 3.h,
              width: 6.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: bl), color: gr),
            ),
          ),
        ))
      ],
    ),
  );
}

////<-------theater which movie try book ---------->///
Widget informationaboutmovie(
    {required var movie,
    required var ownername,
    required var date,
    required var time}) {
  return Obx(
    () => date_controll.isLoading.value
        ? CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 10.h,
              width: 95.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.h),
                border: Border.all(width: 1, color: wh),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: alltext(
                        txt: movie, col: wh, siz: 12.sp, wei: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        alltext(
                            txt: "${ownername.toString()}|",
                            col: wh,
                            siz: 10.sp,
                            wei: FontWeight.w500),
                        alltext(
                            txt: "English-3D|",
                            col: wh,
                            siz: 10.sp,
                            wei: FontWeight.w500),
                        alltext(
                            txt: "${date.toString()}|",
                            col: wh,
                            siz: 9.sp,
                            wei: FontWeight.w500),
                        alltext(
                            txt: "${time.toString()}",
                            col: wh,
                            siz: 10.sp,
                            wei: FontWeight.w500),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
  );
}
