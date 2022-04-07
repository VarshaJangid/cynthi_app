import 'dart:convert';

LoginWithOtpModel loginWithOtpModelFromJson(String str) =>
    LoginWithOtpModel.fromJson(json.decode(str));

String loginWithOtpModelToJson(LoginWithOtpModel data) =>
    json.encode(data.toJson());

class LoginWithOtpModel {
  LoginWithOtpModel({
    this.status = '',
    this.message = '',
    this.otp = 0,
  });

  String status;
  String message;
  int otp;

  factory LoginWithOtpModel.fromJson(Map<String, dynamic> json) =>
      LoginWithOtpModel(
        status: json["status"],
        message: json["message"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "otp": otp,
      };
}
