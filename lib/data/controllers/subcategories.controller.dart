import 'dart:convert';
import 'package:get/get.dart';
import 'package:uservices/data/models/subcategories.model.dart';
import 'package:uservices/data/service/http.service.dart';

class SubcategoriesController extends GetxController {
  //Ctrl => Controller
  final _state = 0.obs;
  SubcategoriesModel result;
  HttpServices http = HttpServices();

  get state => this._state.value;
  set state(value) => this._state.value = value;

  void getSubcategories(var id) async {
    state = 1;
    http.initApi();
    print('ok');
    await http.get('/getSubcategorias?objectId=$id', headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'charset':'utf-8'
    }).then((value) {
      if (value.toString().contains('Erro')) {
      state = 4;
        Get.snackbar('Resultado', 'Erro de autentição.', showProgressIndicator: true);
      } else {
      state = 2;
        result = SubcategoriesModel.fromJson(jsonDecode(value));
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