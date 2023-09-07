
// ignore_for_file: camel_case_types

import 'package:bookticket/constant/storage.dart';
import 'package:bookticket/main.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/Home.dart/Home.dart';
import 'package:bookticket/view/screens/LoginandSignup/loginorRegister/logorReg.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
   delay(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 100.h,
          width: 200.w,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [re, or])),
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
              ),
              SizedBox(
                ///: bl,
                height: 30.h,
                width: 60.w,
                child: Image.asset(
                  "images/as.png",
                ),
              ),
              SizedBox(
                height: 20.h,
                width: 10.w,
                child: Center(
                  child: CircularProgressIndicator(
                    color: wh,
                  ),
                ),
              )
            ],
          )),
    );
  }

  delay(BuildContext context) async {
    var datalocal = await securedata.read(key: usertoken);

    await Future.delayed(Duration(seconds: 6));
    if (datalocal.toString().isEmpty||datalocal==null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => logorReg()));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
      var sata =
          cons.reply.data.map((e) => e.movieId.toString()).forEach((element) {
        cons1.getMovies(ids: element);
      });
    }
  }
}
