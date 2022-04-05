

import 'package:get/get.dart';
import 'package:weather_app/screen/home_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const HomeScreen(),
    ),
  ];
}
