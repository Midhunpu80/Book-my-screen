// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:bookticket/constant/storage.dart';
import 'package:bookticket/main.dart';
import 'package:bookticket/model/user/userorders_model.dart';
import 'package:bookticket/service/user/currentuser/currentuserservice.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class userorders_service extends GetxController {
  var isLoading = false.obs;
  late Userorders10 reply;

  getuser_orders({required var userid}) async {
        var datatoken = await securedata.read(key: usertoken);

    ///var mutli = fees + subtotal;

    final Map<String, dynamic> bdy = {"_id": userid};

    try {
      isLoading.value = true;

      final response = await http.post(Uri.parse(get_userorders_url),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Accept-Encoding': 'gzip, deflate',
            'Authorization': 'Bearer $datatoken'
          },
          body: jsonEncode(bdy));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        reply = Userorders10.fromJson(data);

        print(
            "----------------------------------------${reply.data.activeOrders.map((e) => e.movieName.toString()).toList()}");

        print(data.toString());
        isLoading.value = false;

        update();
      } else {
        isLoading.value = false;

        throw ("is failed${response.statusCode}");
      }
    } catch (e) {
      isLoading(false);
      // ignore: unnecessary_brace_in_string_interps
      throw ("${e}");
    } finally {
      isLoading.value = false;
    }
    update();
  }
}
