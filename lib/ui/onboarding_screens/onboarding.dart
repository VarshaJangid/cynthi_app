import '/ui/login_with_password/loginwithpassword_screen.dart';
import '/ui/register/register_screen.dart';
import '/utils/context_extension.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';
import '/utils/theme_color.dart';
import '/utils/app_assets.dart';
import '/utils/dimensions.dart';
import '/utils/app_route.dart';
import 'dart:async';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPage < 3) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  List<Map<String, String>> onBoardingData = [
    {
      "image": Assets.logo,
      "onBoarding": Assets.onboarding,
      "title": Constants.cynthians,
      "welcomeText": Constants.welcomeText,
    },
    {
      "image": Assets.logo,
      "onBoarding": Assets.onboarding,
      "title": Constants.cynthians,
      "welcomeText": Constants.welcomeText,
    },
    {
      "image": Assets.logo,
      "onBoarding": Assets.learning,
      "title": Constants.cynthians,
      "welcomeText": "All in one learning\nplatform for all ages.",
    },
    {
      "image": Assets.logo,
      "onBoarding": Assets.growth,
      "title": Constants.cynthians,
      "welcomeText": "Your partner\n for overall growth.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: const AppColor.getColor().theme,
        padding: const EdgeInsets.only(
            top: Dimensions.s25,
            left: Dimensions.s20,
            right: Dimensions.s20,
            bottom: Dimensions.s20),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(Assets.logo,
                width: Dimensions.s100,
                height: Dimensions.s100,
                fit: BoxFit.fill),
            const SizedBox(height: Dimensions.s30),
            Text(
              Constants.cynthians,
              style: AppTextStyle.getStyle()
                  .comfortaaBold!
                  .copyWith(fontSize: Dimensions.s30),
            ),
            const SizedBox(height: Dimensions.s30),
            SizedBox(
              height: size.height * 0.38,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) => Content(
                  size: size,
                  image: onBoardingData[index]["image"]!,
                  onBoarding: onBoardingData[index]["onBoarding"]!,
                  welcomeText: onBoardingData[index]["welcomeText"]!,
                  title: onBoardingData[index]["title"]!,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onBoardingData.length,
                (index) => Container(
                  margin: const EdgeInsets.only(right: Dimensions.s15),
                  height:
                      currentPage == index ? Dimensions.s20 : Dimensions.s13,
                  width: currentPage == index ? Dimensions.s20 : Dimensions.s13,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const AppColor.getColor().black),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(Dimensions.s10)),
                  ),
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => AppRoutes.goto(context, const RegisterScreen()),
              child: Container(
                width: context.getScreenWidth(),
                color: Colors.white,
                height: Dimensions.s50,
                child: Center(
                  child: Text(
                    Constants.letsGetStarted,
                    style: AppTextStyle.getStyle().openSansBold!.copyWith(
                        color: const AppColor.getColor().theme,
                        fontSize: Dimensions.s12),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Constants.alreadyHaveAccount,
                  style: AppTextStyle.getStyle()
                      .openSansRegular!
                      .copyWith(fontSize: Dimensions.s13),
                ),
                TextButton(
                  onPressed: () =>
                      AppRoutes.goto(context, const LoginWithPasswordScreen()),
                  child: Text(
                    Constants.login,
                    style: AppTextStyle.getStyle().openSansBold!.copyWith(
                        decoration: AppTextStyle.underline,
                        fontSize: Dimensions.s14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    required this.size,
    this.welcomeText = '',
    this.image = '',
    this.title = '',
    this.onBoarding = '',
  });

  final Size size;
  final String welcomeText, image, title, onBoarding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFF08263d),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Image.asset(onBoarding, width: 120, height: 120, fit: BoxFit.fill),
          const SizedBox(height: 20),
          Text(
            welcomeText,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          Text(
            Constants.placeToLearn,
            textAlign: TextAlign.center,
            style: AppTextStyle.getStyle()
                .openSansSemiBold!
                .copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
