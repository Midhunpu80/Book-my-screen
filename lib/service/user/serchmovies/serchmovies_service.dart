// ignore_for_file: avoid_print, deprecated_member_use, constant_pattern_never_matches_value_type, camel_case_types, unused_local_variable, non_constant_identifier_names, unnecessary_brace_in_string_interps, invalid_use_of_protected_member

import 'dart:convert';

import 'package:bookticket/model/user/serchmodel.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';

import 'package:get/get.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

////var cons = Get.put(ServiceViewMovies());

class get_serch_Movies extends GetxController {
  late Search10 result;

  /// Rx<TextEditingController> serch_contoll = TextEditingController().obs;

  //late Search10 reply;
  var dataList = RxList<Search10>().obs;
  // List<Search10> war = [];

  Rx<List<Map<String, dynamic>>> allserchresult =
      Rx<List<Map<String, dynamic>>>([]);

  getSerch_Movies({var query}) async {
    try {
      final response = await http
          .get(Uri.parse("${serchmovie_url}${query.toString()}"), headers: {
        'Content-Type': 'application/json;charset=utf-8',
        'Accept': 'application/json',
        'Accept-Encoding': 'gzip, deflate',
      });

      // ignore: unnecessary_null_comparison
      if (response.statusCode != null || response.statusCode == 200) {
        var data = jsonDecode(response.body);
        result = Search10.fromJson(data);

        update();
        return dataList.value;
      } else {
        //  Get.to(otpscreen());

        print("failed");
        throw Exception("Failed${response.body.toString()}");
      }
    } catch (e) {
      throw Exception("Failed$e");
    } finally {
      print("error");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSerch_Movies();

    // /// getSerch_Movies();
    // allserchresult =
    //     view_movie_controll.newdata.value as Rx<List<Map<String, dynamic>>>;
  }
}

// class serched_reach extends GetxController {
//   Rx<List<dynamic>> alldatas = Rx<List<dynamic>>([]);

//   @override
//   void onInit() {
//     super.onInit();
//     alldatas.value = view_movie_controll.newdata;
//   }

//   List<dynamic> result = [];

//   @override
//   void onClose() {
//     super.onClose();
//     function("");
//   }

//   function(String query) {
//     if (query.isEmpty) {
//       result = view_movie_controll.newdata ;
//     } else {
//       result = alldatas.value
//           .where((element) =>
//               element['title'].toString().toLowerCase().contains(query))
//           .toList();
//     }
//     result = view_movie_controll.newdata.value;

//   }
// }
