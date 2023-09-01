// ignore_for_file: unnecessary_string_interpolations

import 'package:bookticket/main.dart';
import 'package:bookticket/service/user/seats_service/seatsservice.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

final button_controllers = Get.put(button_seat_selection());

////<-------theater all seats --------->///
Widget seats() {
  return Obx(
    () => seat_controll.isLoading.value
        // ignore: prefer_const_constructors
        ? CircularProgressIndicator()
        : SizedBox(
            height: 40.h,
            width: 80.w,
            child: GridView.builder(
              itemCount: seat_controll.allseat.data.screen.totalSeats,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.7,
                crossAxisCount: 12,
                crossAxisSpacing: 9,
                mainAxisSpacing: 9,
              ),
              itemBuilder: (context, index) {
                int rowss = index ~/ 12;
                if (index ~/ 12 == -1) {
                  return Container(
                    height: 18,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: pp),
                    ),
                    child: Center(
                      child: alltext(
                          txt:
                              "${String.fromCharCode(rowss + 6).toString().toUpperCase()}",
                          col: wh,
                          siz: 7.sp,
                          wei: FontWeight.bold),
                    ),
                  );
                }
                if (index % 12 == 0) {
                  // Check if it's the first column
                  return Container(
                    height: 18,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: pp),
                    ),
                    child: Center(
                      child: alltext(
                          txt:
                              "${String.fromCharCode(index ~/ 12 + 65).toString().toUpperCase()}",
                          col: wh,
                          siz: 7.sp,
                          wei: FontWeight.bold),
                    ),
                  );
                } else if (index % 12 != 0) {
                  return Obx(
                    () => InkWell(
                      onTap: () {
                        var data =
                            "${String.fromCharCode(index ~/ 12 + 65).toString().toUpperCase()}-${index % 12}";
                        button_controllers.click_count(data);
                        // ignore: unnecessary_brace_in_string_interps
                        print("kop---------------${data}----------");
                        button_controllers.toggleButtonSelection(index);

                        // ignore: avoid_print
                        print(
                            " ${String.fromCharCode(index ~/ 12 + 65).toString().toUpperCase()}-${index % 12}");
                      },
                      child: Container(
                        height: 18,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: button_controllers.buttonSelections[index]
                                  ? gr
                                  : wh),
                        ),
                        child: Center(
                            child: alltext(
                                // ignore: unnecessary_brace_in_string_interps
                                txt:
                                    " ${String.fromCharCode(index ~/ 12 + 65).toString().toUpperCase()}-${index % 12}",
                                col: wh,
                                siz: 5.sp,
                                wei: FontWeight.bold)),
                      ),
                    ),
                  );
                } else {
                  return Obx(
                    () => InkWell(
                      onTap: () {
                        button_controllers.toggleButtonSelection(index);

                        // ignore: avoid_print
                        print(
                            " ${String.fromCharCode(index ~/ 12 + 65).toString().toUpperCase()}-${index % 12}");
                      },
                      child: Container(
                        height: 18,
                        width: 100,
                        decoration: BoxDecoration(
                          /// color:  button_controllers.buttonSelections[index]?gr:wh,
                          border: Border.all(
                              width: 1,
                              color: button_controllers.buttonSelections[index]
                                  ? gr
                                  : wh),
                        ),
                        child: Center(
                            child: alltext(
                                // ignore: unnecessary_brace_in_string_interps
                                txt:
                                    " ${String.fromCharCode(index ~/ 12 + 65).toString().toUpperCase()}-${index % 12}",
                                col: wh,
                                siz: 6.sp,
                                wei: FontWeight.bold)),
                      ),
                    ),
                  );
                }
              },
            )),
  );
}
