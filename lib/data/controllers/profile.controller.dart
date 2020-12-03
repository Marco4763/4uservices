import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uservices/data/models/login.response.dart';
import 'package:uservices/data/models/profile.response.dart';
import 'package:uservices/data/provider/provider.dart';
import 'package:uservices/data/service/http.service.dart';
import 'package:uservices/ui/pages/menu.page.dart';

class ProfileController extends GetxController {
  //Ctrl => Controller
  HttpServices http = HttpServices();

  void getDetails() async {
    http.initApi();
    print('ok');
    var result;
      await http.get('/getCliente', headers: {
        'Content-Type': 'application/json'
      }).then((value) {
        if (value.toString().contains('Erro')) {
          Get.snackbar('Resultado', 'Erro de autentição.', showProgressIndicator: true);
        } else {
          result = ProfileResponse.fromJson(jsonDecode(value));
          print(result);
        }
      }).catchError((error) {
        print(error);
        Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
            showProgressIndicator: true);
      });
    }
}