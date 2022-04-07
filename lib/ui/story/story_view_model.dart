import 'package:cynthi/model/story_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:story_view/story_view.dart';

class StoryViewModel extends BaseViewModel {
  StoryListModel? modelList;
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  init(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () => storyAPI(context));
  }

  storyAPI(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse("https://codevweb.com/demo/api/story"),
      );

      if (response.statusCode == 200) {
        print("Response is ---- ${response.body}");
        final res = jsonDecode(response.body);
        modelList = StoryListModel.fromJson(res);
        print("Model List Data ----- ${modelList!.listStoryModelList.length}");
        notifyListeners();
      }
    } catch (e) {
      Exception("Exception in checkUserExist API --- $e");
    }
  }
}