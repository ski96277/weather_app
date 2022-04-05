import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/permission/location_permission.dart';
import 'package:weather_app/routes/app_pages.dart';
import 'package:weather_app/routes/app_routes.dart';
import 'package:weather_app/utils/app.dart';
import 'package:weather_app/utils/text_const.dart';
import 'binding/controller_binding.dart';


Future<void> main()  async {

  await GetStorage.init();
  runApp(DevicePreview(
      enabled: false,
      builder: (context) {
        return MyApp();
      }));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // determinePosition();

    return  GetMaterialApp(
      navigatorKey: App.navigatorKey,
      translations: TextConst(),
      locale: const Locale('en', 'US'),
      initialBinding: ControllerBinding(),
      title: 'Flutter Demo',
      initialRoute: AppRoutes.SPLASH,
      // initialRoute: AppRoutes.DASHBOARD,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
    );
  }
}
