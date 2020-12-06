// To parse this JSON data, do
//
//     final scheduleResponse = scheduleResponseFromJson(jsonString);

import 'dart:convert';

ScheduleResponse scheduleResponseFromJson(String str) => ScheduleResponse.fromJson(json.decode(str));

String scheduleResponseToJson(ScheduleResponse data) => json.encode(data.toJson());

class ScheduleResponse {
    ScheduleResponse({
        this.data,
    });

    List<Datum> data;

    factory ScheduleResponse.fromJson(Map<String, dynamic> json) => ScheduleResponse(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.preco,
        this.estado,
        this.clienteId,
        this.data,
        this.created,
        this.hora,
        this.datumClass,
        this.titulo,
        this.funcionario,
        this.ownerId,
        this.updated,
        this.objectId,
    });

    String preco;
    String estado;
    String clienteId;
    String data;
    int created;
    String hora;
    String datumClass;
    String titulo;
    Funcionario funcionario;
    dynamic ownerId;
    dynamic updated;
    String objectId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        preco: json["preco"] == null ? null : json["preco"],
        estado: json["estado"] == null ? null : json["estado"],
        clienteId: json["clienteId"] == null ? null : json["clienteId"],
        data: json["data"] == null ? null : json["data"],
        created: json["created"] == null ? null : json["created"],
        hora: json["hora"] == null ? null : json["hora"],
        datumClass: json["___class"] == null ? null : json["___class"],
        titulo: json["titulo"] == null ? null : json["titulo"],
        funcionario: json["funcionario"] == null ? null : Funcionario.fromJson(json["funcionario"]),
        ownerId: json["ownerId"],
        updated: json["updated"],
        objectId: json["objectId"] == null ? null : json["objectId"],
    );

    Map<String, dynamic> toJson() => {
        "preco": preco == null ? null : preco,
        "estado": estado == null ? null : estado,
        "clienteId": clienteId == null ? null : clienteId,
        "data": data == null ? null : data,
        "created": created == null ? null : created,
        "hora": hora == null ? null : hora,
        "___class": datumClass == null ? null : datumClass,
        "titulo": titulo == null ? null : titulo,
        "funcionario": funcionario == null ? null : funcionario.toJson(),
        "ownerId": ownerId,
        "updated": updated,
        "objectId": objectId == null ? null : objectId,
    };
}

class Funcionario {
    Funcionario({
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
        this.funcionarioClass,
        this.empresa,
        this.updated,
        this.email,
        this.objectId,
        this.horario,
        this.cpnjCpf,
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
    String funcionarioClass;
    Funcionario empresa;
    dynamic updated;
    String email;
    String objectId;
    String horario;
    String cpnjCpf;

    factory Funcionario.fromJson(Map<String, dynamic> json) => Funcionario(
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
        funcionarioClass: json["___class"] == null ? null : json["___class"],
        empresa: json["empresa"] == null ? null : Funcionario.fromJson(json["empresa"]),
        updated: json["updated"],
        email: json["email"] == null ? null : json["email"],
        objectId: json["objectId"] == null ? null : json["objectId"],
        horario: json["horario"] == null ? null : json["horario"],
        cpnjCpf: json["cpnj_cpf"] == null ? null : json["cpnj_cpf"],
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
        "___class": funcionarioClass == null ? null : funcionarioClass,
        "empresa": empresa == null ? null : empresa.toJson(),
        "updated": updated,
        "email": email == null ? null : email,
        "objectId": objectId == null ? null : objectId,
        "horario": horario == null ? null : horario,
        "cpnj_cpf": cpnjCpf == null ? null : cpnjCpf,
    };
}
