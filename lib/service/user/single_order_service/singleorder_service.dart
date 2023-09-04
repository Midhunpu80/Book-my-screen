// ignore_for_file: prefer_const_declarations, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'package:bookticket/model/user/ticket_model.dart';
import 'package:bookticket/service/user/currentuser/currentuserservice.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class single_order_service extends GetxController {
  var isLoading = false.obs;

  late Ticket10 singleticket;
  Future getsingleorder({var id}) async {
    try {
      isLoading(true);

      final response = await http.get(
        // ignore: unnecessary_brace_in_string_interps
        Uri.parse("${single_order_url}/${id}"),
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip, deflate',
          'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        singleticket = Ticket10.fromJson(jsonData);

        print(
            "-------single ticket--------------${singleticket.data.movieName.toString()}--------single ticket--------");

        isLoading(false);
      } else {
        isLoading(false);

        print("Failed to fetch movies. Status code: ${response.statusCode}");
        throw Exception("data");
      }
    } catch (e) {
      print("An error occurred:$e");
      throw Exception("An error occurred while fetching data");
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getsingleorder();
  }
}
