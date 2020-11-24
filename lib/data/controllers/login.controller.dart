import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uservices/data/models/login.response.dart';
import 'package:uservices/data/provider/provider.dart';

class LoginController extends GetxController {
  //Ctrl => Controller
  var emailCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  @override
  void onClose() {
    emailCtrl?.dispose();
    passwordCtrl?.dispose();
    super.onClose();
  }

  void login() async {
    await userService.login("${emailCtrl.text.trim().toString()}",
            "${passwordCtrl.text.trim().toString()}")
        .then((response) {
      if (response.toString().isNotEmpty) {
        print("Success Login");
      } else {
        print("Error Login");
      }
    });
  }
}
