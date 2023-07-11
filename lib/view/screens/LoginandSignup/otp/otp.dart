// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:bookticket/utils/backorpop.dart/back.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/LoginandSignup/otp/widgets/otpfields.dart';
import 'package:bookticket/view/screens/LoginandSignup/otp/widgets/resendotp.dart';
import 'package:bookticket/view/screens/LoginandSignup/otp/widgets/verifybutton.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
  TextEditingController con1 = TextEditingController();
  TextEditingController con2 = TextEditingController();
  TextEditingController con3 = TextEditingController();
  TextEditingController con4 = TextEditingController();
  TextEditingController con5 = TextEditingController();
  TextEditingController con6 = TextEditingController();

// ignore: must_be_immutable
class otpscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        leading: back(),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [////<-------animated otp images ---------->///
            SizedBox(
              height: 25.h,
              width: 100.w,
              child: Lottie.asset("images/r.json"),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              child: alltext(
                  txt: "Verification",
                  col: bl,
                  siz: 15.sp,
                  wei: FontWeight.bold),
            ),
            SizedBox(
              child: alltext(
                  txt: "Enter your OTP code number",
                  col: gy,
                  siz: 10.sp,
                  wei: FontWeight.bold),
            ),
            SizedBox(
              height: 5.h,
            ),
            ////<-------otp fields---------->///
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                children: [
                  otp_fields(
                    mess: "otp",
                    cont: con1,
                    type: TextInputType.number,
                    context: context,
                  ),
                  otp_fields(
                    mess: "otp",
                    cont: con2,
                    type: TextInputType.number,
                    context: context,
                  ),
                  otp_fields(
                    mess: "otp",
                    cont: con3,
                    type: TextInputType.number,
                    context: context,
                  ),
                  otp_fields(
                    mess: "otp",
                    cont: con4,
                    type: TextInputType.number,
                    context: context,
                  ),
                  otp_fields(
                    mess: "otp",
                    cont: con5,
                    type: TextInputType.number,
                    context: context,
                  ),
                  otp_fields(
                    mess: "otp",
                    cont: con6,
                    type: TextInputType.number,
                    context: context,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            ////<-------otp verification button ---------->///
            verifyotp(),
            SizedBox(
              height: 3.h,
            ),
            ////<-------resend otp-------->///
            resendotp(),
          ],
        ),
      ),
    );
  }
}
