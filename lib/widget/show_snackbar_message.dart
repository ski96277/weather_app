import 'package:flutter/material.dart';
import 'package:weather_app/utils/app.dart';


ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbarMessage({
  String title = "",
  String msg="Data load error found, Try again later",
  backgroundColors = Colors.white,
  Color textColors = Colors.black,
}) {
  return ScaffoldMessenger.of(App.navigatorKey.currentContext!).showSnackBar(SnackBar(
    content: Text(
      msg,
      style: TextStyle(color: textColors),
    ),
    backgroundColor: backgroundColors,
  ));
}