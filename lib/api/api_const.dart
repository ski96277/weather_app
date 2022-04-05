import 'package:weather_app/utils/static_key_word.dart';

class ApiConst {
  static String baseUrl = "https://api.openweathermap.org/";

// static String weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=23.8103&lon=90.4125&appid=ffc95e0d98b87e8eb03351fd3a200213"
  static String weatherUrl = baseUrl + "data/2.5/weather?lat=#lat#&lon=#lon#&appid=${StaticKeyWord.weatherAppID}&units=Metric";
}
