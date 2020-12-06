import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uservices/data/models/categories.response.dart';
import 'package:uservices/data/models/login.response.dart';
import 'package:uservices/data/models/my.services.response.dart';
import 'package:uservices/data/models/my.workers.response.dart';
import 'package:uservices/data/models/profile.response.dart';
import 'package:uservices/data/provider/provider.dart';
import 'package:uservices/data/service/http.service.dart';
import 'package:uservices/ui/pages/menu.page.dart';

class ServiceHomeController extends GetxController {
  //Ctrl => Controller
  final _state = 0.obs;
  MyServicesResponse result;
  MyWorkersResponse workers;
  GetStorage storage = GetStorage();
  HttpServices http = HttpServices();

  get state => this._state.value;
  set state(value) => this._state.value = value;

  void getServices() async {
    state = 1;
    http.initApi();
    var id = storage.read('id');
    print(id);
    await http.get('/getMyServicos?objectId=${storage.read('id')}', headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'charset': 'utf-8'
    }).then((value) {
      if (value.toString().contains('Erro')) {
        Get.snackbar('Resultado', 'Erro de autentição.',
            showProgressIndicator: true);
      } else {
        result = MyServicesResponse.fromJson(jsonDecode(value));
        storage.write('id', id);
        getWorkers(id);
      }
    }).catchError((error) {
      state = 3;
      print(error);
      Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
          showProgressIndicator: true);
    });
  }

  void getWorkers(var id) async {
    http.initApi();
    print(id);
    await http.get('/getMyWorkers?objectId=$id', headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'charset': 'utf-8'
    }).then((value) {
      state = 2;
      if (value.toString().contains('Erro')) {
        Get.snackbar('Resultado', 'Erro de autentição.',
            showProgressIndicator: true);
      } else {
        workers = MyWorkersResponse.fromJson(jsonDecode(value));
        print(workers);
      }
    }).catchError((error) {
      state = 3;
      print(error);
      Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
          showProgressIndicator: true);
    });
  }
}
