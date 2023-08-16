// import 'package:bookticket/main.dart';
// import 'package:bookticket/utils/colors/colors.dart';
// import 'package:bookticket/utils/text/text.dart';
// import 'package:bookticket/view/screens/search/widgets/movielist.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// resultList() {
//   return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 75.h,
//         width: 100.w,
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.h)),
//         // child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView.separated(
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   splashColor: gr,
//                   onTap: () {},
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 12.h,
//                         width: 30.w,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                     "https://image.tmdb.org/t/p/original/${conswnd.poster[index].toString()}"),
//                                 fit: BoxFit.cover),
//                             borderRadius: BorderRadius.circular(1.h),
//                             color: wh),
//                         child: Image.network(
//                           "https://image.tmdb.org/t/p/original/${conswnd.poster[index].toString()}",
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: SizedBox(
//                             width: 50.w,
//                             child: alltext(
//                                 txt: conswnd.result[index],
//                                 col: wh,
//                                 siz: 12.sp,
//                                 wei: FontWeight.bold)),
//                       )
//                     ],
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return SizedBox(
//                   height: 2.h,
//                 );
//               },
//               itemCount: conswnd.result.length),
//         ),
//       ));
// }
