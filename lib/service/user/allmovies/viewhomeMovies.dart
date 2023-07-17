// ignore_for_file: prefer_const_declarations, unused_local_variable, non_constant_identifier_names

import 'dart:convert';

import 'package:bookticket/constant/key/key.dart';
import 'package:bookticket/model/user/all-movies-model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ServiceViewMovies extends GetxController {
  late TopMovieModel now_Movies;
  var isLoading = false.obs;
  RxList<String> newdata = RxList<String>();

  RxList<String> newposter = RxList<String>();

  Future getMovies({required var ids}) async {
    try {
      isLoading(true);

      final url =
          "https://api.themoviedb.org/3/movie/${ids.toString()}?api_key=$key";
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        TopMovieModel now_Movies = TopMovieModel.fromJson(jsonData);
        // newdata.clear();
        // newposter.clear();
        newdata.add(now_Movies.title);

        newposter.add(now_Movies.posterPath);

        isLoading(false);
      } else {
        isLoading(false);

        print("Failed to fetch movies. Status code: ${response.statusCode}");
        throw Exception("Failed to fetch movies");
      }
    } catch (e) {
      print("An error occurred:$e");
      throw Exception("An error occurred while fetching movies");
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getMovies(ids: 0);
  }
}
