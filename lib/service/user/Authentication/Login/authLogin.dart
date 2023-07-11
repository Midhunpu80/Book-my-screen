// ignore_for_file: avoid_print, deprecated_member_use, constant_pattern_never_matches_value_type, camel_case_types

import 'dart:convert';

import 'package:bookticket/service/user/Authentication/exception.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/Home.dart/Home.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class authLogin extends GetxController {
  final Dio dio = Dio();

  Future getLogin({required String email, required String password}) async {
    final data = {
      'loginEmail': email,
      'loginPassword': password,
      'type': 'user',
    };

    try {
      final response = await http.post(Uri.parse(loginurl),
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        String reply = response.body.toString();

        print("<-------${reply.toString()}------->");
        print("success");

        // ignore: prefer_const_constructors
        Get.to(Home());

        Get.snackbar("${response}sucess", "logined", backgroundColor: blu);
      } else {
        Get.snackbar("${response.body.toString()}failed",
            "incorrct password /and username ",
            backgroundColor: wh);

        print("Failed to get data");
        throw Exception("Failed to get data");
      }
    } catch (e) {
      excep(e);
    }
  }
}