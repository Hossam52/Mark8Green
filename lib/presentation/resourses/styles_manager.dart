import 'package:driver_app/presentation/resourses/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color);
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s16, Color color = Colors.black}) {
  return _getTextStyle(
      fontSize.sp, FontConstants.fontFamily, FontWeightManager.regular, color);
}

// light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12, Color color = Colors.black}) {
  return _getTextStyle(
      fontSize.sp, FontConstants.fontFamily, FontWeightManager.light, color);
}

// Bold style
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, Color color = Colors.black}) {
  return _getTextStyle(
      fontSize.sp, FontConstants.fontFamily, FontWeightManager.bold, color);
}

// Semi Bold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, Color color = Colors.black}) {
  return _getTextStyle(
      fontSize.sp, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

// Medium style
TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, Color color = Colors.black}) {
  return _getTextStyle(
      fontSize.sp, FontConstants.fontFamily, FontWeightManager.medium, color);
}
