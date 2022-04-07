import 'package:cynthi/utils/theme_color.dart';

import '/ui/knowlwdge_hub/knowledge_view_model.dart';
import '/ui/cythians/cynthians_screen.dart';
import '/ui/coaching/coaching_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/ui/story/story_screen.dart';
import '/utils/app_constant.dart';
import '/utils/app_assets.dart';
import '/utils/app_route.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<KnowledgeViewModel>.reactive(
      viewModelBuilder: () => KnowledgeViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return MaterialApp(
          home: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: const AppColor.getColor().creamColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                bottom: const TabBar(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  // indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3,
                  labelColor: Color(0XFF0060aa),
                  indicatorColor: Color(0XFF0060aa),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: Constants.cynthians),
                    Tab(text: Constants.coaching),
                    Tab(text: Constants.schoolCollege),
                  ],
                ),
                title: viewModel.profileModel == null
                    ? const SizedBox()
                    : Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: NetworkImage(viewModel
                                    .profileModel!.result.imagewithurl),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                viewModel.profileModel!.result.name +
                                    viewModel.profileModel!.result.middleName +
                                    viewModel.profileModel!.result.lastName,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              const Text(
                                Constants.knowledgeHub,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13),
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => AppRoutes.goto(
                                context, const StoryViewScreen()),
                            child: Container(
                              height: 45,
                              width: 45,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.redAccent, width: 2),
                                borderRadius: BorderRadius.circular(100),
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://picsum.photos/200/300"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Image.asset(
                              Assets.notification,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
              ),
              body: TabBarView(
                children: [
                  CythiansScreen(viewModel: viewModel),
                  const CoachingScreen(),
                  const Icon(Icons.directions_bike),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
