// To parse this JSON data, do
//
//     final theaterShowtime10 = theaterShowtime10FromJson(jsonString);

import 'dart:convert';

TheaterShowtime10 theaterShowtime10FromJson(String str) => TheaterShowtime10.fromJson(json.decode(str));

String theaterShowtime10ToJson(TheaterShowtime10 data) => json.encode(data.toJson());

class TheaterShowtime10 {
    bool success;
    String message;
    List<Datum> data;

    TheaterShowtime10({
        required this.success,
        required this.message,
        required this.data,
    });

    factory TheaterShowtime10.fromJson(Map<String, dynamic> json) => TheaterShowtime10(
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
    String screenId;
    String ownerId;
    String ownerName;
    String location;
    String movieName;
    String showTime;
    DateTime startDate;
    DateTime endDate;
    int price;
    int screen;
    List<Date> dates;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Datum({
        required this.id,
        required this.screenId,
        required this.ownerId,
        required this.ownerName,
        required this.location,
        required this.movieName,
        required this.showTime,
        required this.startDate,
        required this.endDate,
        required this.price,
        required this.screen,
        required this.dates,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        screenId: json["screenId"],
        ownerId: json["ownerId"],
        ownerName: json["ownerName"],
        location: json["location"],
        movieName: json["movieName"],
        showTime: json["showTime"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        price: json["price"],
        screen: json["screen"],
        dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "screenId": screenId,
        "ownerId": ownerId,
        "ownerName": ownerName,
        "location": location,
        "movieName": movieName,
        "showTime": showTime,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "price": price,
        "screen": screen,
        "dates": List<dynamic>.from(dates.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Date {
    DateTime date;
    List<Seat> seats;

    Date({
        required this.date,
        required this.seats,
    });

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: DateTime.parse(json["date"]),
        seats: List<Seat>.from(json["seats"].map((x) => Seat.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "seats": List<dynamic>.from(seats.map((x) => x.toJson())),
    };
}

class Seat {
    String id;
    SeatStatus seatStatus;

    Seat({
        required this.id,
        required this.seatStatus,
    });

    factory Seat.fromJson(Map<String, dynamic> json) => Seat(
        id: json["id"],
        seatStatus: seatStatusValues.map[json["seatStatus"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "seatStatus": seatStatusValues.reverse[seatStatus],
    };
}

enum SeatStatus {
    AVAILABLE
}

final seatStatusValues = EnumValues({
    "available": SeatStatus.AVAILABLE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
