import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/shimmerWidgets.dart';
import 'package:bookticket/view/screens/search/widgets/movielist.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

Widget shimmer_search_reasult(){
  return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 75.h,
          width: 100.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.h)),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                 
                  // consand = cos.newdata;
                  return InkWell(
                    splashColor: gr,
                    onTap: () {
                    
                    },
                    child: Obx(
                      () => Row(
                        children: [
                          Shimmer.fromColors(
                            highlightColor: highcol,
                            baseColor: basecol,
                            child: Container(
                              height: 12.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                 
                                  borderRadius: BorderRadius.circular(1.h),
                                  color: highcol),
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SizedBox(
                                width: 50.w,
                                child: alltext(
                                    txt:""
                                      ,
                                    col: wh,
                                    siz: 12.sp,
                                    wei: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 2.h,
                  );
                },
                itemCount: serch_contolx.fonts.length,
              ))));
}