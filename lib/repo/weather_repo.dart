import 'package:weather_app/api/api_const.dart';
import 'package:weather_app/api/api_service.dart';
import 'package:weather_app/model/weather_response.dart';

class WeatherRepo {
  final ApiService _apiService = ApiService();

  getCurrentWeather(String lat, String lon, Function(WeatherResponse weatherResponse) weatherResponse, Function(dynamic errorData) errorData) {
    _apiService.get(ApiConst.weatherUrl.replaceAll("#lat#", lat).replaceAll("#lon#", lon),
        onSuccess: (onSuccessData) => weatherResponse(WeatherResponse.fromJson(onSuccessData)), onError: (onErrorData) => errorData(onErrorData));
  }
}
