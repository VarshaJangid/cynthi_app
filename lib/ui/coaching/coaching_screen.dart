import 'package:flutter/material.dart';
import '/utils/app_constant.dart';
import '/utils/app_assets.dart';

class CoachingScreen extends StatelessWidget {
  const CoachingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Column(
      children: [
        Center(
          child: Container(
            height: 72,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.fromLTRB(20, 11, 20, 11),
            margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.blue,
                  bottom: const TabBar(
                    // padding: EdgeInsets.only(left: 10, right: 10),
                    // indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    labelColor: Colors.white,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: Constants.cynthians),
                      Tab(text: Constants.coaching),
                      Tab(text: Constants.schoolCollege),
                    ],
                  ),
                ),
                // body: TabBarView(
                //   children: [
                //     Text("fghducijxklmnvfbhvdjiklm"),
                //     Text("fghducijxklmnvfbhvdjiklm"),
                //     Icon(Icons.directions_bike),
                //   ],
                // ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: const Color(0XFF08263d),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      const Text(
                        "Sort By",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  coachingWidget(),
                  coachingWidget(),
                  coachingWidget(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget coachingWidget() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 12, 0),
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0XFFeaf2f6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: 80,
                      width: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.sad),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "IAS, Ketki Sharma\nBatch 1999,\nKanpur",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "01:30 PM - 02:30 PM",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 10),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "How to prepare for\nUPSC Entrance\nexam",
                      style: TextStyle(
                          color: Color(0XFF446481),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Text(
                            Constants.startNow,
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 25),
        ],
      );
}
