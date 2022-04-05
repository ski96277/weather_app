import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weather_app/pref/pref_const.dart';
import 'package:weather_app/utils/static_key_word.dart';

class AppUtils {


  Future<bool?> isInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;

    }
    return false;

  }


  /// screen's height
  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  /// screen's width
  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}
