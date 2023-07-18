// ignore_for_file: avoid_print, deprecated_member_use, constant_pattern_never_matches_value_type, camel_case_types, unused_local_variable

import 'package:bookticket/model/user/view-movies.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';
import 'package:bookticket/view/screens/LoginandSignup/otp/otp.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

dynamic jwt;
var cons = Get.put(ServiceViewMovies());

class service_ViewMovies extends GetxController {
  late ViewMovieModel reply;
  getViewMovies() async {
    try {
      final response = await http.get(Uri.parse(viewmovies), headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Accept': 'application/json',
        'Accept-Encoding': 'gzip, deflate',
      });

      if (response.statusCode == 200) {
        reply = viewMovieModelFromJson(response.body.toString());
        // "<---movies----${reply.data.map((e) => e.movieId).toList().toString()}------->");

        ServiceViewMovies s = ServiceViewMovies();

        print(reply.data.map((e) => e.movieId));

        update();
        return reply;
      } else {
        Get.to(otpscreen());

        print("failed");
        throw Exception("Failed");
      }
    } catch (e) {
      throw Exception("Failed");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getViewMovies();
  }
}
