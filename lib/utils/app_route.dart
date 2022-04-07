import '/ui/component/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppRoutes {
  static bool loaderShowing = false;
  static bool internetLoaderShowing = false;

  static void goto(context, page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  static void replace(context, page) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page));
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  static void makeFirst(context, page) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page));
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  static void dismiss(context) {
    Navigator.of(context).pop();
  }

  static void dismissTillFirst(context) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
  }

  static void dismissAlert(context) {
    Navigator.of(context).pop();
  }

  static void showLoader(context, bool flagLoading) {
    loaderShowing = true;
    print('showLoader $loaderShowing');
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext contextTemp) {
          return FullScreenLoader();
        }).catchError((error){
      print('Got error in show loader -- $error');
    });
  }

  static void dismissLoader(context) {
    print('dismissLoader $loaderShowing');
    if (loaderShowing) {
      loaderShowing = false;
      Navigator.of(context).pop(context);
    }
  }
}
