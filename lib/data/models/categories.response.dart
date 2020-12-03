// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

CategoriesResponse categoriesResponseFromJson(String str) => CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) => json.encode(data.toJson());

class CategoriesResponse {
  CategoriesResponse({
    this.data,
  });

  List<Datum> data;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => CategoriesResponse(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.image,
    this.created,
    this.categoria,
    this.datumClass,
    this.ownerId,
    this.updated,
    this.objectId,
  });

  String image;
  int created;
  String categoria;
  Class datumClass;
  dynamic ownerId;
  int updated;
  String objectId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    image: json["image"] == null ? null : json["image"],
    created: json["created"] == null ? null : json["created"],
    categoria: json["categoria"] == null ? null : json["categoria"],
    datumClass: json["___class"] == null ? null : classValues.map[json["___class"]],
    ownerId: json["ownerId"],
    updated: json["updated"] == null ? null : json["updated"],
    objectId: json["objectId"] == null ? null : json["objectId"],
  );

  Map<String, dynamic> toJson() => {
    "image": image == null ? null : image,
    "created": created == null ? null : created,
    "categoria": categoria == null ? null : categoria,
    "___class": datumClass == null ? null : classValues.reverse[datumClass],
    "ownerId": ownerId,
    "updated": updated == null ? null : updated,
    "objectId": objectId == null ? null : objectId,
  };
}

enum Class { CATEGORIAS }

final classValues = EnumValues({
  "categorias": Class.CATEGORIAS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}