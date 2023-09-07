// ignore_for_file: unnecessary_string_interpolations, unused_local_variable

import 'package:bookticket/main.dart';
import 'package:bookticket/service/user/seats_service/seatsservice.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/selectSeats/widget/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

// ignore: non_constant_identifier_names
final button_controllers = Get.put(button_seat_selection());

////<-------theater all seats --------->///
Widget seats() {
  return Obx(
    () => seat_controll.isLoading.value
        // ignore: prefer_const_constructors
        ? shimmer_selectseats()
        : SizedBox(
            height: 40.h,
            width: 90.w,
            child: GridView.builder(
                itemCount: seat_controll.allseat.data.screen.totalSeats,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisCount: seat_controll.allseat.data.screen.columns,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  // int rowss = index ~/ 12;
                  int countrows = seat_controll.allseat.data.screen.columns;

                  String seatLetter =
                      String.fromCharCode(index % countrows + 97);
                  return Obx(
                    () => InkWell(
                      onTap: () {
                        button_controllers.toggleButtonSelection(index);

                        var data =
                            "${String.fromCharCode(index ~/ countrows + 65).toString().toUpperCase()}${index % countrows}";
                        print(data);
                        button_controllers.click_count(data);
                      },
                      child: Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: button_controllers.buttonSelections[index]
                                  ? gr
                                  : wh),
                        ),
                        child: Center(
                          child: alltext(
                              txt:
                                  "${String.fromCharCode(index ~/ countrows + 65).toString().toUpperCase()}${index % countrows}",
                              col: wh,
                              siz: 4.sp,
                              wei: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                })),
  );
}
