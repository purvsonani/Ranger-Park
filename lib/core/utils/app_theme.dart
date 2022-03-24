import 'package:flutter/material.dart';
import 'package:ranger_park/core/utils/color_constants.dart';

import 'fonts_constants.dart';


ThemeData appTheme = ThemeData(
  backgroundColor: ColorConstants.mainColor,
  scaffoldBackgroundColor: ColorConstants.mainColor,
  fontFamily: FONT_HWT_ARTZ,
  appBarTheme: AppBarTheme(
      color: ColorConstants.white,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: ColorConstants.white)),
  primaryTextTheme: TextTheme(bodyText2: TextStyle(color: ColorConstants.green)),
  textTheme: TextTheme(bodyText2: TextStyle(color: ColorConstants.green)),
  primaryColor: ColorConstants.mainColor,
  primaryColorDark: ColorConstants.mainColor,
  primaryColorLight: ColorConstants.mainColor,
  accentColor: ColorConstants.mainColor,
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonTheme: ButtonThemeData(buttonColor: ColorConstants.white),
);