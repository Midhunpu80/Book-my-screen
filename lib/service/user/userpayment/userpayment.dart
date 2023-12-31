// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bookticket/constant/storage.dart';
import 'package:bookticket/main.dart';
import 'package:bookticket/service/user/currentuser/currentuserservice.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class user_payment_service extends GetxController {
  var isLoading = false.obs;

  getuserpayment(
      {required var fees,
      required var subtotal,
      required dynamic total,
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
            var datatoken = await securedata.read(key: usertoken);

    ///var mutli = fees + subtotal;

    final Map<String, dynamic> bdy = {
      "fee": fees.toString(),
      "subtotal": subtotal.toString(),
      "total": total.toString(),
      "image": image.toString(),
      "user": {
        "user": {"_id": id.toString(), "signName": username.toString()}
      },
      "language": language.toString(),
      "details": {
        "selectedSeats": seats.map((e) => {"id": e.toString()}).toList(),
        "date": date.toString(),
        "showDetails": {
          "status": "Booked",
          "ownerId": ownerid.toString(),
          "ownerName": ownername.toString(),
          "movieName": moviename.toString(),
          "location": location.toString(),
          "showTime": showtime.toString(),
          "screen": screen.toString()
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
            'Authorization': 'Bearer $datatoken'
          },
          body: jsonEncode(bdy));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        single_ticket.getsingleorder(
            id: data["data"]["bookings"]["_id"].toString());
        await getalluser_order.getuser_orders(
            userid: data["data"]["bookings"]["userId"].toString());

        print(
            "---------all of them sucess------------------can you know abou this--------------------------------------${data["data"]["bookings"]["_id"].toString()}");

        print(data.toString());
        isLoading(false);
        update();
      } else {
        isLoading(false);
        throw ("is failed${response.statusCode}");
      }
    } catch (e) {
      isLoading(false);
      // ignore: unnecessary_brace_in_string_interps
      throw ("${e}");
    } finally {
      isLoading(false);
    }
    update();
  }
}
