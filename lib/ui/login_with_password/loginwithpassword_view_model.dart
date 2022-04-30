// import 'package:country_code_picker/country_code.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/ui/dashboard/dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/model/login_pass_model.dart';
import '/utils/app_methods.dart';
import '/utils/app_route.dart';
import 'dart:convert';

class LoginWithPassViewModel extends BaseViewModel {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginPassModel loginPassModel = LoginPassModel();
  String otpSet = "";

  init(BuildContext context) async {
    mobileNumber.addListener(() => notifyListeners());
    password.addListener(() => notifyListeners());
  }

  bool _showPassword = false;

  bool get showPassword => _showPassword;

  //show Password
  void togglePassVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  validation(BuildContext context) {
    if (mobileNumber.text.isEmpty || password.text.isEmpty) {
      flutterToast("Enter Mobile Number/Password", Colors.redAccent);
    } else {
      loginWithPassword(context);
    }
  }

  String countryCode = "+91";

  // void onCountryChange(CountryCode countryCode) {
  //   // this.countryCode = countryCode.toString();
  //   // notifyListeners();
  //   // print("New Country selected: " + countryCode.toString());
  // }

  // Login With Password
  loginWithPassword(BuildContext context) async {
    print("Number is ----- ${countryCode + mobileNumber.text}");
    Map<String, String> params = {
      'mobile':  mobileNumber.text,
      'password': password.text,
      'source_id': '1',
    };
    try {
      showLoadingDialog(context);
      final response = await http.post(
          Uri.parse("https://api.cynthians.com/index.php/api/studentlogin"),
          body: params);
      if (response.statusCode == 200) {
        loginPassModel = LoginPassModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        AppRoutes.dismiss(context);
        if (loginPassModel.message == "Login Successfully.") {
          AppRoutes.dismiss(context);
          getAndSaveToken(context);
          flutterToast(loginPassModel.message, Colors.green);
          AppRoutes.goto(context, const DashboardScreen());
        } else {
          flutterToast(loginPassModel.message, Colors.redAccent);
        }
      }
    } catch (e) {
      print("Exception in Login API $e");
    }
  }

  // Set Token on Login
  getAndSaveToken(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', loginPassModel.token);
    print("Shared Preference Token ------ ${prefs.getString("token")}");
  }
}
