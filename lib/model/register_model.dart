// // To parse this JSON data, do
// //
// //     final registerModel = registerModelFromJson(jsonString);
//
// import 'dart:convert';
//
// RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));
//
// String registerModelToJson(RegisterModel data) => json.encode(data.toJson());
//
// class RegisterModel {
//   RegisterModel({
//     this.status = '',
//     this.message = '',
//     this.token = '',
//   });
//
//   String status;
//   String message;
//   String token;
//
//   factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
//     status: json["status"],
//     message: json["message"],
//     token: json["token"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "token": token,
//   };
// }

// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.status = '',
    this.message = '',
  });

  String status;
  String message;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
