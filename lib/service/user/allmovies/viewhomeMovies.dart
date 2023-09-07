// ignore_for_file: prefer_const_declarations, unused_local_variable, non_constant_identifier_names

import 'dart:convert';
import 'dart:math';

import 'package:bookticket/constant/key/key.dart';
import 'package:bookticket/model/user/all-movies-model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ServiceViewMovies extends GetxController {
  late TopMovieModel now_Movies;
  var isLoading = false.obs;

  RxList<String> idt = RxList<String>();

  RxList<String> gene = RxList<String>();
  RxMap<dynamic, RxList<String>> allofthem = RxMap<dynamic, RxList<String>>();
  RxList<Map<String, dynamic>> allmoviesdetailsdata =
      RxList<Map<String, dynamic>>([]);

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
        now_Movies = TopMovieModel.fromJson(jsonData);
        Map<String, dynamic> newData = {
          'title': now_Movies.title.toString(),
          'poster': now_Movies.posterPath.toString(),
          "rate": now_Movies.voteAverage.toString(),
          "language": now_Movies.originalLanguage,
          "overview": now_Movies.overview.toString(),
          "duration": now_Movies.runtime.toString(),
          "release": now_Movies.releaseDate.toString(),
          "id": now_Movies.id.toString(),
          // ... add more key-value pairs as needed
        };
        allmoviesdetailsdata.add(newData);
        print(
            "/////////${allmoviesdetailsdata.map((element) => element["title"]).toList().toString()}\\\\");

        // newdata.add(now_Movies.title);
        idt.add(now_Movies.id.toString());
        // rate.add(now_Movies.voteAverage.toString());
        // lan.add(now_Movies.originalLanguage.toString());
        // overview.add(now_Movies.overview.toString());
        // dur.add(now_Movies.runtime.toString());
        // rate.add(now_Movies.voteAverage.toString());
        gene.add(now_Movies.genres.map((e) => e.name.toString()).toString());
        // rele.add(now_Movies.releaseDate.toString());
        // allofthem.putIfAbsent("one", () => rate);
        print(allofthem["one"]);

        // newposter.add(now_Movies.posterPath);
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
    getMovies(ids: 0);
  }
}
