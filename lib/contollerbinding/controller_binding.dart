import 'package:bookticket/service/user/currentuser/currentuserservice.dart';
import 'package:bookticket/service/user/getdates/getdates.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class controlllerbinding extends Bindings {
  @override
  void dependencies() {
    Get.put<getdates_service>(getdates_service());
    Get.put<get_currentuser_service>(get_currentuser_service());

    // TODO: implement dependencies
  }
}
