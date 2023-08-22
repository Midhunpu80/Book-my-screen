import 'package:get/get.dart';

class theatercontroller extends GetxController {
  dynamic alldates = "".obs;

  final cr = 0.obs;

  change({
    var index,
  }) {
    cr.value = index;
    update();
  }
}
