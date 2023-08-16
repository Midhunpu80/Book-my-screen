// import 'package:bookticket/service/user/serchmovies/serchmovies_service.dart';
// import 'package:bookticket/utils/colors/colors.dart';
// import 'package:bookticket/utils/text/text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class h extends StatelessWidget {
//   final w = Get.put(fetchcontroll());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 100.h,
//         width: 200.w,
//         color: blu,
//         child: Obx(
//           () => w.isLoading.value
//               // ignore: prefer_const_constructors
//               ? Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                   itemCount: w.dataList.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       color: gr,
//                       height: 10.h,
//                       width: 10.w,
//                       child: ListTile(
//                         title: alltext(
//                             txt: w.dataList[index].data[index].title.toString(),
//                             col: re,
//                             siz: 12.sp,
//                             wei: FontWeight.bold),
//                       ),
//                     );
//                   }),
//         ),
//       ),
//     );
//   }
// }
