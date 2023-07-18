import 'dart:convert';

Cast10 cast10FromJson(String str) => Cast10.fromJson(json.decode(str));

String cast10ToJson(Cast10 data) => json.encode(data.toJson());

class Cast10 {
    List<Cast> cast;

    Cast10({
        required this.cast,
    });

    factory Cast10.fromJson(Map<String, dynamic> json) => Cast10(
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
    };
}

class Cast {
    int id;
    String name;
    String character;
    String profilePath;

    Cast({
        required this.id,
        required this.name,
        required this.character,
        required this.profilePath,
    });

    factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        id: json["id"],
        name: json["name"],
        character: json["character"],
        profilePath: json["profile_path"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "character": character,
        "profile_path": profilePath,
    };
}
