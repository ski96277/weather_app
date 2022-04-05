
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  final int _maxCharactersPerLine = 200;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print("--> ${options.method} ${options.path}");
      print("Content type: ${options.contentType}");
      print("Content data: ${options.data}");
      print("<-- END HTTP");
    }
    return super.onRequest(options,handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {


    if (kDebugMode) {
      print(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
    }
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
      (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        if (kDebugMode) {
          print(
            responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
        }
      }
    } else {
      if (kDebugMode) {
        print(response.data);
      }
    }
    if (kDebugMode) {
      print("<-- END HTTP");
    }

    return super.onResponse(response,handler);

  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print("<-- Error -->");
      print(err.error);
      print(err.response);
    }
    return super.onError(err,handler);
  }

}
