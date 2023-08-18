// ignore_for_file: non_constant_identifier_names

import 'package:bookticket/main.dart';
import 'package:bookticket/service/user/currentuser/currentuserservice.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/Home.dart/widgets/nav.dart';
import 'package:bookticket/view/screens/profile/widgets/profilefiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

final TextEditingController edit_con_email = TextEditingController(
    text: fetchapis.ofuser[0].data.signEmail.toString());
final TextEditingController edit_con_name = TextEditingController(
    text: fetchapis.ofuser[0].data.signName.toString());
final TextEditingController edit_con_phone = TextEditingController(
    text: fetchapis.ofuser[0].data.signPhone.toString());

editsheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [pp, yl, re, pp],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.h),
                  topRight: Radius.circular(2.h))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                alltext(txt: "Edit", col: bl, siz: 15.sp, wei: FontWeight.bold),
                SizedBox(
                  height: 2.h,
                ),
                pro_textfield("Name", Icons.edit, "please edit", edit_con_name,
                    TextInputType.text, "Name"),
                pro_textfield("Email", Icons.edit, "please edit",
                    edit_con_email, TextInputType.emailAddress, "Email"),
                pro_textfield("Phone", Icons.edit, "please edit",
                    edit_con_phone, TextInputType.phone, "Edit"),
                SizedBox(
                  height: 4.h,
                ),
                submitbutton(),
              ],
            ),
          ),
        );
      });
}

submitbutton() {
  return InkWell(
    onTap: () {
      currentuser_controll.getupdate_user(
          userid: fetchapis.ofuser[0].data.id.toString(),
          email: edit_con_email.text,
          newname: edit_con_name.text,
          editphone: edit_con_phone.text);
      Get.back();
      
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.h),
        color: wh,
      ),
      height: 5.h,
      width: 45.w,
      child: Center(
          child: alltext(
              txt: "UPDATE", col: bl, siz: 10.sp, wei: FontWeight.bold)),
    ),
  );
}
