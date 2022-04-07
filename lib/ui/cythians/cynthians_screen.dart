import 'dart:convert';
import 'package:cynthi/ui/paytm/paytm_scren.dart';
import 'package:cynthi/utils/context_extension.dart';

import '/model/master_class_model.dart';
import '/utils/app_text_style.dart';
import '/utils/theme_color.dart';
import '/ui/knowlwdge_hub/knowledge_view_model.dart';
import 'package:flutter_share/flutter_share.dart';
import '/ui/explore/explore_screen.dart';
import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_assets.dart';
import '/utils/dimensions.dart';
import '/utils/app_route.dart';

class CythiansScreen extends StatelessWidget {
  final KnowledgeViewModel viewModel;

  const CythiansScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.25,
                      child: const Text(
                        "Masterclass LIVE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => AppRoutes.goto(context, const ExploreScreen()),
                  child: const Text(
                    "Explore",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.s17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: const Color(0XFF08263d),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimensions.s15),
                  const Text(
                    "   Today",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: Dimensions.s15),
                  viewModel.listModel == null ||
                          viewModel.listModel!.listMasterClassModelList.isEmpty
                      ? Center(
                          child: Text(
                            "No data",
                            style: AppTextStyle.getStyle()
                                .openSansSemiBold!
                                .copyWith(color: Colors.white),
                          ),
                        )
                      : Column(
                          children: viewModel
                              .listModel!.listMasterClassModelList
                              .map((masterModel) {
                            return cythiansWidget(context, masterModel);
                          }).toList(),
                        )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget cythiansWidget(
      BuildContext context, MasterClassLiveModel masterModel) {
    List<int> res = base64.decode(base64.normalize(masterModel.facultyImage));
    String urlImage = utf8.decode(res);
    return GestureDetector(
      onTap: () async {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const AppColor.getColor().creamColor),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(urlImage), fit: BoxFit.fill
                                // image: AssetImage(Assets.sad),
                                ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            masterModel.facultyName +
                                '\n' +
                                masterModel.facultyExperties,
                            // "IAS, Ketki Sharma\nBatch 1999,\nKanpur",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${masterModel.startTime} - ${masterModel.endTime}",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 150,
                          child: Text(
                            masterModel.lactureName +
                                " (${masterModel.meetingType})",
                            // "How to prepare for\nUPSC Entrance\nexam",
                            style: const TextStyle(
                                color: Color(0XFF446481),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildPopupDialog(
                                    context, masterModel.topicCoverd),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                Constants.topicsCovered,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.info_outline,
                                size: 16,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 120,
                right: 110,
                bottom: -12 * 2,
                child: GestureDetector(
                  onTap: () {
                    print("Clicked ${masterModel.meetingType}");

                    if (masterModel.meetingType == "paid") {
                      viewModel.lactureId = masterModel.id;
                      viewModel.amount = masterModel.amount;
                      viewModel.notifyListeners();
                      AppRoutes.goto(
                          context,
                          PaytmScreen(
                            amount: masterModel.amount,
                            customerId: masterModel.id,
                            lectureId: masterModel.id,
                            studentId: viewModel.profileModel!.result.id,
                          ));
                    } else {
                      viewModel.bookNowFree();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(
                      child: Text(
                        Constants.bookNow,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "96%",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    await share();
                  },
                  child: Row(
                    children: [
                      Image.asset(Assets.share),
                      const SizedBox(width: 5),
                      const Text(
                        "Share",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  Widget _buildPopupDialog(BuildContext context, String title) {
    return AlertDialog(
      title: Text(
        'Topic Covered',
        style: AppTextStyle.getStyle()
            .openSansSemiBold!
            .copyWith(color: Colors.black, fontSize: Dimensions.s16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          textColor: const AppColor.getColor().blueLightColor,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
