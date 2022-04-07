import 'dart:convert';
import '../../utils/app_route.dart';
import '/ui/story/story_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:story_view/story_view.dart';

class StoryViewScreen extends StatelessWidget {
  const StoryViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoryViewModel>.reactive(
      viewModelBuilder: () => StoryViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
            body: viewModel.modelList == null ||
                    viewModel.modelList!.listStoryModelList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : storyWidget(viewModel, context));
      },
    );
  }

  Widget storyWidget(StoryViewModel viewModel, BuildContext context) =>
      StoryView(
        storyItems: viewModel.modelList!.listStoryModelList.map((e) {
          String foo = e.story.split('.')[0];
          List<int> res = base64.decode(base64.normalize(foo));
          String urlImage = utf8.decode(res);
          List<String> tmpList = urlImage.split('.');
          String fileType = tmpList[tmpList.length - 1];
          return fileType != "mp4"
              ? StoryItem.inlineImage(
                  url: urlImage,
                  controller: viewModel.storyController,
                  caption: Text(
                    e.name,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        backgroundColor: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                )
              : StoryItem.pageVideo(
                  urlImage,
                  controller: viewModel.storyController,
                  caption: e.name,
                );
        }).toList(),
        controller: viewModel.storyController,
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
          AppRoutes.dismiss(context);
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
      );
}
