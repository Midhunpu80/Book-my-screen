// ignore_for_file: avoid_print, deprecated_member_use, constant_pattern_never_matches_value_type, camel_case_types, unused_local_variable, non_constant_identifier_names, unnecessary_brace_in_string_interps, invalid_use_of_protected_member

import 'dart:convert';

import 'package:bookticket/main.dart';
import 'package:bookticket/model/user/theater_seats_model.dart';
import 'package:bookticket/service/user/currentuser/currentuserservice.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';
import 'package:get/get.dart';

// ignore: unused_import
import 'package:http/http.dart' as http;

class theater_seats_service {
  Future get_theater_seats({required var date, required var showid}) async {
    final bdy = {"showId": showid.toString(), "date": date.toString()};

    final response = await http.post(Uri.parse(seats_url),
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip, deflate',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(bdy));
    if (response.statusCode == 200) {
      var resp = response.body;
      return allseats10FromJson(resp);
    }
  }
}

class theater_seats_fetch extends GetxController {
  var isLoading = true.obs;
  RxList<Allseats10> allseats = <Allseats10>[].obs;
  theater_seats_service s = theater_seats_service();

  Future<void> fetch({var date, var showid}) async {
    try {
      isLoading.value = true;

      var data = await s.get_theater_seats(date: date, showid: showid);
      if (data != null) {
        allseats.value.assignAll([data]);
        print(
            "---------//85555----------------------${allseats.map((element) => element.data.showData.movieName.toString()).toList().toString()}.toList().toString()}-------------------------");
        update();
      }
    } finally {
      isLoading.value = false;
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetch();
  }
}

class theater_seats_service10 extends GetxController {
  late Allseats10 allseat;

  var isLoading = false.obs;
  var allsata;

  Future get_theater_seats({required var date, required var showid}) async {
    final bdy = {"showId": showid.toString(), "date": date.toString()};

    try {
      isLoading(true);
      final response = await http.post(Uri.parse(seats_url),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Accept-Encoding': 'gzip, deflate',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(bdy));
      if (response.statusCode == 200) {
        var resp = jsonDecode(response.body);
        allsata = resp;
        allseat = Allseats10.fromJson(resp);
        print(allseat.data.showData.movieName.toString());

        isLoading(false);
        update();
      } else {
        throw ("failed");
      }
    } catch (e) {
      isLoading(false);
      throw ("failed$e");
    }
  }
}

class button_seat_selection extends GetxController {
  RxList<bool> buttonSelections =
      List.generate(seat_controll.allseat.data.screen.totalSeats, (_) => false)
          .obs;

  void toggleButtonSelection(var index) {
    buttonSelections[index] = !buttonSelections[index];
  }

  RxList<dynamic> countickets = <dynamic>[].obs;
  RxDouble counter = 0.0.obs;
  RxDouble price = 0.0.obs;
  RxDouble totals = 0.0.obs;

  void click_count(var count) {
    if (countickets.value.toSet().contains(count)) {
      countickets.value.remove(count);
      print("counts_tickets_removed  =${countickets.value.length}");
      counter.value = countickets.value.length.toDouble();
      price.value = seat_controll.allseat.data.showData.price.toDouble() *
          -countickets.value.length;
      update();
    } else {
      countickets.value.add(count);
      counter.value = countickets.value.length.toDouble();
      price.value = seat_controll.allseat.data.showData.price *
          countickets.value.length.toDouble();

      print("//*******${price.toString()}*********");

      //   print("counts_tickets  =${countickets.value.length}");
      print("counting  added ${countickets.value.toList().toString()}");
      update();
    }
    update();
  }
}
