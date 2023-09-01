// ignore_for_file: unnecessary_null_comparison

import 'package:bookticket/service/user/allmovies/viewhomeMovies.dart';
import 'package:get/get.dart';

final fanda = Get.put(ServiceViewMovies());

class search_controll12 extends GetxController {
  ///  List<dynamic> result = [];
  ///List<dynamic> cant = ([]);
  // RxList<dynamic> result = <dynamic>[].obs;
  // RxList<dynamic> poster = <dynamic>[].obs;
  // RxList<dynamic> gene = <dynamic>[].obs;
  // RxList<dynamic> overview = <dynamic>[].obs;
  // RxList<dynamic> result4 = <dynamic>[].obs;
  // RxList<dynamic> result5 = <dynamic>[].obs;
  // RxList<dynamic> result6 = <dynamic>[].obs;

  RxList<Map<String, dynamic>> cant = RxList<Map<String, dynamic>>([]);
  // RxList<Map<String, dynamic>> alldata = <Map<String, dynamic>>[].obs;
  // Rx<List<Map<String, dynamic>>> found = Rx<List<Map<String, dynamic>>>([]);
  /// RxList<Map<String, dynamic>> founds = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> fonts = <Map<String, dynamic>>[].obs;
  // RxList<Map<String, dynamic>> allresults = RxList<Map<String, dynamic>>([]);

  @override
  void onInit() {
    super.onInit();
    fonts.value = fanda.allmoviesdetailsdata;
  }

  newfetch(String val) {
    cant.value = fanda.allmoviesdetailsdata;
    // cant.value = fanda.allmoviesdetailsdata;
    if (val.isEmpty || val == null) {
      cant.assignAll(fanda.allmoviesdetailsdata.toList());

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

  @override
  void onClose() {
    // newfetch("");
    super.onClose();
  }
}
