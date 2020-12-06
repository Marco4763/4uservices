import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uservices/data/models/categories.response.dart';
import 'package:uservices/data/models/favorites.response.dart';
import 'package:uservices/data/models/schedule.response.dart';
import 'package:uservices/data/service/http.service.dart';
import 'package:uservices/ui/pages/menu.page.dart';

class ScheduleController extends GetxController {
  final _state = 0.obs;
  ScheduleResponse result;
  final storage = GetStorage();
  HttpServices http = HttpServices();

  get state => this._state.value;
  set state(value) => this._state.value = value;

  void getSchedules() async {
    state = 1;
    http.initApi();
    print('ok');
    await http.get('/getSchedule?clienteId=${storage.read('id')}', headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'charset': 'utf-8'
    }).then((value) {
      state = 2;
      if (value.toString().contains('Erro')) {
        Get.snackbar('Resultado', 'Erro de autentição.',
            showProgressIndicator: true);
      } else {
        result = ScheduleResponse.fromJson(jsonDecode(value));
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