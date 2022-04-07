// To parse this JSON data, do
//
//     final loginPassModel = loginPassModelFromJson(jsonString);

import 'dart:convert';

LoginPassModel loginPassModelFromJson(String str) =>
    LoginPassModel.fromJson(json.decode(str));

String loginPassModelToJson(LoginPassModel data) => json.encode(data.toJson());

class LoginPassModel {
  LoginPassModel({
    this.status = '',
    this.token = '',
    this.studentId = '',
    this.mobile = '',
    this.message = '',
  });

  String status;
  String token;
  String studentId;
  String mobile;
  String message;

  factory LoginPassModel.fromJson(Map<String, dynamic> json) => LoginPassModel(
        status: json["status"],
        message: json["message"],
        token: json["token"] ?? '',
        studentId: json["student_id"] ?? '',
        mobile: json["mobile"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "student_id": studentId,
        "mobile": mobile,
        "message": message,
      };
}
