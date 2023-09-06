import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class mylocalstorage extends GetxController {
  // ignore: unnecessary_new
  final storeDb = new FlutterSecureStorage();
  write({required var key, required var value}) async {
    return await storeDb.write(key: key, value: value);
  }

  read_thecode({required var key}) async {
    return await storeDb.read(key: key);
  }
}
