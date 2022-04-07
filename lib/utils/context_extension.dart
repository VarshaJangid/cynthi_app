import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext {
  double getScreenWidth({double aspectRatio = 1}) =>
      MediaQuery.of(this).size.width * aspectRatio;

  double getScreenHeight({double aspectRatio = 1}) =>
      MediaQuery.of(this).size.height * aspectRatio;
}
