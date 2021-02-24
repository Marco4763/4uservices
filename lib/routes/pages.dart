import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:uservices/routes/routes.dart';
import 'package:uservices/ui/pages/client.login.page.dart';
import 'package:uservices/ui/pages/global/authentication.page.dart';

class Pages {
  static final allPages = [
    GetPage(name: Routes.authenticationPage, page: () => AuthenticationPage()),
    GetPage(name: Routes.clientLogin, page: () => ClientLoginPage()),
  ];
}