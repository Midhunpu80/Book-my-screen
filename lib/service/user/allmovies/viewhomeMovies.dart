// ignore_for_file: prefer_const_declarations, unused_local_variable, non_constant_identifier_names

import 'dart:convert';

import 'package:bookticket/constant/key/key.dart';
import 'package:bookticket/model/user/all-movies-model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ServiceViewMovies extends GetxController {
  TopMovieModel? now_Movies;
  var isLoading = false.obs;
  RxList<String> newdata = RxList<String>();

  RxList<String> newposter = RxList<String>();
  RxList<String> idt = RxList<String>();
  RxList<String> rate = RxList<String>();

  RxList<String> lan = RxList<String>();
  RxList<String> overview = RxList<String>();
  RxList<String> rele = RxList<String>();
  RxList<String> dur = RxList<String>();
  RxList<String> gene = RxList<String>();

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
          'Accept-Encoding': 'gzip, deflate',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        TopMovieModel now_Movies = TopMovieModel.fromJson(jsonData);

        newdata.add(now_Movies.title);
        idt.add(now_Movies.id.toString());
        rate.add(now_Movies.voteAverage.toString());
        lan.add(now_Movies.originalLanguage.toString());
        overview.add(now_Movies.overview.toString());
        dur.add(now_Movies.runtime.toString());
        rate.add(now_Movies.voteAverage.toString());
        gene.add(now_Movies.genres.map((e) => e.name.toString()).toString());
        rele.add(now_Movies.releaseDate.toString());

        newposter.add(now_Movies.posterPath);
        print(
            "--------****-------------${idt.toList()}-------------****-----------");
        update();
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
    getMovies(ids: "");
  }
}
