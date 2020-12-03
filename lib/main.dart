import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:uservices/data/provider/provider.dart';
import 'package:uservices/ui/pages/global/authentication.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: 'Tchingame',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.native,
      getPages: Routes.route,
      initialRoute: "$authentication",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.orange,
        scaffoldBackgroundColor: Colors.grey.shade300,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.deepOrange,
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 20.0,
              fontFamily: "SemiBold",
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

String get authentication => "authentication";

class Routes {
  static final route = [
    GetPage(
      name: "$authentication",
      page: () => AuthenticationPage(),
    )
  ];
}
