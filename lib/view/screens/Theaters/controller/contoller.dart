import 'package:get/get.dart';

class theatercontroller extends GetxController {
  dynamic alldates = "".obs;

  final cr = 0.obs;

  RxString datesall = "".obs;
  adddate({required var adddate}) {
    adddate = datesall.value;
    update();
  }

  change({
    var index,
  }) {
    cr.value = index;
    update();
  }
}
