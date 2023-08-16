// ignore_for_file: prefer_const_declarations, unused_local_variable, non_constant_identifier_names, camel_case_types, avoid_print

import 'dart:convert';

import 'package:bookticket/constant/key/key.dart';
import 'package:bookticket/model/user/cast.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class cast_ViewMovies extends GetxController {
  var isLoading = false.obs;
  RxList<String> ndata = RxList<String>();
  RxList<String> pdata = RxList<String>();

  // RxList<String> newposter = RxList<String>();
  late Cast10 data_cast;
  Future getMovies_Cast({required var ids}) async {
    try {
      isLoading(true);

      final url =
          // ignore: unnecessary_brace_in_string_interps
          "${casturl}${ids.toString()}/credits?api_key=${key}";
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip, deflate',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        data_cast = Cast10.fromJson(jsonData);
        pdata.addAll(data_cast.cast.map((e) => e.name.toString()).toList());
        ndata.forEach((element) {
          print(
              "-------hhh--------------${element.toString()}----------hh-----");
        });

        isLoading(false);
        update();
        return data_cast.cast;
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
    getMovies_Cast(ids: 0);
  }
}
