// To parse this JSON data, do
//
//     final myServicesResponse = myServicesResponseFromJson(jsonString);

import 'dart:convert';

MyServicesResponse myServicesResponseFromJson(String str) => MyServicesResponse.fromJson(json.decode(str));

String myServicesResponseToJson(MyServicesResponse data) => json.encode(data.toJson());

class MyServicesResponse {
    MyServicesResponse({
        this.data,
    });

    List<Datum> data;

    factory MyServicesResponse.fromJson(Map<String, dynamic> json) => MyServicesResponse(
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
        this.worker,
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
    List<Worker> worker;
    int updated;
    String objectId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        preco: json["preco"] == null ? null : json["preco"],
        created: json["created"] == null ? null : json["created"],
        categoria: json["categoria"] == null ? null : Categoria.fromJson(json["categoria"]),
        datumClass: json["___class"] == null ? null : json["___class"],
        tempo: json["tempo"] == null ? null : json["tempo"],
        titulo: json["titulo"] == null ? null : json["titulo"],
        ownerId: json["ownerId"],
        worker: json["worker"] == null ? null : List<Worker>.from(json["worker"].map((x) => Worker.fromJson(x))),
        updated: json["updated"] == null ? null : json["updated"],
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
        "worker": worker == null ? null : List<dynamic>.from(worker.map((x) => x.toJson())),
        "updated": updated == null ? null : updated,
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

class Worker {
    Worker({
        this.telefone,
        this.estado,
        this.tipo,
        this.cidade,
        this.endereco,
        this.created,
        this.nome,
        this.ownerId,
        this.password,
        this.porfilePhoto,
        this.cpf,
        this.workerClass,
        this.updated,
        this.email,
        this.objectId,
    });

    String telefone;
    String estado;
    String tipo;
    String cidade;
    String endereco;
    int created;
    String nome;
    dynamic ownerId;
    String password;
    String porfilePhoto;
    String cpf;
    String workerClass;
    dynamic updated;
    String email;
    String objectId;

    factory Worker.fromJson(Map<String, dynamic> json) => Worker(
        telefone: json["telefone"] == null ? null : json["telefone"],
        estado: json["estado"] == null ? null : json["estado"],
        tipo: json["tipo"] == null ? null : json["tipo"],
        cidade: json["cidade"] == null ? null : json["cidade"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        created: json["created"] == null ? null : json["created"],
        nome: json["nome"] == null ? null : json["nome"],
        ownerId: json["ownerId"],
        password: json["password"] == null ? null : json["password"],
        porfilePhoto: json["porfile_photo"] == null ? null : json["porfile_photo"],
        cpf: json["cpf"] == null ? null : json["cpf"],
        workerClass: json["___class"] == null ? null : json["___class"],
        updated: json["updated"],
        email: json["email"] == null ? null : json["email"],
        objectId: json["objectId"] == null ? null : json["objectId"],
    );

    Map<String, dynamic> toJson() => {
        "telefone": telefone == null ? null : telefone,
        "estado": estado == null ? null : estado,
        "tipo": tipo == null ? null : tipo,
        "cidade": cidade == null ? null : cidade,
        "endereco": endereco == null ? null : endereco,
        "created": created == null ? null : created,
        "nome": nome == null ? null : nome,
        "ownerId": ownerId,
        "password": password == null ? null : password,
        "porfile_photo": porfilePhoto == null ? null : porfilePhoto,
        "cpf": cpf == null ? null : cpf,
        "___class": workerClass == null ? null : workerClass,
        "updated": updated,
        "email": email == null ? null : email,
        "objectId": objectId == null ? null : objectId,
    };
}