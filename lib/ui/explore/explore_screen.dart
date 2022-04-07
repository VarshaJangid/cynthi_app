import '/utils/app_assets.dart';
import '/utils/app_constant.dart';
import '/utils/app_text_style.dart';
import '/utils/context_extension.dart';
import '/utils/dimensions.dart';
import '/utils/theme_color.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: context.getScreenWidth(aspectRatio: 1),
          padding:
              const EdgeInsets.only(left: Dimensions.s15, top: Dimensions.s10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: Dimensions.s40,
                    width: Dimensions.s40,
                    padding: const EdgeInsets.all(Dimensions.s10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.s100),
                      image: const DecorationImage(
                        image: NetworkImage("https://picsum.photos/200/300"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimensions.s20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payal's",
                        style: TextStyle(
                            color: const AppColor.getColor().black,
                            fontSize: Dimensions.s16),
                      ),
                      Text(
                        Constants.knowledgeHub,
                        style: TextStyle(
                            color: const AppColor.getColor().black,
                            fontSize: Dimensions.s13),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 45,
                    width: 45,
                    padding: const EdgeInsets.all(Dimensions.s10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent, width: 2),
                      borderRadius: BorderRadius.circular(Dimensions.s100),
                      image: const DecorationImage(
                        image: NetworkImage("https://picsum.photos/200/300"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimensions.s10),
                  Container(
                    height: Dimensions.s40,
                    width: Dimensions.s40,
                    padding: const EdgeInsets.all(Dimensions.s10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(Dimensions.s100),
                    ),
                    child: Image.asset(
                      Assets.notification,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: Dimensions.s10),
                ],
              ),
              const SizedBox(height: Dimensions.s15),
              Container(
                height: Dimensions.s40,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: const Color(0XFFebebeb),
                    borderRadius: BorderRadius.circular(Dimensions.s15)),
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                          left: Dimensions.s40, bottom: 5, top: 5),
                      hintText: "Search your interest.",
                      hintStyle: AppTextStyle.getStyle()
                          .openSansSemiBold!
                          .copyWith(color: Colors.black54)),
                ),
              ),
              const SizedBox(height: Dimensions.s15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categories(const Color(0XFFa3d39c), "Art"),
                    categories(const Color(0XFFf5989d), "Motivation"),
                    categories(const Color(0XFFbd8cbf), "Business"),
                    categories(const Color(0XFFa3d39c), "Art"),
                    categories(const Color(0XFFf5989d), "Motivation"),
                    categories(const Color(0XFFbd8cbf), "Business"),
                  ],
                ),
              ),
              const SizedBox(height: Dimensions.s15),
              headline("Recommended for you"),
              const SizedBox(height: Dimensions.s15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    exploreWidget("Data Analytics"),
                    exploreWidget("Fashion Designing"),
                    exploreWidget("Data Analytics"),
                    exploreWidget("Fashion Designing"),
                  ],
                ),
              ),
              const SizedBox(height: Dimensions.s15),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: Dimensions.s12),
                    height: context.getScreenHeight(aspectRatio: .18),
                    width: context.getScreenWidth(aspectRatio: 1),
                    padding: const EdgeInsets.all(Dimensions.s10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimensions.s20),
                      image: const DecorationImage(
                        image: NetworkImage("https://picsum.photos/300/100"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: Dimensions.s13, left: Dimensions.s15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Guest of the month",
                              style: AppTextStyle.getStyle()
                                  .openSansBold!
                                  .copyWith(fontSize: Dimensions.s22),
                            ),
                            const SizedBox(height: Dimensions.s8),
                            Text(
                              "Ratan Tata",
                              style: AppTextStyle.getStyle()
                                  .openSansBold!
                                  .copyWith(
                                      fontSize: Dimensions.s25,
                                      color: const Color(0XFFa3d39c)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset(Assets.playShare),
                        const SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.s15),
              headline("Most Popular"),
              const SizedBox(height: Dimensions.s15),
              Row(
                children: [
                  exploreWidget(""),
                  exploreWidget(""),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headline(String text) {
    return Text(
      text,
      style: AppTextStyle.getStyle().openSansBold!.copyWith(
          color: const AppColor.getColor().black, fontSize: Dimensions.s18),
    );
  }

  Widget categories(Color color, String category) => Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          padding: const EdgeInsets.fromLTRB(
              Dimensions.s15, Dimensions.s8, Dimensions.s15, Dimensions.s8),
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(Dimensions.s10)),
          child: Text(
            category,
            style: AppTextStyle.getStyle()
                .openSansBold!
                .copyWith(fontSize: Dimensions.s16),
          ),
        ),
      );

  Widget exploreWidget(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: Dimensions.s10),
      child: Column(
        children: [
          Container(
            height: 125,
            width: 160,
            padding: const EdgeInsets.all(Dimensions.s10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.s20),
              image: const DecorationImage(
                image: NetworkImage("https://picsum.photos/200/200"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: AppTextStyle.getStyle().openSansSemiBold!.copyWith(
                color: const AppColor.getColor().black,
                fontSize: Dimensions.s16),
          )
        ],
      ),
    );
  }
}
