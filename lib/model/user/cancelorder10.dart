// To parse this JSON data, do
//
//     final cancelorder10 = cancelorder10FromJson(jsonString);

import 'dart:convert';

Cancelorder10 cancelorder10FromJson(String str) => Cancelorder10.fromJson(json.decode(str));

String cancelorder10ToJson(Cancelorder10 data) => json.encode(data.toJson());

class Cancelorder10 {
    bool success;
    String message;
    List<Datum> data;

    Cancelorder10({
        required this.success,
        required this.message,
        required this.data,
    });

    factory Cancelorder10.fromJson(Map<String, dynamic> json) => Cancelorder10(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String userId;
    String ownerId;
    String userName;
    String movieName;
    String ownerName;
    String location;
    String showTime;
    DateTime date;
    List<SelectedSeat> selectedSeats;
    String bookingId;
    int subtotal;
    int fee;
    int total;
    int screen;
    String status;
    String language;
    String image;
    String paymentstatus;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Datum({
        required this.id,
        required this.userId,
        required this.ownerId,
        required this.userName,
        required this.movieName,
        required this.ownerName,
        required this.location,
        required this.showTime,
        required this.date,
        required this.selectedSeats,
        required this.bookingId,
        required this.subtotal,
        required this.fee,
        required this.total,
        required this.screen,
        required this.status,
        required this.language,
        required this.image,
        required this.paymentstatus,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userId: json["userId"],
        ownerId: json["ownerId"],
        userName: json["userName"],
        movieName: json["movieName"],
        ownerName: json["ownerName"],
        location: json["location"],
        showTime: json["showTime"],
        date: DateTime.parse(json["date"]),
        selectedSeats: List<SelectedSeat>.from(json["selectedSeats"].map((x) => SelectedSeat.fromJson(x))),
        bookingId: json["bookingId"],
        subtotal: json["subtotal"],
        fee: json["fee"],
        total: json["total"],
        screen: json["screen"],
        status: json["status"],
        language: json["language"],
        image: json["image"],
        paymentstatus: json["paymentstatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "ownerId": ownerId,
        "userName": userName,
        "movieName": movieName,
        "ownerName": ownerName,
        "location": location,
        "showTime": showTime,
        "date": date.toIso8601String(),
        "selectedSeats": List<dynamic>.from(selectedSeats.map((x) => x.toJson())),
        "bookingId": bookingId,
        "subtotal": subtotal,
        "fee": fee,
        "total": total,
        "screen": screen,
        "status": status,
        "language": language,
        "image": image,
        "paymentstatus": paymentstatus,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class SelectedSeat {
    String id;

    SelectedSeat({
        required this.id,
    });

    factory SelectedSeat.fromJson(Map<String, dynamic> json) => SelectedSeat(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}
