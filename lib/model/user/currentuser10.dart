// To parse this JSON data, do
//
//     final currentuser10 = currentuser10FromJson(jsonString);

import 'dart:convert';

Currentuser10 currentuser10FromJson(String str) => Currentuser10.fromJson(json.decode(str));

String currentuser10ToJson(Currentuser10 data) => json.encode(data.toJson());

class Currentuser10 {
    bool success;
    String message;
    Data data;

    Currentuser10({
        required this.success,
        required this.message,
        required this.data,
    });

    factory Currentuser10.fromJson(Map<String, dynamic> json) => Currentuser10(
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
    String id;
    String signName;
    int signPhone;
    String signEmail;
    bool block;
    int wallet;
    List<dynamic> transaction;
    int v;

    Data({
        required this.id,
        required this.signName,
        required this.signPhone,
        required this.signEmail,
        required this.block,
        required this.wallet,
        required this.transaction,
        required this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        signName: json["signName"],
        signPhone: json["signPhone"],
        signEmail: json["signEmail"],
        block: json["block"],
        wallet: json["wallet"],
        transaction: List<dynamic>.from(json["transaction"].map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "signName": signName,
        "signPhone": signPhone,
        "signEmail": signEmail,
        "block": block,
        "wallet": wallet,
        "transaction": List<dynamic>.from(transaction.map((x) => x)),
        "__v": v,
    };
}
