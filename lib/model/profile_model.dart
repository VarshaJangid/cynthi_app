// To parse this JSON data, do
//
//     final ProfileModel = ProfileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel ProfileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String ProfileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.status,
    required this.result,
  });

  String status;
  Result result;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    this.id = '',
    this.batch = '',
    this.institute = '',
    this.branch = '',
    this.rollNumber = '',
    this.picture = '',
    this.studClass = '',
    this.name = '',
    this.middleName = '',
    this.lastName = '',
    this.gender = '',
    this.address = '',
    this.email = '',
    this.city = '',
    this.state = '',
    this.pincode = '',
    this.contact = '',
    this.primaryContact = '',
    this.password = '',
    this.landline = '',
    this.status = '',
    this.uAd = '',
    this.uMo = '',
    this.standard = '',
    this.instituteName = '',
    this.className = '',
    this.imagewithurl = '',
  });

  String id;
  String batch;
  String institute;
  String branch;
  String rollNumber;
  String picture;
  String studClass;
  String name;
  String middleName;
  String lastName;
  String gender;
  String address;
  String email;
  String city;
  String state;
  String pincode;
  String contact;
  String primaryContact;
  dynamic password;
  String landline;
  String status;
  String uAd;
  String uMo;
  dynamic standard;
  String instituteName;
  String className;
  String imagewithurl;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        batch: json["batch"],
        institute: json["institute"],
        branch: json["branch"],
        rollNumber: json["roll_number"],
        picture: json["picture"] ?? "",
        studClass: json["stud_class"],
        name: json["name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        address: json["address"] ?? "",
        email: json["email"] ?? "",
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        contact: json["contact"],
        primaryContact: json["primary_contact"],
        password: json["password"] ?? "",
        landline: json["landline"],
        status: json["status"],
        uAd: json["u_ad"],
        uMo: json["u_mo"],
        standard: json["standard"],
        instituteName: json["institute_name"],
        className: json["class_name"],
        imagewithurl: json["imagewithurl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch": batch,
        "institute": institute,
        "branch": branch,
        "roll_number": rollNumber,
        "picture": picture,
        "stud_class": studClass,
        "name": name,
        "middle_name": middleName,
        "last_name": lastName,
        "gender": gender,
        "address": address,
        "email": email,
        "city": city,
        "state": state,
        "pincode": pincode,
        "contact": contact,
        "primary_contact": primaryContact,
        "password": password,
        "landline": landline,
        "status": status,
        "u_ad": uAd,
        "u_mo": uMo,
        "standard": standard,
        "institute_name": instituteName,
        "class_name": className,
        "imagewithurl": imagewithurl,
      };
}
