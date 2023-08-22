// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:bookticket/model/user/theater_show_time10/theater_show_time10.dart';
import 'package:bookticket/service/user/currentuser/currentuserservice.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class getdates_service extends GetxController {
  var isLoading = false.obs;
  late TheaterShowtime10 reply;
  var movieShows = <TheaterShowtime10>[].obs;
  RxList<Datum> showtimes = <Datum>[].obs;

  @override
  void onInit() {
    getcurrent_Dates();

    super.onInit();
  }

  // ignore: non_constant_identifier_names
  Future<List<Datum>> getcurrent_Dates({var movie, var date}) async {
    update();
    final bdy = {
      "date": date.toString(),
      "response": {"title": movie.toString()}
    };
    try {
      isLoading(true);
      final response = await http
          .post(Uri.parse(dates_url), body: jsonEncode(bdy), headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Accept': 'application/json',
        'Accept-Encoding': 'gzip, deflate',
        'Authorization': 'Bearer $token'
      });
      showtimes.clear();

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        final theatershowtime = TheaterShowtime10.fromJson(data);
        showtimes.assignAll(theatershowtime.data);
        showtimes.refresh();
        // ignore: avoid_print
        print(
            showtimes.map((element) => element.movieName.toString()).toList());
        update();
        isLoading(false);

        ///  }

        update();

        return showtimes;
      } else {
        isLoading(false);

        // ignore: avoid_print
        print("failed");
        throw Exception("Failed");
      }
    } catch (e) {
      throw Exception("Failed");
    } finally {
      isLoading(false);
    }
  }
}
