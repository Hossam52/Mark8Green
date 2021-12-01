import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#007136');
  static Color primaryLight = HexColor.fromHex('#3B00E66F');
  static Color darkPrimary = HexColor.fromHex('#005BAA');
  static Color darkGrey = HexColor.fromHex('#525252');
  static Color lightGrey = HexColor.fromHex('#66000000');
  static Color grey = HexColor.fromHex('#707070');
  static Color grey1 = HexColor.fromHex('#737477');
  static Color gre2 = HexColor.fromHex('#737477');
  static Color white = HexColor.fromHex('#ffffff');
  static Color primaryOpacity70 = HexColor.fromHex('#7E007136');
  static Color error = HexColor.fromHex("#ff0000");
  static Color starColor = HexColor.fromHex('#FFC107');
  static Color buttonColor = HexColor.fromHex('#171717');
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    hexString = hexString.replaceAll('#', '');
    if (hexString.length == 6) {
      hexString = 'FF' + hexString;
    }
    return Color(int.parse(hexString, radix: 16));
  }
}
