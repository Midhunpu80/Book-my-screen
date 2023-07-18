import 'package:bookticket/service/user/allmovies/cast.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

////<-------all cast of this movie --------->///
Widget cast() {
  final ban = Get.put(cast_ViewMovies());
  return Obx(
    () => ban.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            height: 18.h,
            width: 200.w,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ////<-------images of all actors who acted in this movie --------->///
                        Container(
                          height: 11.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/original/${ban.data_cast.cast[index].profilePath.toString()}"),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(205.h),
                              color: bl.withOpacity(0.3)),
                        ),
                        ////<-------all actors name who acted in this movie---------->///
                        alltext(
                            txt: ban.data_cast.cast[index].name,
                            col: wh,
                            siz: 12.sp,
                            wei: FontWeight.w400)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 1.w,
                  );
                },
                itemCount: ban.data_cast.cast.length > 8
                    ? 8
                    : ban.data_cast.cast.length),
          ),
  );
}
