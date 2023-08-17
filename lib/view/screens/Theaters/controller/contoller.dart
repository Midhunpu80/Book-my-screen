import 'package:get/get.dart';

class theatercontroller extends GetxController {
  final cr = 0.obs;

  change({
    var index,
  }) {
    cr.value = index;
    update();
  }
}
