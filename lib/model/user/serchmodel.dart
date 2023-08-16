// To parse this JSON data, do
//
//     final search10 = search10FromJson(jsonString);

import 'dart:convert';

Search10 search10FromJson(String str) => Search10.fromJson(json.decode(str));

String search10ToJson(Search10 data) => json.encode(data.toJson());

class Search10 {
    bool success;
    String message;
    List<Datum> data;

    Search10({
        required this.success,
        required this.message,
        required this.data,
    });

    factory Search10.fromJson(Map<String, dynamic> json) => Search10(
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
    int movieId;
    String title;
    String language;
    DateTime releaseDate;
    String image;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Datum({
        required this.id,
        required this.movieId,
        required this.title,
        required this.language,
        required this.releaseDate,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        movieId: json["movieId"],
        title: json["title"],
        language: json["language"],
        releaseDate: DateTime.parse(json["releaseDate"]),
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "movieId": movieId,
        "title": title,
        "language": language,
        "releaseDate": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
