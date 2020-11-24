import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceProviderRegisterPage extends StatefulWidget {
  @override
  _ServiceProviderRegisterPageState createState() =>
      _ServiceProviderRegisterPageState();
}

class _ServiceProviderRegisterPageState extends State<ServiceProviderRegisterPage> {
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
                Container(
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "CNPJ/CPF",
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Endereço",
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
                      Container(
                        width: Get.width,
                        margin: EdgeInsets.only(top: 10, bottom: 8),
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Aceder Conta",
                            style: TextStyle(
                              fontFamily: "SemiBold",
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
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
                            child: Text(
                              " Registrar Conta!",
                              style: TextStyle(
                                fontFamily: "SemiBold",
                                fontSize: 14.0,
                                color: Colors.deepOrange,
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
