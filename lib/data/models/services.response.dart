// To parse this JSON data, do
//
//     final servicesResponse = servicesResponseFromJson(jsonString);

import 'dart:convert';

ServicesResponse servicesResponseFromJson(String str) => ServicesResponse.fromJson(json.decode(str));

String servicesResponseToJson(ServicesResponse data) => json.encode(data.toJson());

class ServicesResponse {
    ServicesResponse({
        this.data,
    });

    List<Datum> data;

    factory ServicesResponse.fromJson(Map<String, dynamic> json) => ServicesResponse(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.preco,
        this.created,
        this.categoria,
        this.datumClass,
        this.tempo,
        this.titulo,
        this.ownerId,
        this.updated,
        this.objectId,
    });

    String preco;
    int created;
    Categoria categoria;
    String datumClass;
    String tempo;
    String titulo;
    dynamic ownerId;
    dynamic updated;
    String objectId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        preco: json["preco"] == null ? null : json["preco"],
        created: json["created"] == null ? null : json["created"],
        categoria: json["categoria"] == null ? null : Categoria.fromJson(json["categoria"]),
        datumClass: json["___class"] == null ? null : json["___class"],
        tempo: json["tempo"] == null ? null : json["tempo"],
        titulo: json["titulo"] == null ? null : json["titulo"],
        ownerId: json["ownerId"],
        updated: json["updated"],
        objectId: json["objectId"] == null ? null : json["objectId"],
    );

    Map<String, dynamic> toJson() => {
        "preco": preco == null ? null : preco,
        "created": created == null ? null : created,
        "categoria": categoria == null ? null : categoria.toJson(),
        "___class": datumClass == null ? null : datumClass,
        "tempo": tempo == null ? null : tempo,
        "titulo": titulo == null ? null : titulo,
        "ownerId": ownerId,
        "updated": updated,
        "objectId": objectId == null ? null : objectId,
    };
}

class Categoria {
    Categoria({
        this.image,
        this.created,
        this.categoria,
        this.categoriaClass,
        this.ownerId,
        this.updated,
        this.objectId,
    });

    String image;
    int created;
    String categoria;
    String categoriaClass;
    dynamic ownerId;
    int updated;
    String objectId;

    factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        image: json["image"] == null ? null : json["image"],
        created: json["created"] == null ? null : json["created"],
        categoria: json["categoria"] == null ? null : json["categoria"],
        categoriaClass: json["___class"] == null ? null : json["___class"],
        ownerId: json["ownerId"],
        updated: json["updated"] == null ? null : json["updated"],
        objectId: json["objectId"] == null ? null : json["objectId"],
    );

    Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
        "created": created == null ? null : created,
        "categoria": categoria == null ? null : categoria,
        "___class": categoriaClass == null ? null : categoriaClass,
        "ownerId": ownerId,
        "updated": updated == null ? null : updated,
        "objectId": objectId == null ? null : objectId,
    };
}