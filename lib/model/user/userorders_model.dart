// To parse this JSON data, do
//
//     final userorders10 = userorders10FromJson(jsonString);

import 'dart:convert';

Userorders10 userorders10FromJson(String str) => Userorders10.fromJson(json.decode(str));

String userorders10ToJson(Userorders10 data) => json.encode(data.toJson());

class Userorders10 {
    bool success;
    String message;
    Data data;

    Userorders10({
        required this.success,
        required this.message,
        required this.data,
    });

    factory Userorders10.fromJson(Map<String, dynamic> json) => Userorders10(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    List<ActiveOrder> activeOrders;
    List<ExpireOrder> expireOrders;

    Data({
        required this.activeOrders,
        required this.expireOrders,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        activeOrders: List<ActiveOrder>.from(json["activeOrders"].map((x) => ActiveOrder.fromJson(x))),
        expireOrders: List<ExpireOrder>.from(json["expireOrders"].map((x) => ExpireOrder.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "activeOrders": List<dynamic>.from(activeOrders.map((x) => x.toJson())),
        "expireOrders": List<dynamic>.from(expireOrders.map((x) => x.toJson())),
    };
}

class ActiveOrder {
    String id;
    String userId;
    String ownerId;
    String userName;
    String movieName;
    String ownerName;
    String location;
    String showTime;
    DateTime date;
    List<ActiveOrderSelectedSeat> selectedSeats;
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

    ActiveOrder({
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

    factory ActiveOrder.fromJson(Map<String, dynamic> json) => ActiveOrder(
        id: json["_id"],
        userId: json["userId"],
        ownerId: json["ownerId"],
        userName: json["userName"],
        movieName: json["movieName"],
        ownerName: json["ownerName"],
        location: json["location"],
        showTime: json["showTime"],
        date: DateTime.parse(json["date"]),
        selectedSeats: List<ActiveOrderSelectedSeat>.from(json["selectedSeats"].map((x) => ActiveOrderSelectedSeat.fromJson(x))),
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

class ActiveOrderSelectedSeat {
    String id;

    ActiveOrderSelectedSeat({
        required this.id,
    });

    factory ActiveOrderSelectedSeat.fromJson(Map<String, dynamic> json) => ActiveOrderSelectedSeat(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}

class ExpireOrder {
    String id;
    String userId;
    String ownerId;
    String userName;
    String movieName;
    String ownerName;
    String location;
    String showTime;
    DateTime date;
    List<ExpireOrderSelectedSeat> selectedSeats;
    String bookingId;
    int subtotal;
    double fee;
    double total;
    int screen;
    String status;
    String language;
    String image;
    String paymentstatus;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    ExpireOrder({
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

    factory ExpireOrder.fromJson(Map<String, dynamic> json) => ExpireOrder(
        id: json["_id"],
        userId: json["userId"],
        ownerId: json["ownerId"],
        userName: json["userName"],
        movieName: json["movieName"],
        ownerName: json["ownerName"],
        location: json["location"],
        showTime: json["showTime"],
        date: DateTime.parse(json["date"]),
        selectedSeats: List<ExpireOrderSelectedSeat>.from(json["selectedSeats"].map((x) => ExpireOrderSelectedSeat.fromJson(x))),
        bookingId: json["bookingId"],
        subtotal: json["subtotal"],
        fee: json["fee"]?.toDouble(),
        total: json["total"]?.toDouble(),
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

class ExpireOrderSelectedSeat {
    String id;
    String? seatStatus;

    ExpireOrderSelectedSeat({
        required this.id,
        this.seatStatus,
    });

    factory ExpireOrderSelectedSeat.fromJson(Map<String, dynamic> json) => ExpireOrderSelectedSeat(
        id: json["id"],
        seatStatus: json["seatStatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "seatStatus": seatStatus,
    };
}
