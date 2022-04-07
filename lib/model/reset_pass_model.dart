// To parse this JSON data, do
//
//     final resetPassModel = resetPassModelFromJson(jsonString);

import 'dart:convert';

ResetPassModel resetPassModelFromJson(String str) => ResetPassModel.fromJson(json.decode(str));

String resetPassModelToJson(ResetPassModel data) => json.encode(data.toJson());

class ResetPassModel {
  ResetPassModel({
    this.status = '',
    this.message = '',
  });

  String status;
  String message;

  factory ResetPassModel.fromJson(Map<String, dynamic> json) => ResetPassModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
