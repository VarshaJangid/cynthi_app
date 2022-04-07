import 'package:flutter/material.dart';

// convenience
AppColor appColors() => const AppColor.getColor();

class AppColor {
  final Color primaryInactive;
  final Color primaryInactiveLight;
  final Color warning;
  final Color error;
  final Color buttonColor;
  final Color white;
  final Color dateButtonColor;
  final Color pinkColor;
  final Color lightBlue;
  final Color blueLightColor;
  final Color grey;
  final Color lightYellow;
  final Color greenSuccess;
  final Color darkThemeColor;
  final Color chatListColor;
  final Color profileColor;
  final Color creamColor;
  final Color black;
  final Color theme;
  final Color orange;

  const AppColor({
    required this.warning,
    required this.error,
    required this.primaryInactive,
    required this.primaryInactiveLight,
    required this.buttonColor,
    required this.white,
    required this.dateButtonColor,
    required this.pinkColor,
    required this.lightBlue,
    required this.blueLightColor,
    required this.grey,
    required this.lightYellow,
    required this.greenSuccess,
    required this.darkThemeColor,
    required this.chatListColor,
    required this.profileColor,
    required this.creamColor,
    required this.black,
    required this.theme,
    required this.orange,
  });

  const AppColor.getColor()
      : primaryInactive = Colors.blueGrey,
        primaryInactiveLight = Colors.grey,
        warning = const Color(0xFFC97100),
        error = const Color(0xFFFC3D0B),
        buttonColor = const Color(0xFFfe4b51),
        white = Colors.white,
        dateButtonColor = const Color(0xFFf3edf5),
        pinkColor = const Color(0xFFcd3899),
        lightBlue = const Color(0xFF9f27e0),
        blueLightColor = const Color(0xFF9061a9),
        grey = Colors.grey,
        lightYellow = const Color(0XFFf9f0d6),
        greenSuccess = const Color(0xFF6bc259),
        darkThemeColor = const Color(0xFF510878),
        chatListColor = const Color(0xFFf3edf5),
        creamColor = const Color(0XFFf6f2e7),
        profileColor = const Color(0xFF622085),
        black = Colors.black,
        theme = const Color(0XFF08263d),
        orange = const Color(0XFFf26d1e);
}