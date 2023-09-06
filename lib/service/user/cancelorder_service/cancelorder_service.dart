// ignore_for_file: prefer_const_declarations, unused_local_variable, non_constant_identifier_names, camel_case_types, avoid_print

import 'dart:convert';


import 'package:bookticket/model/user/cancelorder10.dart';
import 'package:bookticket/service/user/currentuser/currentuserservice.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class canceloreder_service extends GetxController {
  var isLoading = false.obs;

  late Cancelorder10 reply;

  Future getcancel_order({var ids}) async {
    try {
      isLoading(true);

      final url =
          // ignore: unnecessary_brace_in_string_interps
          "${cancel_order_url}/${ids}";
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip, deflate',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        reply = Cancelorder10.fromJson(jsonData);

        // localstores.write(
        //     key: colorstore, value: jsonData["data"]["status"]["canceled"].toString());
        print(
            "->>>>------corrected ---------------${reply.data.map((e) => e.status.toString()).toList()}------------corrected------------->>>>");

        isLoading(false);
        update();
        return reply;
      } else {
        isLoading(false);

        print("Failed to fetch movies. Status code: ${response.statusCode}");
        throw Exception("Failed to fetch cast");
      }
    } catch (e) {
      print("An error occurred:$e");
      throw Exception("An error occurred while fetching casts");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getcancel_order();
  }
}
