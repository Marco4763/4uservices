import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uservices/data/models/categories.response.dart';
import 'package:uservices/data/models/login.response.dart';
import 'package:uservices/data/models/my.services.response.dart';
import 'package:uservices/data/models/my.workers.response.dart';
import 'package:uservices/data/models/profile.response.dart';
import 'package:uservices/data/models/service.workers.response.dart';
import 'package:uservices/data/provider/provider.dart';
import 'package:uservices/data/service/http.service.dart';
import 'package:uservices/ui/pages/menu.page.dart';

class ServiceWorkersController extends GetxController {
  final _state = 0.obs;
  ServiceWorkersResponse workers;
  final storage = GetStorage();
  final workerId = ''.obs;
  HttpServices http = HttpServices();

  get state => this._state.value;
  set state(value) => this._state.value = value;

  void getMyWorkers() async{
    print('ok');
    state = 1;
    http.initApi();
    await http.get('/getMyWorkers?objectId=${storage.read('id')}', headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'charset': 'utf-8'
    }).then((value) {
      state = 2;
      if (value.toString().contains('Erro')) {
        Get.snackbar('Resultado', 'Erro de autentição.',
            showProgressIndicator: true);
      } else {
        workers = ServiceWorkersResponse.fromJson(jsonDecode(value));
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
