// To parse this JSON data, do
//
//     final favoritesResponse = favoritesResponseFromJson(jsonString);

import 'dart:convert';

FavoritesResponse favoritesResponseFromJson(String str) => FavoritesResponse.fromJson(json.decode(str));

String favoritesResponseToJson(FavoritesResponse data) => json.encode(data.toJson());

class FavoritesResponse {
    FavoritesResponse({
        this.data,
    });

    List<Datum> data;

    factory FavoritesResponse.fromJson(Map<String, dynamic> json) => FavoritesResponse(
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Servico {
    Servico({
        this.preco,
        this.horario,
        this.created,
        this.categoria,
        this.servicoClass,
        this.tempo,
        this.titulo,
        this.ownerId,
        this.worker,
        this.empresa,
        this.updated,
        this.objectId,
    });

    String preco;
    Horario horario;
    int created;
    Datum categoria;
    String servicoClass;
    String tempo;
    String titulo;
    dynamic ownerId;
    List<Empresa> worker;
    Empresa empresa;
    dynamic updated;
    String objectId;

    factory Servico.fromJson(Map<String, dynamic> json) => Servico(
        preco: json["preco"] == null ? null : json["preco"],
        horario: json["horario"] == null ? null : Horario.fromJson(json["horario"]),
        created: json["created"] == null ? null : json["created"],
        categoria: json["categoria"] == null ? null : Datum.fromJson(json["categoria"]),
        servicoClass: json["___class"] == null ? null : json["___class"],
        tempo: json["tempo"] == null ? null : json["tempo"],
        titulo: json["titulo"] == null ? null : json["titulo"],
        ownerId: json["ownerId"],
        worker: json["worker"] == null ? null : List<Empresa>.from(json["worker"].map((x) => Empresa.fromJson(x))),
        empresa: json["empresa"] == null ? null : Empresa.fromJson(json["empresa"]),
        updated: json["updated"],
        objectId: json["objectId"] == null ? null : json["objectId"],
    );

    Map<String, dynamic> toJson() => {
        "preco": preco == null ? null : preco,
        "horario": horario == null ? null : horario.toJson(),
        "created": created == null ? null : created,
        "categoria": categoria == null ? null : categoria.toJson(),
        "___class": servicoClass == null ? null : servicoClass,
        "tempo": tempo == null ? null : tempo,
        "titulo": titulo == null ? null : titulo,
        "ownerId": ownerId,
        "worker": worker == null ? null : List<dynamic>.from(worker.map((x) => x.toJson())),
        "empresa": empresa == null ? null : empresa.toJson(),
        "updated": updated,
        "objectId": objectId == null ? null : objectId,
    };
}

class Datum {
    Datum({
        this.image,
        this.created,
        this.datumClass,
        this.ownerId,
        this.servico,
        this.updated,
        this.usuarioId,
        this.objectId,
        this.categoria,
    });

    String image;
    int created;
    String datumClass;
    dynamic ownerId;
    Servico servico;
    int updated;
    String usuarioId;
    String objectId;
    String categoria;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        image: json["image"] == null ? null : json["image"],
        created: json["created"] == null ? null : json["created"],
        datumClass: json["___class"] == null ? null : json["___class"],
        ownerId: json["ownerId"],
        servico: json["servico"] == null ? null : Servico.fromJson(json["servico"]),
        updated: json["updated"] == null ? null : json["updated"],
        usuarioId: json["usuarioId"] == null ? null : json["usuarioId"],
        objectId: json["objectId"] == null ? null : json["objectId"],
        categoria: json["categoria"] == null ? null : json["categoria"],
    );

    Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
        "created": created == null ? null : created,
        "___class": datumClass == null ? null : datumClass,
        "ownerId": ownerId,
        "servico": servico == null ? null : servico.toJson(),
        "updated": updated == null ? null : updated,
        "usuarioId": usuarioId == null ? null : usuarioId,
        "objectId": objectId == null ? null : objectId,
        "categoria": categoria == null ? null : categoria,
    };
}

class Empresa {
    Empresa({
        this.estado,
        this.telefone,
        this.cidade,
        this.endereco,
        this.horario,
        this.cpnjCpf,
        this.created,
        this.nome,
        this.ownerId,
        this.password,
        this.empresaClass,
        this.updated,
        this.email,
        this.objectId,
        this.tipo,
        this.porfilePhoto,
        this.cpf,
        this.empresa,
    });

    String estado;
    String telefone;
    String cidade;
    String endereco;
    String horario;
    String cpnjCpf;
    int created;
    String nome;
    dynamic ownerId;
    String password;
    String empresaClass;
    dynamic updated;
    String email;
    String objectId;
    String tipo;
    String porfilePhoto;
    String cpf;
    Empresa empresa;

    factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
        estado: json["estado"] == null ? null : json["estado"],
        telefone: json["telefone"] == null ? null : json["telefone"],
        cidade: json["cidade"] == null ? null : json["cidade"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        horario: json["horario"] == null ? null : json["horario"],
        cpnjCpf: json["cpnj_cpf"] == null ? null : json["cpnj_cpf"],
        created: json["created"] == null ? null : json["created"],
        nome: json["nome"] == null ? null : json["nome"],
        ownerId: json["ownerId"],
        password: json["password"] == null ? null : json["password"],
        empresaClass: json["___class"] == null ? null : json["___class"],
        updated: json["updated"],
        email: json["email"] == null ? null : json["email"],
        objectId: json["objectId"] == null ? null : json["objectId"],
        tipo: json["tipo"] == null ? null : json["tipo"],
        porfilePhoto: json["porfile_photo"] == null ? null : json["porfile_photo"],
        cpf: json["cpf"] == null ? null : json["cpf"],
        empresa: json["empresa"] == null ? null : Empresa.fromJson(json["empresa"]),
    );

    Map<String, dynamic> toJson() => {
        "estado": estado == null ? null : estado,
        "telefone": telefone == null ? null : telefone,
        "cidade": cidade == null ? null : cidade,
        "endereco": endereco == null ? null : endereco,
        "horario": horario == null ? null : horario,
        "cpnj_cpf": cpnjCpf == null ? null : cpnjCpf,
        "created": created == null ? null : created,
        "nome": nome == null ? null : nome,
        "ownerId": ownerId,
        "password": password == null ? null : password,
        "___class": empresaClass == null ? null : empresaClass,
        "updated": updated,
        "email": email == null ? null : email,
        "objectId": objectId == null ? null : objectId,
        "tipo": tipo == null ? null : tipo,
        "porfile_photo": porfilePhoto == null ? null : porfilePhoto,
        "cpf": cpf == null ? null : cpf,
        "empresa": empresa == null ? null : empresa.toJson(),
    };
}

class Horario {
    Horario({
        this.created,
        this.horarioClass,
        this.inicio,
        this.fim,
        this.ownerId,
        this.updated,
        this.objectId,
    });

    int created;
    String horarioClass;
    String inicio;
    String fim;
    dynamic ownerId;
    dynamic updated;
    String objectId;

    factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        created: json["created"] == null ? null : json["created"],
        horarioClass: json["___class"] == null ? null : json["___class"],
        inicio: json["inicio"] == null ? null : json["inicio"],
        fim: json["fim"] == null ? null : json["fim"],
        ownerId: json["ownerId"],
        updated: json["updated"],
        objectId: json["objectId"] == null ? null : json["objectId"],
    );

    Map<String, dynamic> toJson() => {
        "created": created == null ? null : created,
        "___class": horarioClass == null ? null : horarioClass,
        "inicio": inicio == null ? null : inicio,
        "fim": fim == null ? null : fim,
        "ownerId": ownerId,
        "updated": updated,
        "objectId": objectId == null ? null : objectId,
    };
}