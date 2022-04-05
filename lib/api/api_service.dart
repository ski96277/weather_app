import 'package:dio/dio.dart';
import 'package:weather_app/api/api_const.dart';
import 'package:weather_app/api/logging_interceptors.dart';


class ApiService {
  late Dio _dio;

  ApiService() {
    BaseOptions options = BaseOptions(baseUrl: ApiConst.baseUrl, receiveTimeout: 60000, connectTimeout: 60000);
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
  }

  Future get(
    String endpoint, {
    Function()? beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    _dio.get(endpoint).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  Future post(
    String endpoint,
    Map<String, dynamic> params, {
    Function()? beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    _dio.post(endpoint, data: params).then((res) {
      onSuccess(res.data);
    }).catchError((error) {
      onError(error);
    });
  }

  String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.other:
          errorDescription = "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription = "Received invalid status code: ${dioError.response!.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    return errorDescription;
  }
}
