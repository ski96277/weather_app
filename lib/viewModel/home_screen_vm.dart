import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_response.dart';
import 'package:weather_app/permission/location_permission.dart';
import 'package:weather_app/pref/pref_const.dart';
import 'package:weather_app/repo/weather_repo.dart';
import 'package:weather_app/utils/app_utils.dart';
import 'package:weather_app/utils/static_key_word.dart';
import 'package:weather_app/widget/show_snackbar_message.dart';

class HomeScreenVM extends GetxController with WeatherRepo {
  Position? _position;
  late String lat;
  late String lon;
  bool isLoading = true;

  WeatherResponse? weatherResponse;

  @override
  Future<void> onInit() async {
    super.onInit();


    AppUtils().isInternetConnected().then((value) {
      if (value!) {


        determinePosition().then((value) async {

          if(value!=null){
            _position = await Geolocator.getLastKnownPosition();
            if (_position != null) {
              lat = _position!.latitude.toString();
              lon = _position!.longitude.toString();
              debugPrint("latitude = $lat, and longititude = $lon");
              getWeather(lat, lon);
            } else {
              showSnackbarMessage(msg: "latNoFound".tr);
            }
          }

        });

      } else {
        try {
          weatherResponse = WeatherResponse.fromJson(Pref.getObject(StaticKeyWord.weatherObj));
        } catch (e) {
          debugPrint("error message $e");
        }

        isLoading = false;
        update();
        showSnackbarMessage(msg: "noInternet".tr, textColors: Colors.red);
      }
    });



  }

  void getWeather(String lat, String lon) {
    getCurrentWeather(
      lat,
      lon,
      (weatherResponse) {
        this.weatherResponse = weatherResponse;
        Pref.setObject(StaticKeyWord.weatherObj, weatherResponse);
        isLoading = false;
        update();
      },
      (errorData) {
        showSnackbarMessage(msg: "$errorData");

        isLoading = false;
        update();
      },
    );
  }
}
