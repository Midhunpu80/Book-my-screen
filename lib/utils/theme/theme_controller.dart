import 'package:get/get.dart';

class theme_controller extends GetxController {
  RxBool isload = true.obs;

  void change({var data}) {
    isload.value = data;
  }
}
