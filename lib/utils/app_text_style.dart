import 'package:flutter/material.dart';
import '/utils/theme_color.dart';
import '/utils/dimensions.dart';

@immutable
class AppTextStyle {
  static const TextDecoration underline = TextDecoration.underline;
  static const TextDecoration lineThrough = TextDecoration.lineThrough;

  static const String _openSansBold = "OpenSans-Bold";
  static const String _openSansBoldItalic = "OpenSans-BoldItalic";
  static const String _openSansExtraBold = "OpenSans-ExtraBold";
  static const String _openSansExtraBoldItalic = "OpenSans-ExtraBoldItalic";
  static const String _openSansItalic = "OpenSans-Italic";
  static const String _openSansLightItalic = "OpenSans-LightItalic";
  static const String _openSansRegular = "OpenSans-Regular";
  static const String _openSansSemibold = "OpenSans-Semibold";
  static const String _openSansSemiboldItalic = "OpenSans-SemiboldItalic";
  static const String _comfortaaBold = "Comfortaa-Bold";

  final TextStyle? openSansBold;
  final TextStyle? openSansSemiBold;
  final TextStyle? openSansRegular;
  final TextStyle? openSansExtraBold;
  final TextStyle? comfortaaBold;

  AppTextStyle({
    this.openSansBold,
    this.openSansSemiBold,
    this.openSansRegular,
    this.openSansExtraBold,
    this.comfortaaBold,
  });

  AppTextStyle.getStyle()
      : comfortaaBold = TextStyle(
          fontFamily: _comfortaaBold,
          fontSize: Dimensions.s25,
          color: const AppColor.getColor().white,
          fontWeight: FontWeight.bold,
          inherit: true,
        ),
        openSansBold = TextStyle(
          fontFamily: _openSansBold,
          fontSize: Dimensions.s15,
          color: const AppColor.getColor().white,
          inherit: true,
        ),
        openSansRegular = TextStyle(
          fontFamily: _openSansRegular,
          fontSize: Dimensions.s15,
          color: const AppColor.getColor().white,
          inherit: true,
        ),
        openSansExtraBold = TextStyle(
          fontFamily: _openSansExtraBold,
          fontSize: Dimensions.s15,
          color: const AppColor.getColor().white,
          inherit: true,
        ),
        openSansSemiBold = TextStyle(
          fontSize: Dimensions.s15,
          fontFamily: _openSansSemibold,
          color: const AppColor.getColor().white,
          inherit: false,
        );
}
