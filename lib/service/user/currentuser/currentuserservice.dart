// ignore_for_file: avoid_print, deprecated_member_use, constant_pattern_never_matches_value_type, camel_case_types, unused_local_variable

import 'dart:convert';

import 'package:bookticket/model/user/currentuser10.dart';
import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:bookticket/service/user/endpoints/endpoints.dart';
import 'package:bookticket/utils/colors/colors.dart';
import 'package:bookticket/view/screens/LoginandSignup/otp/otp.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

var token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NGEyZjFkOTMxMjYzMjdjMzE4ZmE2YjAiLCJuYW1lIjoibWlkaHVuIHB1ICIsInR5cGUiOiJ1c2VyIiwiaWF0IjoxNjkxNjY5NTczLCJleHAiOjE2OTY4NTM1NzN9.T6H9hAnLBYlkaFcOomTNfYZTy7QkdpgdBQvpl5xZSZE";

var cons = Get.put(ServiceViewMovies());

class get_currentuser_service extends GetxController {
  /// late Currentuser10 reply;
  var isLoading = false.obs;
  // RxList<Datas> current_user = <Datas>[].obs;
  // Rx<String> name = "".obs;
  var count = 0.obs;
  void coun() {
    count++;

    /// update();
  }

  @override
  void onInit() {
    super.onInit();

    ///  getcurrent_user();
    //updateui();
  }

  // ignore: non_constant_identifier_names
  // getcurrent_user() async {
  //   try {
  //     isLoading(true);
  //     final response = await http.get(Uri.parse(user_url), headers: {
  //       'Content-Type': 'application/json;charset=utf-8',
  //       'Accept': 'application/json',
  //       'Accept-Encoding': 'gzip, deflate',
  //       'Authorization': 'Bearer $token'
  //     });
  //     current_user.clear();

  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body) as Map<String, dynamic>;
  //       updateui(data);

  //       final userdata = Currentuser10.fromJson(data);

  //       print(data.toString());
  //       //  print(reply.data.signEmail.toString());
  //       current_user.assign(userdata.data);
  //       print(current_user
  //           .map((element) => element.signEmail.toString())
  //           .toList());
  //       current_user.refresh();

  //       isLoading(false);

  //       update();
  //       return current_user;
  //     } else {
  //       isLoading(false);
  //       Get.to(otpscreen());

  //       print("failed");
  //       throw Exception("Failed");
  //     }
  //   } catch (e) {
  //     throw Exception("Failed");
  //   }
  // }

  // void updateui([var data]) {
  //   name.value = data["data"]["signName"];
  //   print("---------${name.value.toString()}");
  //   update();
  // }

  // ignore: non_constant_identifier_names
  var name = "".obs;
  var emails = "".obs;
  var phones = "".obs;

  getupdate_user(
      {required var userid,
      required var email,
      required var newname,
      required var editphone}) async {
    final bdy = {
      "user": {"_id": userid.toString()},
      "editEmail": email.toString(),
      "editName": newname.toString(),
      "editPhone": editphone.toString()
    };

    try {
      final response = await http.post(
        Uri.parse(edit_url),
        body: jsonEncode(bdy),
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          'Accept': 'application/json',
          'Accept-Encoding': 'gzip, deflate',
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        name.value = data["data"]["signName"];
        emails.value = data["data"]["signEmail"];
        phones.value = data["data"]["signPhone"];

        print(data.toString());
        print(name.value.toString());
        Get.snackbar(
            "SUCESS${data['success']}", "succesfully updated user data",
            backgroundColor: gr);

        ///  Get.to(Home());

        update();
        return data;
      } else {
        Get.snackbar("failed", "then continuesly failed the dataposting");

        throw ("is failde to update the data${response.statusCode.toString()} ");
      }
    } catch (e) {
      // ignore: unnecessary_brace_in_string_interps
      throw ("allways failed the data fetching ${e}");
    }
  }
}

Future getcurrentuser() async {
  final response = await http.get(Uri.parse(user_url), headers: {
    'Content-Type': 'application/json;charset=utf-8',
    'Accept': 'application/json',
    'Accept-Encoding': 'gzip, deflate',
    'Authorization': 'Bearer $token'
  });
  if (response.statusCode == 200) {
    var dataz = response.body;
    return currentuser10FromJson(dataz);
  }
}

class fetchapi extends GetxController {
  RxList<Currentuser10> ofuser = <Currentuser10>[].obs;
  var isLoading = true.obs;
  Future<void> fetch() async {
    try {
      isLoading.value = true;
      var love = await getcurrentuser();
      if (love != null) {
        ofuser.assignAll([love]);
        print(
            ofuser.map((element) => element.data.signName.toString()).toList());
        update();
      }
    } finally {
      isLoading.value = false;
    }
    update();
  }

  @override
  void onInit() {
    fetch();
    // TODO: implement onInit
    super.onInit();
  }
}
