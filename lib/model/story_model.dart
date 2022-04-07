import 'dart:convert';

List<StoryModel> storyModelFromJson(String str) =>
    List<StoryModel>.from(json.decode(str).map((x) {

      return StoryModel.fromJson(x);
    }));

String storyModelToJson(List<StoryModel> data) {
  print("Data -- $data");
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class StoryModel {
  StoryModel({
    this.id = '',
    this.name = '',
    this.story = '',
    this.date = '',
  });

  String id;
  String name;
  String story;
  String date;

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json["id"],
      name: json["name"],
      story: json["story"],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "story": story,
    "date": date,
  };
}