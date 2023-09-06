// ignore_for_file: invalid_use_of_protected_member

import 'package:bookticket/constant/storage.dart';
import 'package:bookticket/main.dart';
import 'package:bookticket/view/screens/userorders/widgets/listofdata.dart';
import 'package:get/get.dart';

class userorder_controller extends GetxController {
  RxList<bool> cancelllist = List.generate(
    getalluser_order.reply.data.activeOrders.length,
    (index) => false,
  ).obs;

  change(var index) async {
    var dataa = cancelllist[index] = !cancelllist[index];
    await storeage.write(
      key: colorstore,
      value: dataa.toString(),
    );
    update();
  }
}
