// ignore_for_file: avoid_print, deprecated_member_use, constant_pattern_never_matches_value_type, camel_case_types

import 'dart:convert';

import 'package:bookticket/service/user/Authentication/exception.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/LoginandSignup/otp/otp.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class authOTP extends GetxController {


  Future getOtp({
    required String email,
  }) async {
    final data = {
      'signEmail': email,
    };

    try {
      final response = await http.post(Uri.parse(sendOTP),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json'
          });

      if (response.statusCode != 200) {
        String reply = response.body.toString();

        print("<-------${reply.toString()}------->");
        //  Get.to(otpscreen());

        Get.snackbar("${response}sucess", "sucess", backgroundColor: wh);
      }
      if (response.statusCode == 201) {
        print("useralredy exit${response.body.toString()}");
        Get.snackbar("${response}user alredy exist", "exitst",
            backgroundColor: blu);
      } else {
        Get.to(otpscreen());
        Get.snackbar("${response.body.toString()}sucess", "sucess",
            backgroundColor: wh);

        print("sucess");
        throw Exception("sucess");
      }
    } catch (e) {
      excep(e);
    }
  }
}
