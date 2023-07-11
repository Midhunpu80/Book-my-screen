// ignore_for_file: avoid_print, deprecated_member_use, constant_pattern_never_matches_value_type, camel_case_types

import 'dart:convert';
import 'dart:math';

import 'package:bookticket/service/user/Authentication/exception.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class authsignup extends GetxController {
  final Dio dio = Dio();

  Future getsignup(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required password2,
      required String otp}) async {
    final data = {
      "userSignup": {
        "signName": name.toString(),
        "signEmail": email.toString(),
        "signPhone": phone.toString(),
        "signPassword": password.toString(),
        "signCPassword": password2.toString(),
      },
      "otp": otp,
    };

    try {
      final response = await http.post(Uri.parse(signUpurl),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
          },
          encoding: Encoding.getByName('utf-8'));

      if (response.statusCode == 201 || response.statusCode == 201) {
        String reply = response.body.toString();
        log(response.statusCode);
        //    print(response.statusCode == 500);

        print("<-------${reply.toString()}------->");
        print(response.statusCode);
        return reply.toString();
        // ignore: prefer_const_constructors
      } else {
        Get.snackbar("Status", "incorrect Otp", backgroundColor: wh);
        log(response.statusCode);
        print("Failed to get data");
        throw Exception("Failed to get data");
      }
    } catch (e) {
      excep(e);
    }
  }
}
