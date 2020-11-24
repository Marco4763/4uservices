import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:uservices/ui/pages/global/authentication.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Backendless.initApp(
    "0094E0EE-4920-7B0C-FF0A-5CCBB8768100",
    "2BB3DA3E-D04B-471D-B1DB-D6DD39A41047",
    "80AE15FF-E197-47DF-9639-11A1A346F74E",
  );
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
