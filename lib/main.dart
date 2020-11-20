import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uservices/ui/pages/authentication.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* await GetStorage.init();*/
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
