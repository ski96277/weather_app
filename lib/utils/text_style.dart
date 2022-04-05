import 'package:flutter/material.dart';

normalTextStyle({Color color = Colors.black, double fontSize = 17}) {
  return TextStyle(color: color, fontWeight: FontWeight.w400, fontSize: fontSize);
}

normalTextStyle5W({Color color = Colors.black,double fontSIze = 17}) {
  return TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: fontSIze);
}


buttonTextStyle({double fontSize=17}) {
  return  TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: fontSize);
}