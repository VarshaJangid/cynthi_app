import 'dart:convert';

import '/ui/onboarding_screens/onboarding.dart';

import '/ui/login_with_password/loginwithpassword_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_route.dart';
import 'loading.dart';
import 'dart:io';

flutterToast(String message, Color color) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

final loadingDialog = WillPopScope(
    onWillPop: () async {
      return true;
    },
    child: Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)), //this right here
      child: SizedBox(height: 300, width: 300, child: Loading(size: 300)),
    ));

void showLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return loadingDialog;
    },
  );
}

logoutAlert(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  AppRoutes.makeFirst(context, const OnBoardingScreen());
}

// Future<String> imageToBase64(File imageFile) async{
//   String mainImageString;
//   try{
//     //Get Image from Image File
//     final bytes = await imageFile.readAsBytesSync();
//     IMG.Image image = IMG.decodeImage(bytes);
//
//     // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
//     // IMG.Image thumbnail = IMG.copyResize(image, width: 300, height: 200);
//     List<int> imageBytes = IMG.encodeJpg(image);
//     String base64Image = base64Encode(imageBytes);
//     mainImageString = '$base64Image';
//   }catch(e){
//     print('Base 64 error FullSize $e');
//   }
//   return mainImageString;
// }

Future<String> fileToBase64(File file) async{
  String? mainImageString;
  try{
    //Get Image from Image File
    final bytes = await file.readAsBytes();
    String base64Encode = base64.encode(bytes);
    mainImageString = base64Encode;
  }catch(e){
    print('Base 64 error FullSize $e');
  }
  return mainImageString!;
}

//image file to base 64

// Future<String> imageToBase64(File imageFile) async {
//   String mainImageString;
//   try {
//     //Get Image from Image File
//     final bytes = await imageFile.readAsBytesSync();
//     IMG.Image image = IMG.decodeImage(bytes);
//
//     // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
//     // IMG.Image thumbnail = IMG.copyResize(image, width: 300, height: 200);
//     List<int> imageBytes = IMG.encodeJpg(image);
//     String base64Image = base64Encode(imageBytes);
//     mainImageString = '$base64Image';
//   } catch (e) {
//     print('Base 64 error FullSize $e');
//   }
//   return mainImageString;
// }