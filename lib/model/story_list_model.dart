import '/model/story_model.dart';

class StoryListModel {
  List<StoryModel> listStoryModelList;

  StoryListModel(this.listStoryModelList);

  factory StoryListModel.fromJson(List<dynamic> json) {
    List<StoryModel> listCity = [];

    listCity = json.map((i) => StoryModel.fromJson(i)).toList();
    return StoryListModel(listCity);
  }
}