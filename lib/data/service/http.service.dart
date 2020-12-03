import 'dart:convert';
import 'dart:async';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HttpServices {
  String url = 'https://api.backendless.com/0094E0EE-4920-7B0C-FF0A-5CCBB8768100/B0A08405-72EA-439E-84A4-18516A8B69D6/services/api';
  dynamic result;

  void initApi(){
    Backendless.setUrl('https://api.backendless.com');
    Backendless.initApp(
      "0094E0EE-4920-7B0C-FF0A-5CCBB8768100",
      "2BB3DA3E-D04B-471D-B1DB-D6DD39A41047",
      "80AE15FF-E197-47DF-9639-11A1A346F74E",
    );
    print('done');
  }

  Future get(String uri, {Map<String, String> headers}) async {
    try {
      http.Response response = await http.get(url + uri, headers: headers);

      final statusCode = response.statusCode;
      final String jsonBody = response.body;
      print(jsonBody);
      if (statusCode != 200 || jsonBody.contains('"sucesso": false') || jsonBody == null) {
        print('Erro de processamento: ' + statusCode.toString());
        result = jsonBody;
      } else {
        result = JsonDecoder().convert(jsonBody);
      }
    } catch (e) {
      print(result.toString());
    }

    return result;
  }

  Future post(String uri, dynamic body, {Map<String, String> headers}) async {
    try {
      http.Response response =
      await http.post(url + uri, body: jsonEncode(body), headers: headers);
      final statusCode = response.statusCode;
      final String jsonBody = response.body;
      print(jsonBody);
      if (statusCode != 200 || jsonBody == '[]') {
        result = 'Erro de processamento: ' + statusCode.toString();
        print(result);
      } else {
        result = JsonDecoder().convert(jsonBody);
      }
    } catch (e) {
      print(e);
    }

    return result;
  }

  Future postWithDio(String uri, dynamic body, String token) async {
    var dio = Dio();
    dio.options.headers = {'Authorization': token};
    await dio.post(url + uri, data: jsonEncode(body)).then((value) {
      print(value.data.toString() + "\n" + value.request.toString());
      final statusCode = value.statusCode;
      final String jsonBody = value.data;

      if (statusCode != 200 || jsonBody.contains('"sucesso": false')) {
        print('Erro de processamento: ' + statusCode.toString());
        result = jsonBody;
      } else {
        result = JsonDecoder().convert(jsonBody);
      }
    }).catchError((error) {
      print(result.toString()+" ola");
    });

    return result;
  }

  Future put(String uri, dynamic body, {Map<String, String> headers}) async {
    try {
      http.Response response =
      await http.put(url + uri, body: jsonEncode(body), headers: headers);

      final statusCode = response.statusCode;
      final String jsonBody = response.body;

      if (statusCode != 200 || jsonBody.contains('"sucesso": false')) {
        print('Erro de processamento: ' + statusCode.toString());
        result = jsonBody;
      } else {
        result = JsonDecoder().convert(jsonBody);
      }
    } catch (e) {
      print(result.toString());
    }

    return result;
  }

  Future patch(String uri, dynamic body, {Map<String, String> headers}) async {
    try {
      http.Response response =
      await http.post(url + uri, body: jsonEncode(body), headers: headers);

      final statusCode = response.statusCode;
      final String jsonBody = response.body;

      if (statusCode != 200 || jsonBody.contains('"sucesso": false')) {
        print('Erro de processamento: ' + statusCode.toString());
        result = jsonBody;
      } else {
        result = JsonDecoder().convert(jsonBody);
      }
    } catch (e) {
      print(result.toString());
    }

    return result;
  }

  Future delete(String uri, {Map<String, String> headers}) async {
    try {
      http.Response response = await http.get(url + uri, headers: headers);

      final statusCode = response.statusCode;
      final String jsonBody = response.body;

      if (statusCode != 200 || jsonBody.contains('"sucesso": false')) {
        print('Erro de processamento: ' + statusCode.toString());
        result = jsonBody;
      } else {
        result = JsonDecoder().convert(jsonBody);
      }
    } catch (e) {
      print(result.toString());
    }

    return result;
  }
}