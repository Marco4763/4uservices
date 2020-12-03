import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uservices/data/models/login.response.dart';
import 'package:uservices/data/provider/provider.dart';
import 'package:uservices/data/service/http.service.dart';
import 'package:uservices/ui/pages/menu.page.dart';

class LoginController extends GetxController {
  //Ctrl => Controller
  HttpServices http = HttpServices();
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();
  final _sending = false.obs;
  LoginResponse loginResponse = LoginResponse();

  get sending => this._sending.value;
  set sending(value) => this._sending.value = value;

  @override
  void onClose() {
    emailCtrl?.dispose();
    passwordCtrl?.dispose();
    super.onClose();
  }

  void login() async {
    http.initApi();
    print('ok');
    var result;
    var params = {
      "email": emailCtrl.text.trim(),
      "password": passwordCtrl.text.trim()
    };
    if(emailCtrl.text.isEmpty || passwordCtrl.text.isEmpty){

      Get.snackbar('Resultado', 'Campos em branco.',
          showProgressIndicator: true);

    }else{

      sending = true;
      await http.post('/loginCliente', params, headers: {
        'Content-Type': 'application/json'
      }).then((value) {
        sending = false;
        if (value.toString().contains('Erro')) {
          Get.snackbar(
              'Resultado', 'Erro de autentição.', showProgressIndicator: true);
        } else {
          result = LoginResponse.fromJson(jsonDecode(value));
          print(result);
          storage.write('id', result.data[0].objectId);
          storage.write('tipo', result.data[0].tipo);
          Get.offAll(MenuPage(profile: result,));
        }
      }).catchError((error) {
        print(error);
        Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
            showProgressIndicator: true);
        sending = false;
      });

    }
  }
}
