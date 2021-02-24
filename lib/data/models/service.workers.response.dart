// To parse this JSON data, do
//
//     final serviceWorkersResponse = serviceWorkersResponseFromJson(jsonString);

import 'dart:convert';

ServiceWorkersResponse serviceWorkersResponseFromJson(String str) => ServiceWorkersResponse.fromJson(json.decode(str));

String serviceWorkersResponseToJson(ServiceWorkersResponse data) => json.encode(data.toJson());

class ServiceWorkersResponse {
  ServiceWorkersResponse({
    this.data,
  });

  List<Datum> data;

  factory ServiceWorkersResponse.fromJson(Map<String, dynamic> json) => ServiceWorkersResponse(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.tipo,
    this.telefone,
    this.estado,
    this.cidade,
    this.endereco,
    this.created,
    this.nome,
    this.ownerId,
    this.password,
    this.porfilePhoto,
    this.cpf,
    this.datumClass,
    this.updated,
    this.email,
    this.objectId,
  });

  String tipo;
  String telefone;
  String estado;
  String cidade;
  String endereco;
  int created;
  String nome;
  dynamic ownerId;
  String password;
  String porfilePhoto;
  String cpf;
  String datumClass;
  dynamic updated;
  String email;
  String objectId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    tipo: json["tipo"] == null ? null : json["tipo"],
    telefone: json["telefone"] == null ? null : json["telefone"],
    estado: json["estado"] == null ? null : json["estado"],
    cidade: json["cidade"] == null ? null : json["cidade"],
    endereco: json["endereco"] == null ? null : json["endereco"],
    created: json["created"] == null ? null : json["created"],
    nome: json["nome"] == null ? null : json["nome"],
    ownerId: json["ownerId"],
    password: json["password"] == null ? null : json["password"],
    porfilePhoto: json["porfile_photo"] == null ? null : json["porfile_photo"],
    cpf: json["cpf"] == null ? null : json["cpf"],
    datumClass: json["___class"] == null ? null : json["___class"],
    updated: json["updated"],
    email: json["email"] == null ? null : json["email"],
    objectId: json["objectId"] == null ? null : json["objectId"],
  );

  Map<String, dynamic> toJson() => {
    "tipo": tipo == null ? null : tipo,
    "telefone": telefone == null ? null : telefone,
    "estado": estado == null ? null : estado,
    "cidade": cidade == null ? null : cidade,
    "endereco": endereco == null ? null : endereco,
    "created": created == null ? null : created,
    "nome": nome == null ? null : nome,
    "ownerId": ownerId,
    "password": password == null ? null : password,
    "porfile_photo": porfilePhoto == null ? null : porfilePhoto,
    "cpf": cpf == null ? null : cpf,
    "___class": datumClass == null ? null : datumClass,
    "updated": updated,
    "email": email == null ? null : email,
    "objectId": objectId == null ? null : objectId,
  };
}