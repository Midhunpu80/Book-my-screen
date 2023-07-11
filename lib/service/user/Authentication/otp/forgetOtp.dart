// ignore_for_file: avoid_print, deprecated_member_use, constant_pattern_never_matches_value_type, camel_case_types, non_constant_identifier_names

import 'dart:convert';

import 'package:bookticket/service/user/Authentication/exception.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/Home.dart/Home.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class autforget extends GetxController {
  Future getForget_Otp({
    required String otp,
  }) async {
    final data = {
      'signEmail': otp,
    };

    try {
      final response = await http.post(Uri.parse(sendOTP),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json'
          });

      if (response.statusCode == 201 || response.statusCode == 201) {
        String reply = response.body.toString();

        print("<----Forget---${reply.toString()}---otp---->");
        print("success");

        Get.to(Home());
        Get.snackbar("${response}sucess", "logined", backgroundColor: wh);
      } else {
        Get.snackbar("${response.body.toString()}failed", "incorrect otp ",
            backgroundColor: wh);

        print("Failed to get data");
        throw Exception("Failed to get data");
      }
    } catch (e) {
      excep(e);
    }
  }
}
