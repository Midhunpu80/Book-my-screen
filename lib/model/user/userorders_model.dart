// To parse this JSON data, do
//
//     final userorders10 = userorders10FromJson(jsonString);

import 'dart:convert';

Userorders10 userorders10FromJson(String str) =>
    Userorders10.fromJson(json.decode(str));

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
        activeOrders: List<ActiveOrder>.from(
            json["activeOrders"].map((x) => ActiveOrder.fromJson(x))),
        expireOrders: List<ExpireOrder>.from(
            json["expireOrders"].map((x) => ExpireOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "activeOrders": List<dynamic>.from(activeOrders.map((x) => x.toJson())),
        "expireOrders": List<dynamic>.from(expireOrders.map((x) => x.toJson())),
      };
}

class ActiveOrder {
  String id;
  UserId userId;
  OwnerId ownerId;
  UserName userName;
  MovieName movieName;
  OwnerName ownerName;
  Location location;
  Location showTime;
  DateTime date;
  List<ActiveOrderSelectedSeat> selectedSeats;
  String bookingId;
  int subtotal;
  double fee;
  double total;
  int screen;
  Status status;
  Language language;
  String image;
  Paymentstatus paymentstatus;
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
        userId: userIdValues.map[json["userId"]]!,
        ownerId: ownerIdValues.map[json["ownerId"]]!,
        userName: userNameValues.map[json["userName"]]!,
        movieName: movieNameValues.map[json["movieName"]]!,
        ownerName: ownerNameValues.map[json["ownerName"]]!,
        location: locationValues.map[json["location"]]!,
        showTime: locationValues.map[json["showTime"]]!,
        date: DateTime.parse(json["date"]),
        selectedSeats: List<ActiveOrderSelectedSeat>.from(json["selectedSeats"]
            .map((x) => ActiveOrderSelectedSeat.fromJson(x))),
        bookingId: json["bookingId"],
        subtotal: json["subtotal"],
        fee: json["fee"]?.toDouble(),
        total: json["total"]?.toDouble(),
        screen: json["screen"],
        status: statusValues.map[json["status"]]!,
        language: languageValues.map[json["language"]]!,
        image: json["image"],
        paymentstatus: paymentstatusValues.map[json["paymentstatus"]]!,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userIdValues.reverse[userId],
        "ownerId": ownerIdValues.reverse[ownerId],
        "userName": userNameValues.reverse[userName],
        "movieName": movieNameValues.reverse[movieName],
        "ownerName": ownerNameValues.reverse[ownerName],
        "location": locationValues.reverse[location],
        "showTime": locationValues.reverse[showTime],
        "date": date.toIso8601String(),
        "selectedSeats":
            List<dynamic>.from(selectedSeats.map((x) => x.toJson())),
        "bookingId": bookingId,
        "subtotal": subtotal,
        "fee": fee,
        "total": total,
        "screen": screen,
        "status": statusValues.reverse[status],
        "language": languageValues.reverse[language],
        "image": image,
        "paymentstatus": paymentstatusValues.reverse[paymentstatus],
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

enum Language { ENGLISH, FI }

final languageValues =
    EnumValues({"English": Language.ENGLISH, "fi": Language.FI});

enum Location { BANGLORE, THE_0800_AM }

final locationValues = EnumValues(
    {"Banglore": Location.BANGLORE, "08:00am": Location.THE_0800_AM});

enum MovieName { GODHA, SISU }

final movieNameValues =
    EnumValues({"Godha": MovieName.GODHA, "Sisu": MovieName.SISU});

enum OwnerId { THE_6465_ED40_BE6_FC018_B42248_D6 }

final ownerIdValues = EnumValues(
    {"6465ed40be6fc018b42248d6": OwnerId.THE_6465_ED40_BE6_FC018_B42248_D6});

enum OwnerName { GOKUL }

final ownerNameValues = EnumValues({"Gokul": OwnerName.GOKUL});

enum Paymentstatus { ACTIVE }

final paymentstatusValues = EnumValues({"Active": Paymentstatus.ACTIVE});

class ActiveOrderSelectedSeat {
  String id;
  String? seatStatus;

  ActiveOrderSelectedSeat({
    required this.id,
    this.seatStatus,
  });

  factory ActiveOrderSelectedSeat.fromJson(Map<String, dynamic> json) =>
      ActiveOrderSelectedSeat(
        id: json["id"],
        seatStatus: json["seatStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seatStatus": seatStatus,
      };
}

enum Status { BOOKED }

final statusValues = EnumValues({"Booked": Status.BOOKED});

enum UserId { THE_64_A2_F1_D93126327_C318_FA6_B0 }

final userIdValues = EnumValues(
    {"64a2f1d93126327c318fa6b0": UserId.THE_64_A2_F1_D93126327_C318_FA6_B0});

enum UserName { MIDHUN }

final userNameValues = EnumValues({"midhun": UserName.MIDHUN});

class ExpireOrder {
  String id;
  UserId userId;
  OwnerId ownerId;
  String userName;
  MovieName movieName;
  OwnerName ownerName;
  Location location;
  String showTime;
  DateTime date;
  List<ExpireOrderSelectedSeat> selectedSeats;
  String bookingId;
  int subtotal;
  double fee;
  int total;
  int screen;
  Status status;
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
        userId: userIdValues.map[json["userId"]]!,
        ownerId: ownerIdValues.map[json["ownerId"]]!,
        userName: json["userName"],
        movieName: movieNameValues.map[json["movieName"]]!,
        ownerName: ownerNameValues.map[json["ownerName"]]!,
        location: locationValues.map[json["location"]]!,
        showTime: json["showTime"],
        date: DateTime.parse(json["date"]),
        selectedSeats: List<ExpireOrderSelectedSeat>.from(json["selectedSeats"]
            .map((x) => ExpireOrderSelectedSeat.fromJson(x))),
        bookingId: json["bookingId"],
        subtotal: json["subtotal"],
        fee: json["fee"]?.toDouble(),
        total: json["total"],
        screen: json["screen"],
        status: statusValues.map[json["status"]]!,
        language: json["language"],
        image: json["image"],
        paymentstatus: json["paymentstatus"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userIdValues.reverse[userId],
        "ownerId": ownerIdValues.reverse[ownerId],
        "userName": userName,
        "movieName": movieNameValues.reverse[movieName],
        "ownerName": ownerNameValues.reverse[ownerName],
        "location": locationValues.reverse[location],
        "showTime": showTime,
        "date": date.toIso8601String(),
        "selectedSeats":
            List<dynamic>.from(selectedSeats.map((x) => x.toJson())),
        "bookingId": bookingId,
        "subtotal": subtotal,
        "fee": fee,
        "total": total,
        "screen": screen,
        "status": statusValues.reverse[status],
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

  ExpireOrderSelectedSeat({
    required this.id,
  });

  factory ExpireOrderSelectedSeat.fromJson(Map<String, dynamic> json) =>
      ExpireOrderSelectedSeat(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
