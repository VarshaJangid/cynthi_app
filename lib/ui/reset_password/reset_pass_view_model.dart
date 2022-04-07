import 'dart:async';

import '/model/login_with_otp_model.dart';
import '/model/user_exist_model.dart';
import '/ui/reset_password/reset_otp/reset_otp.dart';
import '/ui/reset_password/reset_password_screen.dart';
import '/ui/login_with_password/loginwithpassword_screen.dart';
import 'package:http/http.dart' as http;
import '/model/reset_pass_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_methods.dart';
import '/utils/app_route.dart';
import 'dart:convert';

class ResetPassViewModel extends BaseViewModel {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  init(BuildContext context) async {
    mobileNumber.addListener(() => notifyListeners());
    otpController.addListener(() => notifyListeners());
    pass.addListener(() => notifyListeners());
    confirmPass.addListener(() => notifyListeners());
  }

  bool _showPassword = false;

  bool get showPassword => _showPassword;

  //show Password
  void togglePassVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  validation(BuildContext context, String mobileNumber) {
    if (pass.text.isEmpty ||
        confirmPass.text.isEmpty ||
        pass.text != confirmPass.text) {
      flutterToast("Enter valid/ similar password !!", Colors.redAccent);
    } else {
      Future.delayed(const Duration(milliseconds: 600),
          () => resetPassword(context, mobileNumber));
    }
  }

  String otpSet = '';

  otpVerify(BuildContext context) {
    if (otpController.text == otpSet) {
      AppRoutes.goto(context, ResetPasswordScreen(viewModel: this));
      notifyListeners();
    } else {
      flutterToast("Wrong OTP !!!", Colors.redAccent);
    }
  }

  checkUserExist(BuildContext context, String mobileNumber) async {
    Map<String, String> params = {
      'mobile': mobileNumber,
    };
    showLoadingDialog(context);
    try {
      final response = await http.post(
          Uri.parse(
              "https://api.cynthians.com/index.php/api/check_newmobile_studlogin"),
          body: params);
      if (response.statusCode == 200) {
        UserExistModel userExistModel =
            UserExistModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        if (userExistModel.loginType == 'exist') {
          //already exist
          Future.delayed(
              const Duration(microseconds: 500), () => sendOtp(context));
          AppRoutes.dismiss(context);
          // AppRoutes.goto(context,
          //     ResetPasswordScreen(mobileNumber: mobileNumber));
        } else {
          AppRoutes.dismiss(context);
          flutterToast("Not Registered", Colors.redAccent);
        }
      }
    } catch (e) {
      Exception("Exception in checkUserExist API --- $e");
    }
  }

  sendOtp(BuildContext context) async {
    Map<String, String> params = {
      'mobile': mobileNumber.text,
    };
    try {
      showLoadingDialog(context);
      final response = await http.post(
          Uri.parse("https://api.cynthians.com/index.php/api/send_otp_mobile"),
          body: params);
      if (response.statusCode == 200) {
        LoginWithOtpModel loginWithOtpModel =
            LoginWithOtpModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        print("otp -------- ${loginWithOtpModel.otp}");
        notifyListeners();
        AppRoutes.dismiss(context);
        otpSet = "${loginWithOtpModel.otp}";
        notifyListeners();
        if (loginWithOtpModel.message == "OTP sent successfully.") {
          // Future.delayed(Duration(milliseconds: 500),()=>startTime());
          AppRoutes.goto(context, ResetOtpScreen(viewModel: this));
          flutterToast(loginWithOtpModel.message, Colors.green);
        } else {
          flutterToast(loginWithOtpModel.message, Colors.redAccent);
        }
      } else {
        throw Exception('Exception in Login With OTP API');
      }
    } catch (e) {
      Exception("Exception in loginWithOTP API ----- $e");
    }
  }

  //Reset User Password
  resetPassword(BuildContext context, String mobileNumber) async {
    Map<String, String> params = {
      'mobile': mobileNumber,
      'password': pass.text,
      'action': 'reset',
      "source_id": '1'
    };
    try {
      showLoadingDialog(context);
      final response = await http.post(
          Uri.parse(
              "https://api.cynthians.com/index.php/api/save_studentPassword"),
          body: params);
      if (response.statusCode == 200) {
        ResetPassModel resetPassModel =
            ResetPassModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        print(resetPassModel.message);
        if (resetPassModel.message == 'Reset Password Successfully') {
          flutterToast(resetPassModel.message, Colors.green);
          AppRoutes.dismiss(context);
          AppRoutes.goto(context, const LoginWithPasswordScreen());
        } else {
          flutterToast(resetPassModel.message, Colors.redAccent);
          AppRoutes.dismiss(context);
        }
      }
    } catch (e) {
      Exception("Exception is ---- $e");
    }
  }
  Timer? timer;


  @override
  void dispose() {
    otpController.dispose();
    mobileNumber.dispose();
    confirmPass.dispose();
    pass.dispose();
    super.dispose();
  }
}
