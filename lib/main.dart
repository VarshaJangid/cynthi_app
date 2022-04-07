import '/utils/app_constant.dart';
import '/ui/component/dismiss_keyboard.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '/utils/theme_color.dart';
import '/ui/splash/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: const AppColor.getColor().theme,
      statusBarColor: const AppColor.getColor().theme,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        title: Constants.cynthians,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
