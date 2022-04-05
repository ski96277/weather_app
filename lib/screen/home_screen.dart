import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/app_utils.dart';
import 'package:weather_app/utils/text_style.dart';
import 'package:weather_app/viewModel/home_screen_vm.dart';
import 'package:weather_app/widget/loading_overlay.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenVM>(builder: (homeScreenVM) {
      return Scaffold(
        appBar: AppBar(
          title:  Text("homeScreen".tr),
        ),
        body: LoadingOverlay(
            isLoading: homeScreenVM.isLoading,
            child: homeScreenVM.weatherResponse == null
                ?  Center(
                    child: Text("noDataFound".tr),
                  )
                : SizedBox(
                    width: AppUtils.getWidth(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "currentTemp".tr+"${homeScreenVM.weatherResponse!.main!.temp} °C",
                          style: normalTextStyle5W(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "maxTemp".tr+"${homeScreenVM.weatherResponse!.main!.tempMax} °C",
                          style: normalTextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "minTemp".tr+"${homeScreenVM.weatherResponse!.main!.tempMin} °C",
                          style: normalTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  )),
      );
    });
  }
}
