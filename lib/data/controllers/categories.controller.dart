import 'dart:convert';
import 'package:get/get.dart';
import 'package:uservices/data/models/categories.response.dart';
import 'package:uservices/data/models/login.response.dart';
import 'package:uservices/data/models/profile.response.dart';
import 'package:uservices/data/provider/provider.dart';
import 'package:uservices/data/service/http.service.dart';
import 'package:uservices/ui/pages/menu.page.dart';

class CategoriesController extends GetxController {
  //Ctrl => Controller
  final _state = 0.obs;
  var result;
  HttpServices http = HttpServices();

  get state => this._state.value;
  set state(value) => this._state.value = value;

  void getCategories() async {
    state = 1;
    http.initApi();
    print('ok');
    await http.get('/categorias', headers: {
      'Content-Type': 'application/json; charset=utf-8'
    }).then((value) {
      state = 2;
      if (value.toString().contains('Erro')) {
        Get.snackbar('Resultado', 'Erro de autentição.', showProgressIndicator: true);
      } else {
        result = CategoriesResponse.fromJson(jsonDecode(value));
        print(result);
      }
    }).catchError((error) {
      state = 3;
      print(error);
      Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
          showProgressIndicator: true);
    });
  }
}