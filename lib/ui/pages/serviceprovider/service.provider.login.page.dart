import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uservices/data/controllers/service.login.controller.dart';
import 'package:uservices/ui/pages/serviceprovider/service.provider.register.page.dart';

class ServiceProviderLoginPage extends StatefulWidget {
  @override
  _ServiceProviderLoginPageState createState() =>
      _ServiceProviderLoginPageState();
}

class _ServiceProviderLoginPageState extends State<ServiceProviderLoginPage> {
  final login = Get.put(ServiceLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/images/background.jpg",
              ),
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black12,
                  Colors.black54,
                ],
              ),
            ),
            padding: EdgeInsets.all(
              16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    margin: EdgeInsets.only(
                      top: (MediaQuery.of(context).padding.top),
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.deepOrange,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Image(
                        width: 140,
                        height: 140,
                        image: AssetImage(
                          "assets/images/logo.png",
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: Get.width,
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        height: 46.0,
                        padding: EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          controller: login.emailCtrl,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                          ),
                          style: TextStyle(
                            fontFamily: "SemiBold",
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: Get.width,
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        height: 46.0,
                        padding: EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          controller: login.passwordCtrl,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                          ),
                          style: TextStyle(
                            fontFamily: "SemiBold",
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Obx(() => Container(
                        width: Get.width,
                        margin: EdgeInsets.only(top: 10, bottom: 8),
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: FlatButton(
                          child: login.sending == false ?
                          Text(
                            "Aceder Conta",
                            style: TextStyle(
                              fontFamily: "SemiBold",
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          )
                              :
                          CircularProgressIndicator(),
                          onPressed: () {
                            login.login();
                          },
                        ),
                      ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Já possui conta?",
                              style: TextStyle(
                                fontFamily: "SemiBold",
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(ServiceProviderRegisterPage());
                              },
                              child: Text(
                                " Registrar Conta!",
                                style: TextStyle(
                                  fontFamily: "SemiBold",
                                  fontSize: 14.0,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Recuperar Senha?",
                              style: TextStyle(
                                fontFamily: "SemiBold",
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
