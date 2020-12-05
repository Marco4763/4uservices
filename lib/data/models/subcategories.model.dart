// To parse this JSON data, do
//
//     final subcategoriesModel = subcategoriesModelFromJson(jsonString);

import 'dart:convert';

SubcategoriesModel subcategoriesModelFromJson(String str) => SubcategoriesModel.fromJson(json.decode(str));

String subcategoriesModelToJson(SubcategoriesModel data) => json.encode(data.toJson());

class SubcategoriesModel {
    SubcategoriesModel({
        this.data,
    });

    List<Datum> data;

    factory SubcategoriesModel.fromJson(Map<String, dynamic> json) => SubcategoriesModel(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.subcategorias,
        this.image,
        this.created,
        this.categoria,
        this.datumClass,
        this.ownerId,
        this.updated,
        this.objectId,
    });

    List<Subcategoria> subcategorias;
    String image;
    int created;
    String categoria;
    String datumClass;
    dynamic ownerId;
    int updated;
    String objectId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        subcategorias: json["subcategorias"] == null ? null : List<Subcategoria>.from(json["subcategorias"].map((x) => Subcategoria.fromJson(x))),
        image: json["image"] == null ? null : json["image"],
        created: json["created"] == null ? null : json["created"],
        categoria: json["categoria"] == null ? null : json["categoria"],
        datumClass: json["___class"] == null ? null : json["___class"],
        ownerId: json["ownerId"],
        updated: json["updated"] == null ? null : json["updated"],
        objectId: json["objectId"] == null ? null : json["objectId"],
    );

    Map<String, dynamic> toJson() => {
        "subcategorias": subcategorias == null ? null : List<dynamic>.from(subcategorias.map((x) => x.toJson())),
        "image": image == null ? null : image,
        "created": created == null ? null : created,
        "categoria": categoria == null ? null : categoria,
        "___class": datumClass == null ? null : datumClass,
        "ownerId": ownerId,
        "updated": updated == null ? null : updated,
        "objectId": objectId == null ? null : objectId,
    };
}

class Subcategoria {
    Subcategoria({
        this.subcategoriaClass,
        this.ownerId,
        this.updated,
        this.subcategoria,
        this.created,
        this.objectId,
    });

    String subcategoriaClass;
    dynamic ownerId;
    int updated;
    String subcategoria;
    int created;
    String objectId;

    factory Subcategoria.fromJson(Map<String, dynamic> json) => Subcategoria(
        subcategoriaClass: json["___class"] == null ? null : json["___class"],
        ownerId: json["ownerId"],
        updated: json["updated"] == null ? null : json["updated"],
        subcategoria: json["subcategoria"] == null ? null : json["subcategoria"],
        created: json["created"] == null ? null : json["created"],
        objectId: json["objectId"] == null ? null : json["objectId"],
    );

    Map<String, dynamic> toJson() => {
        "___class": subcategoriaClass == null ? null : subcategoriaClass,
        "ownerId": ownerId,
        "updated": updated == null ? null : updated,
        "subcategoria": subcategoria == null ? null : subcategoria,
        "created": created == null ? null : created,
        "objectId": objectId == null ? null : objectId,
    };
}