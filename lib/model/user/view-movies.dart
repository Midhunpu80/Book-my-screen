// To parse this JSON data, do
//
//     final viewMovieModel = viewMovieModelFromJson(jsonString);

import 'dart:convert';

ViewMovieModel viewMovieModelFromJson(String str) => ViewMovieModel.fromJson(json.decode(str));

String viewMovieModelToJson(ViewMovieModel data) => json.encode(data.toJson());

class ViewMovieModel {
    bool success;
    String message;
    List<Datum> data;

    ViewMovieModel({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ViewMovieModel.fromJson(Map<String, dynamic> json) => ViewMovieModel(
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
    int movieId;

    Datum({
        required this.movieId,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        movieId: json["movieId"],
    );

    Map<String, dynamic> toJson() => {
        "movieId": movieId,
    };
}
