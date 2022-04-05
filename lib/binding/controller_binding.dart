import 'package:get/get.dart';
import 'package:weather_app/viewModel/home_screen_vm.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {

    Get.lazyPut<HomeScreenVM>(() => HomeScreenVM(), fenix: true);
  }
}