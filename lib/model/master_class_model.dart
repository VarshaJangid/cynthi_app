// To parse this JSON data, do
//
//     final masterClassLiveModel = masterClassLiveModelFromJson(jsonString);

import 'dart:convert';

List<MasterClassLiveModel> masterClassLiveModelFromJson(String str) =>
    List<MasterClassLiveModel>.from(
        json.decode(str).map((x) => MasterClassLiveModel.fromJson(x)));

String masterClassLiveModelToJson(List<MasterClassLiveModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MasterClassLiveModel {
  MasterClassLiveModel({
    this.id = '',
    this.facultyName = '',
    this.facultyExperties = '',
    this.facultyExperience = '',
    this.facultyImage = '',
    this.startTime = '',
    this.endTime = '',
    this.meetingType = '',
    this.amount = '',
    this.lactureName = '',
    this.topicCoverd = '',
  });

  String id;
  String facultyName;
  String facultyExperties;
  String facultyExperience;
  String facultyImage;
  String startTime;
  String endTime;
  String meetingType;
  String amount;
  String lactureName;
  String topicCoverd;

  factory MasterClassLiveModel.fromJson(Map<String, dynamic> json) =>
      MasterClassLiveModel(
        id: json["id"],
        facultyName: json["faculty_name"],
        facultyExperties: json["faculty_experties"],
        facultyExperience: json["faculty_experience"],
        facultyImage: json["faculty_image"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        meetingType: json["meeting_type"],
        amount: json["amount"],
        lactureName: json["lacture_name"],
        topicCoverd: json["topic_coverd"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "faculty_name": facultyName,
        "faculty_experties": facultyExperties,
        "faculty_experience": facultyExperience,
        "faculty_image": facultyImage,
        "start_time": startTime,
        "end_time": endTime,
        "meeting_type": meetingType,
        "amount": amount,
        "lacture_name": lactureName,
        "topic_coverd": topicCoverd,
      };
}
