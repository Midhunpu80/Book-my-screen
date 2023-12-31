// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors

import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/utils/text/text.dart';
import 'package:bookticket/view/screens/LoginandSignup/register/widgets/ima.dart';
import 'package:bookticket/view/screens/LoginandSignup/register/widgets/regbutton.dart';
import 'package:bookticket/view/screens/LoginandSignup/register/widgets/textfild.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

final formkey = GlobalKey<FormState>();
final TextEditingController Regname = TextEditingController();
final TextEditingController Regemail = TextEditingController();
final TextEditingController Regphone = TextEditingController();
final TextEditingController Regpass = TextEditingController();
final TextEditingController Regrepass = TextEditingController();

class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: bl,
          body: SingleChildScrollView(
            ///decoration: BoxDecoration(image:DecorationImage(image: AssetImage("images/619306-bg-full-netflix-grid-v2.desktop.jpg"),fit: BoxFit.fill)),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        child: alltext(
                            txt: "Welcome",
                            col: wh,
                            siz: 22.sp,
                            wei: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(alignment: Alignment.topLeft, child: regimg()),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),

                  SizedBox(
                    child: alltext(
                        txt: "Create Account ?",
                        col: wh,
                        siz: 12.sp,
                        wei: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  ////<-------Register fields ---------->///
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        textfield(
                            "Enter Your Name",
                            Icons.person,
                            "Please Enter Your Name",
                            Regname,
                            TextInputType.name),
                        textfield(
                            "Enter your Email ID",
                            Icons.email,
                            "Please Enter Your Email",
                            Regemail,
                            TextInputType.emailAddress),
                        textfield(
                            "Enter  Phone Number",
                            Icons.phone,
                            "Please Enter Your Phone Number",
                            Regphone,
                            TextInputType.phone),
                        textfield(
                            "Enter Your Name Password",
                            Icons.lock,
                            "Please Enter Your Password",
                            Regpass,
                            TextInputType.text),
                        textfield(
                            "Re Enter Your Password ",
                            Icons.lock,
                            "Please ReEnter Your Name",
                            Regrepass,
                            TextInputType.text),
                        SizedBox(
                          height: 3.h,
                        ),
                        ////<-------Register button--------->///
                        regbutton(),
                        SizedBox(
                          height: 1.h,
                        ),
                        alltext(
                            txt: "or",
                            col: wh,
                            siz: 13.sp,
                            wei: FontWeight.bold),
                        SizedBox(
                          height: 1.h,
                        ),
                        ////<-------Login button --------->///
                        logbutton(),
                        SizedBox(
                          height: 2.h,
                        ),
                        alltext(
                            txt: "you have Already an Account/sign up?",
                            col: wh,
                            siz: 9.sp,
                            wei: FontWeight.bold),
                      ],
                    ),
                  )

                  // ignore: sized_box_for_whitespace
                ],
              ),
            ),
          )),
    );
  }
}
