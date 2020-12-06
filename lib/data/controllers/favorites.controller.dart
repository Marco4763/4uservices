import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uservices/data/models/categories.response.dart';
import 'package:uservices/data/models/favorites.response.dart';
import 'package:uservices/data/models/login.response.dart';
import 'package:uservices/data/models/profile.response.dart';
import 'package:uservices/data/provider/provider.dart';
import 'package:uservices/data/service/http.service.dart';
import 'package:uservices/ui/pages/menu.page.dart';

class FavoritesController extends GetxController {
  //Ctrl => Controller
  final hour = ''.obs;
  final _date = ''.obs;
  final workerId = ''.obs;
  final _state = 0.obs;
  FavoritesResponse result;
  final storage = GetStorage();
  HttpServices http = HttpServices();

  get state => this._state.value;
  set state(value) => this._state.value = value;

  get date => this._date.value;
  set date(value) => this._date.value = value;

  void getFavorites() async {
    state = 1;
    http.initApi();
    print('ok');
    await http.get('/getFavoritos?usuarioId=${storage.read('id')}', headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'charset': 'utf-8'
    }).then((value) {
      state = 2;
      if (value.toString().contains('Erro')) {
        Get.snackbar('Resultado', 'Erro de autentição.',
            showProgressIndicator: true);
      } else {
        result = FavoritesResponse.fromJson(jsonDecode(value));
        print(result);
      }
    }).catchError((error) {
      state = 3;
      print(error);
      Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
          showProgressIndicator: true);
    });
  }

  void setScchedule(var title, var price) async{
    var params = {
      "data": date,
      "hora": hour.value,
      "titulo": title,
      "funcionario": [
        {"objectId": workerId.value}
      ],
      "preco": price,
      "clienteId": storage.read('id')
    };

    print(params);

    await http.post('/createSchedule', params,
        headers: {'Content-Type': 'application/json'}).then((value) {
      Get.back();
      if (value.toString().contains('Erro')) {
        Get.snackbar('Resultado', 'Falha durante o processo, tente novamente.',
            showProgressIndicator: true);
      } else {
        Get.snackbar('Resultado', 'Serviço agendado, verifique o estado na sua agenda.',
            showProgressIndicator: true);
      }
    }).catchError((error) {
      print(error);
      Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
          showProgressIndicator: true);
    });
  }
}
