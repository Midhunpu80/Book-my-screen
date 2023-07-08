import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/LoginandSignup/Login/Login.dart';
import 'package:bookticket/view/screens/LoginandSignup/otp/widgets/otpfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class otpscreen extends StatelessWidget {
  TextEditingController con1 = TextEditingController();
  TextEditingController con2 = TextEditingController();
  TextEditingController con3 = TextEditingController();
  TextEditingController con4 = TextEditingController();
  TextEditingController con5 = TextEditingController();
  TextEditingController con6 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  txt: "Verification", col: bl, siz: 15.sp, wei: FontWeight.bold),
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
            SizedBox(
              height: 5.h,
              width: 70.w,
              child: ElevatedButton.icon(
                onPressed: () {
                  
                  Get.to(login());
                },
                icon: const Icon(
                  Icons.login,
                  color: Colors.transparent,
                ),
                label: alltext(
                    txt: "Verify", col: wh, siz: 14.sp, wei: FontWeight.bold),
                style: ElevatedButton.styleFrom(backgroundColor: pp),
              ),
            ),
            SizedBox(height: 3.h,),
              SizedBox(
              child: alltext(
                  txt: "Didnt you Recieve any code ?",
                  col: gy,
                  siz: 10.sp,
                  wei: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
