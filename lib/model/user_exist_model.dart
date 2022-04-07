// To parse this JSON data, do
//
//     final userExistModel = userExistModelFromJson(jsonString);

import 'dart:convert';

UserExistModel userExistModelFromJson(String str) => UserExistModel.fromJson(json.decode(str));

String userExistModelToJson(UserExistModel data) => json.encode(data.toJson());

class UserExistModel {
  UserExistModel({
    this.status = '',
    this.loginType = '',
  });

  String status;
  String loginType;

  factory UserExistModel.fromJson(Map<String, dynamic> json) => UserExistModel(
    status: json["status"],
    loginType: json["login_type"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "login_type": loginType,
  };
}
