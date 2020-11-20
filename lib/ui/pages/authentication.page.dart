import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: 200,
                        height: 200,
                        image: AssetImage(
                          "assets/images/logo.png",
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Cliente",
                      style: TextStyle(
                        fontFamily: "SemiBold",
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: Get.width,
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  height: 48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1.0, color: Colors.deepOrange),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Prestador de Serviço",
                      style: TextStyle(
                        fontFamily: "SemiBold",
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: Get.width,
                  margin: EdgeInsets.only(top: 8, bottom: (Get.height * .10)),
                  height: 48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1.0, color: Colors.white),
                  ),
                  child: FlatButton(
                    child: Text(
                      "Acesso Livre",
                      style: TextStyle(
                        fontFamily: "SemiBold",
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
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
