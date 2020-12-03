import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uservices/data/models/categories.response.dart';
import 'package:uservices/data/models/login.response.dart';
import 'package:uservices/data/provider/provider.dart';
import 'package:uservices/data/service/http.service.dart';
import 'package:uservices/ui/pages/menu.page.dart';
import 'package:uservices/ui/pages/serviceprovider/service.provider.login.page.dart';

class ServiceRegisterController extends GetxController {
  //Ctrl => Controller
  HttpServices http = HttpServices();
  var categories;
  final _sending = false.obs;
  final _name = TextEditingController().obs;
  final _phone = TextEditingController().obs;
  final _email = TextEditingController().obs;
  final _cpnj = TextEditingController().obs;
  final _county = 'Estado'.obs;
  final _city = TextEditingController().obs;
  final _address = TextEditingController().obs;
  final _password = TextEditingController().obs;
  final _service = ''.obs;
  var objectId = '';
  LoginResponse loginResponse = LoginResponse();

  get name => this._name.value;
  set name(value) => this._name.value = value;

  get phone => this._phone.value;
  set phone(value) => this._phone.value = value;

  get email => this._email.value;
  set email(value) => this._email.value = value;

  get cpnj => this._cpnj.value;
  set cpnj(value) => this._cpnj.value = value;

  get city => this._city.value;
  set city(value) => this._city.value = value;

  get sending => this._sending.value;
  set sending(value) => this._sending.value = value;

  get address => this._address.value;
  set address(value) => this._address.value = value;

  get password => this._password.value;
  set password(value) => this._password.value = value;

  get service => this._service.value;
  set service(value) => this._service.value = value;

  get county => this._county.value;
  set county(value) => this._county.value = value;

  /*@override
  void onClose() {
    emailCtrl?.dispose();
    passwordCtrl?.dispose();
    super.onClose();
  }*/

  void createBusinessAccount() async {
    http.initApi();
    print('ok');
    var result;
    var params = {
      "nome": name.text.toString().trim(),
      "telefone": phone.text.toString().trim(),
      "email": email.text.toString().trim(),
      "cpnj_cpf": cpnj.text.toString().trim(),
      "estado": county.toString().trim(),
      "cidade": city.text.toString().trim(),
      "endereco": address.text.toString().trim(),
      "horario": '24H',
      "servico": [
        {"objectId":objectId}
      ],
      "password": password.text..toString().trim()
    };
    if(name.text.isEmpty ||
        phone.text.isEmpty ||
        cpnj.text.isEmpty ||
        county.isEmpty || county == 'Estado' ||
        city.text.isEmpty ||
        email.text.isEmpty ||
        address.text.isEmpty ||
        service.isEmpty ||
        password.text.isEmpty){
      Get.snackbar('Resultado', 'Campos em branco.',
          showProgressIndicator: true);

    }else{
      print(jsonEncode(params));
      sending = true;
      await http.post('/createNegocio', params, headers: {
        'Content-Type': 'application/json'
      }).then((value) {
        sending = false;
        if (value.toString().contains('Erro')) {
          Get.snackbar(
              'Resultado', 'Erro de autentição.', showProgressIndicator: true);
        } else {
          Get.snackbar(
              'Resultado', 'Cadastro concluido com sucesso.', showProgressIndicator: true);
          Get.offAll(ServiceProviderLoginPage());
        }
      }).catchError((error) {
        print(error);
        Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
            showProgressIndicator: true);
        sending = false;
      });
    }
  }

  void getCategories() async {
    http.initApi();
    print('ok');
    await http.get('/categorias', headers: {
      'Content-Type': 'application/json; charset=utf-8'
    }).then((value) {
      if (value.toString().contains('Erro')) {
        Get.snackbar('Resultado', 'Erro de autentição.', showProgressIndicator: true);
      } else {
        categories = CategoriesResponse.fromJson(jsonDecode(value));
        print(categories);
      }
    }).catchError((error) {
      print(error);
      Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
          showProgressIndicator: true);
    });
  }
}
