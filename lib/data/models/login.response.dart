// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

List<LoginResponse> loginResponseFromJson(String str) =>
    List<LoginResponse>.from(
        json.decode(str).map((x) => LoginResponse.fromJson(x)));

String loginResponseToJson(List<LoginResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginResponse {
  LoginResponse({
    this.jsonclass,
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
    this.loginResponseClass,
    this.updated,
    this.email,
    this.objectId,
  });

  String jsonclass;
  String tipo;
  String telefone;
  String estado;
  String cidade;
  String endereco;
  int created;
  String nome;
  dynamic ownerId;
  String password;
  dynamic porfilePhoto;
  String loginResponseClass;
  int updated;
  String email;
  String objectId;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        jsonclass: json["___jsonclass"] == null ? null : json["___jsonclass"],
        tipo: json["tipo"] == null ? null : json["tipo"],
        telefone: json["telefone"] == null ? null : json["telefone"],
        estado: json["estado"] == null ? null : json["estado"],
        cidade: json["cidade"] == null ? null : json["cidade"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        created: json["created"] == null ? null : json["created"],
        nome: json["nome"] == null ? null : json["nome"],
        ownerId: json["ownerId"],
        password: json["password"] == null ? null : json["password"],
        porfilePhoto: json["porfile_photo"],
        loginResponseClass: json["___class"] == null ? null : json["___class"],
        updated: json["updated"] == null ? null : json["updated"],
        email: json["email"] == null ? null : json["email"],
        objectId: json["objectId"] == null ? null : json["objectId"],
      );

  Map<String, dynamic> toJson() => {
        "___jsonclass": jsonclass == null ? null : jsonclass,
        "tipo": tipo == null ? null : tipo,
        "telefone": telefone == null ? null : telefone,
        "estado": estado == null ? null : estado,
        "cidade": cidade == null ? null : cidade,
        "endereco": endereco == null ? null : endereco,
        "created": created == null ? null : created,
        "nome": nome == null ? null : nome,
        "ownerId": ownerId,
        "password": password == null ? null : password,
        "porfile_photo": porfilePhoto,
        "___class": loginResponseClass == null ? null : loginResponseClass,
        "updated": updated == null ? null : updated,
        "email": email == null ? null : email,
        "objectId": objectId == null ? null : objectId,
      };
}
