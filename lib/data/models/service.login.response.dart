// To parse this JSON data, do
//
//     final serviceLoginResponse = serviceLoginResponseFromJson(jsonString);

import 'dart:convert';

ServiceLoginResponse serviceLoginResponseFromJson(String str) => ServiceLoginResponse.fromJson(json.decode(str));

String serviceLoginResponseToJson(ServiceLoginResponse data) => json.encode(data.toJson());

class ServiceLoginResponse {
  ServiceLoginResponse({
    this.data,
  });

  List<Datum> data;

  factory ServiceLoginResponse.fromJson(Map<String, dynamic> json) => ServiceLoginResponse(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.cidade,
    this.estado,
    this.telefone,
    this.endereco,
    this.horario,
    this.created,
    this.cpnjCpf,
    this.nome,
    this.ownerId,
    this.password,
    this.datumClass,
    this.updated,
    this.email,
    this.objectId,
  });

  String cidade;
  String estado;
  String telefone;
  String endereco;
  String horario;
  int created;
  String cpnjCpf;
  String nome;
  dynamic ownerId;
  String password;
  String datumClass;
  dynamic updated;
  String email;
  String objectId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    cidade: json["cidade"] == null ? null : json["cidade"],
    estado: json["estado"] == null ? null : json["estado"],
    telefone: json["telefone"] == null ? null : json["telefone"],
    endereco: json["endereco"] == null ? null : json["endereco"],
    horario: json["horario"] == null ? null : json["horario"],
    created: json["created"] == null ? null : json["created"],
    cpnjCpf: json["cpnj_cpf"] == null ? null : json["cpnj_cpf"],
    nome: json["nome"] == null ? null : json["nome"],
    ownerId: json["ownerId"],
    password: json["password"] == null ? null : json["password"],
    datumClass: json["___class"] == null ? null : json["___class"],
    updated: json["updated"],
    email: json["email"] == null ? null : json["email"],
    objectId: json["objectId"] == null ? null : json["objectId"],
  );

  Map<String, dynamic> toJson() => {
    "cidade": cidade == null ? null : cidade,
    "estado": estado == null ? null : estado,
    "telefone": telefone == null ? null : telefone,
    "endereco": endereco == null ? null : endereco,
    "horario": horario == null ? null : horario,
    "created": created == null ? null : created,
    "cpnj_cpf": cpnjCpf == null ? null : cpnjCpf,
    "nome": nome == null ? null : nome,
    "ownerId": ownerId,
    "password": password == null ? null : password,
    "___class": datumClass == null ? null : datumClass,
    "updated": updated,
    "email": email == null ? null : email,
    "objectId": objectId == null ? null : objectId,
  };
}