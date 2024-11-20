import 'package:e_commerce_app_aast/resources/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  static const TextStyle defaultStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      color: ColorManager.blackColor);

  static const TextStyle titleStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      fontFamily: 'Montserrat',
      color: ColorManager.blackColor);

  static const TextStyle descriptionStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      color: ColorManager.greyColorA8);

  static const TextStyle prevStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      color: ColorManager.greyColorC4);

  static const TextStyle nextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
      color: ColorManager.pinkColor);
}
