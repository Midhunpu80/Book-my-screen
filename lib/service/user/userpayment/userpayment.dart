import 'dart:convert';

import 'package:bookticket/service/user/currentuser/currentuserservice.dart';
import 'package:bookticket/view/screens/selectSeats/selectseats.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class user_payment_service extends GetxController {
  var isLoading = false.obs;

  getuserpayment(
      {required var fees,
      required var subtotal,
      required var total,
      required var image,
      required var id,
      required var language,
      required var date,
      required var username,
      required var showtime,
      required var location,
      required var screen,
      required var ownerid,
      required var ownername,
      required var moviename,
      required List<dynamic> seats}) async {
    final bdy = {
      {
        "fee": fees.toString(),
        "subtotal": subtotal.toString(),
        "total": total.toString(),
        "image": image,
        "user": {
          "user": {"_id": id.toString(), "signName": username.toString()}
        },
        "language": language.toString(),
        "details": {
          "selectedSeats": [
            {"id": seats}
          ],
          "date": date.toString(),
          "showDetails": {
            "status": "Booked",
            "ownerId": "6465ed40be6fc018b42248d6",
            "ownerName": ownername.toString(),
            "movieName": moviename.toString(),
            "location": location.toString(),
            "showTime": showtime.toString(),
            "screen": screen.toString()
          }
        }
      }
    };

    try {
      isLoading(true);

      final response = await http.post(
          Uri.parse("https://bookmyscreen.onrender.com/get-payment"),
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            'Accept': 'application/json',
            'Accept-Encoding': 'gzip, deflate',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(bdy));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data.toString());
        isLoading(false);
        update();
      } else {
        isLoading(false);
        throw ("is failed");
      }
    } catch (e) {
      isLoading(false);
      throw ("some errors correct this code -$e");
    }
    update();
  }
}
