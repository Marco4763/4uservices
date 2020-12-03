import 'dart:convert';

import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uservices/data/models/categories.response.dart';
import 'package:uservices/data/models/login.response.dart';
import 'package:uservices/data/provider/provider.dart';
import 'package:uservices/data/service/http.service.dart';
import 'package:uservices/ui/pages/menu.page.dart';
import 'package:uservices/ui/pages/serviceprovider/service.provider.login.page.dart';
import 'package:uservices/ui/pages/serviceprovider/service.provider.menu.page.dart';

class ServiceWorkerController extends GetxController {
  //Ctrl => Controller
  HttpServices http = HttpServices();
  var pic;
  var categories;
  final _sending = false.obs;
  final _name = TextEditingController().obs;
  final _phone = TextEditingController().obs;
  final _cpf = TextEditingController().obs;
  final _email = TextEditingController().obs;
  final _county = 'Estado'.obs;
  final _city = TextEditingController().obs;
  final _address = TextEditingController().obs;
  final _password = TextEditingController().obs;
  final _url = ''.obs;
  var objectId = '';
  LoginResponse loginResponse = LoginResponse();

  get name => this._name.value;
  set name(value) => this._name.value = value;

  get phone => this._phone.value;
  set phone(value) => this._phone.value = value;

  get email => this._email.value;
  set email(value) => this._email.value = value;

  get cpf => this._cpf.value;
  set cpf(value) => this._cpf.value = value;

  get city => this._city.value;
  set city(value) => this._city.value = value;

  get sending => this._sending.value;
  set sending(value) => this._sending.value = value;

  get address => this._address.value;
  set address(value) => this._address.value = value;

  get password => this._password.value;
  set password(value) => this._password.value = value;

  get url => this._url.value;
  set url(value) => this._url.value = value;

  get county => this._county.value;
  set county(value) => this._county.value = value;

  /*@override
  void onClose() {
    emailCtrl?.dispose();
    passwordCtrl?.dispose();
    super.onClose();
  }*/

  void sendPhoto( var file, var path) async{
    http.initApi();
    if(pic == null ||
        name.text.isEmpty ||
        phone.text.isEmpty ||
        cpf.text.isEmpty ||
        county.isEmpty || county == 'Estado' ||
        city.text.isEmpty ||
        email.text.isEmpty ||
        address.text.isEmpty ){
      Get.snackbar('Resultado', 'Campos em branco.',
          showProgressIndicator: true);
    }else {
      sending = true;
      Backendless.files.upload(file, path).then((response) {
        url = response;
        createWorkerAccount();
      }).catchError((error){
        Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
            showProgressIndicator: true);
        sending = false;
      });
    }
  }

  void createWorkerAccount() async {
    http.initApi();
    print('ok');
    var params = {
    "nome": name.text.toString().trim(),
    "telefone": phone.text.toString().trim(),
    "email": email.text.toString().trim(),
    "cpf": cpf.text.toString().trim(),
    "estado": county.toString().trim(),
    "cidade": city.text.toString().trim(),
    "endereco": address.text.toString().trim(),
    "password": '1234',
    "porfile_photo": url,
    "objectId": [
      {"objectId":objectId}
    ]
    };
      print(jsonEncode(params));
      await http.post('/signupWorker', params, headers: {
        'Content-Type': 'application/json'
      }).then((value) {
        sending = false;
        if (value.toString().contains('Erro')) {
          Get.snackbar(
              'Resultado', 'Erro de autentição.', showProgressIndicator: true);
        } else {
          Get.snackbar(
              'Resultado', 'Cadastro concluido com sucesso.', showProgressIndicator: true);
        }
      }).catchError((error) {
        print(error);
        Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
            showProgressIndicator: true);
        sending = false;
      });
  }
}
