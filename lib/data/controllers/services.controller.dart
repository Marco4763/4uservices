import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uservices/data/models/services.response.dart';
import 'package:uservices/data/service/http.service.dart';

class ServicesController extends GetxController {
  //Ctrl => Controller
  final _state = 0.obs;
  ServicesResponse result;
  final storage = GetStorage();
  HttpServices http = HttpServices();
  final _sending = false.obs;

  get sending => this._sending.value;
  set sending(value) => this._sending.value = value;

  get state => this._state.value;
  set state(value) => this._state.value = value;

  void getServices(var id) async {
    state = 1;
    http.initApi();
    print('ok');
    await http.get('/getServicos?objectId=$id', headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'charset': 'utf-8'
    }).then((value) {
      if (value.toString().contains('Erro')) {
        state = 4;
        Get.snackbar('Resultado', 'Erro de autentição.',
            showProgressIndicator: true);
      } else {
        state = 2;
        result = ServicesResponse.fromJson(jsonDecode(value));
        print(result);
      }
    }).catchError((error) {
      state = 3;
      print(error);
      Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
          showProgressIndicator: true);
    });
  }

  void addFavorite(var objectId) async {
    http.initApi();
    print('ok');
    var result;
    var params = {
      "usuarioId": storage.read('id'),
      "servicoId": [
        {"objectId": objectId}
      ]
    };
    print(params);
    sending = true;
    await http.post('/createFavorito', params,
        headers: {'Content-Type': 'application/json'}).then((value) {
      sending = false;
      if (value.toString().contains('Erro')) {
        Get.snackbar('Resultado', 'Erro de autentição.',
            showProgressIndicator: true);
      } else {
        Get.back();
        result = value;
        print(result);
        Get.snackbar('Resultado', 'Adicionado aos favoritos com sucesso.',
            showProgressIndicator: true);
      }
    }).catchError((error) {
      print(error);
      Get.snackbar('Resultado', 'Erro de conexão, verifique a internet.',
          showProgressIndicator: true);
      sending = false;
    });
  }
}
