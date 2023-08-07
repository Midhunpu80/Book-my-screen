// ignore_for_file: prefer_const_declarations, unused_local_variable, non_constant_identifier_names

import 'dart:convert';

import 'package:bookticket/constant/key/key.dart';
import 'package:bookticket/model/user/banner.dart';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class banner_ViewMovies extends GetxController {
  var isLoading = false.obs;

  late Banner10 data_banner;
  Future getMovies_banner() async {
    try {
      isLoading(true);

      final url =
          // ignore: unnecessary_brace_in_string_interps
          "https://api.themoviedb.org/3/movie/upcoming?api_key=460e03dc6bd3091d6d11c7b4a1fed2b5&&with_genres=28";
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
        data_banner = Banner10.fromJson(jsonData);

        print(
            "-------twt--------------${data_banner.results.map((e) => e.originalTitle)}--------twt--------");

        isLoading(false);
      } else {
        isLoading(false);

        print("Failed to fetch movies. Status code: ${response.statusCode}");
        throw Exception("Failed to fetch banner");
      }
    } catch (e) {
      print("An error occurred:$e");
      throw Exception("An error occurred while fetching banner");
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getMovies_banner();
  }
}
