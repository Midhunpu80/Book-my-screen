import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

ticket_dialouge({required BuildContext context}) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.rightSlide,
    title: 'PAYMENT DONE',
    desc:
        'Thank you for completing your secure online payment.\nHave a great day!',
    btnCancelText:
        alltext(txt: "Get Ticket", col: wh, siz: 13.sp, wei: FontWeight.bold),
    btnCancelOnPress: () {
      Get.to(Home());
    },
    btnOkText:
        alltext(txt: "Go Home", col: wh, siz: 13.sp, wei: FontWeight.bold),
    btnOkOnPress: () {
      Get.to(Home());
    },
  )..show();
}
