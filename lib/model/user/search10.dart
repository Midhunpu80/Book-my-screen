// // To parse this JSON data, do
// //
// //     final serch10 = serch10FromJson(jsonString);

// import 'dart:convert';

// Serch10 serch10FromJson(String str) => Serch10.fromJson(json.decode(str));

// String serch10ToJson(Serch10 data) => json.encode(data.toJson());

// class Serch10 {
//     bool success;
//     String message;
//     List<Datum> data;

//     Serch10({
//         required this.success,
//         required this.message,
//         required this.data,
//     });

//     factory Serch10.fromJson(Map<String, dynamic> json) => Serch10(
//         success: json["success"],
//         message: json["message"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     String id;
//     int movieId;
//     String title;
//     String language;
//     DateTime releaseDate;
//     String image;
//     DateTime createdAt;
//     DateTime updatedAt;
//     int v;

//     Datum({
//         required this.id,
//         required this.movieId,
//         required this.title,
//         required this.language,
//         required this.releaseDate,
//         required this.image,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.v,
//     });

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["_id"],
//         movieId: json["movieId"],
//         title: json["title"],
//         language: json["language"],
//         releaseDate: DateTime.parse(json["releaseDate"]),
//         image: json["image"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "movieId": movieId,
//         "title": title,
//         "language": language,
//         "releaseDate": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
//         "image": image,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//     };
// }
