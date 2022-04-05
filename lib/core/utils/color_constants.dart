import 'package:flutter/material.dart';

ColorConstants colorConstants = ColorConstants();

class ColorConstants {
  static Color mainColor = fromHex("#445338");

  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color transparent = Colors.transparent;
  static Color yellow = Colors.yellow;

  static Color green = fromHex("#80986C");
  static Color darkGreen = fromHex("#304322");

  static Color textFieldBorder = fromHex("#80986C");

  static Color avatarShadow = fromHex("#00000042");
  static Color avatarBackground = fromHex("#80986C");

  static Color startAdventureButtonColor = fromHex("#FFBA00");

  static Color bottomAppbarBackground = fromHex("#435C2F");
  static Color selectedTabText = fromHex("#FFBA00");
  static Color notSelectedTabText = fromHex("#304322");

  static Color suffixIconBackground = fromHex("#4E5F40");

  static Color rewardItemBackground = fromHex("#323E29");



  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
