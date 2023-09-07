// ignore_for_file: unnecessary_null_comparison

import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final fanda = Get.put(ServiceViewMovies());

// ignore: camel_case_types
class search_controll12 extends GetxController {
  final contr = TextEditingController();

  RxList<Map<String, dynamic>> cant = RxList<Map<String, dynamic>>([]);

  RxList<Map<String, dynamic>> fonts = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fonts.value = fanda.allmoviesdetailsdata;
    // newfetch();
  }

  @override
  void onClose() {
    newfetch();
    super.onClose();
  }

  newfetch({var val}) {
    cant.assignAll(fanda.allmoviesdetailsdata);
    // cant.value = fanda.allmoviesdetailsdata;
    if (val.isEmpty || val == null) {
      // cant.clear();

      cant.assignAll(fanda.allmoviesdetailsdata.toList().toSet());

      update();
    } else {
      cant.assignAll(fanda.allmoviesdetailsdata
          .where((e) => e["title"]
              .toString()
              .toLowerCase()
              .contains(val.toString().toLowerCase()))
          .toList()
          .toSet());
      update();
    }
    fonts.value = cant;

    update();
  }
}
