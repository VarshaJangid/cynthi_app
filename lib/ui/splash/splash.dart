import 'package:cynthi/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/ui/onboarding_screens/onboarding.dart';
import '/ui/dashboard/dashboard_screen.dart';
import '/utils/context_extension.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/theme_color.dart';
import '/utils/dimensions.dart';
import '/utils/app_assets.dart';
import '/utils/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => callScreen());
    super.initState();
  }

  callScreen() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString("token")!.isNotEmpty) {
        AppRoutes.makeFirst(context, const DashboardScreen());
      } else {
        AppRoutes.makeFirst(context, const OnBoardingScreen());
      }
    } catch (e) {
      Exception('In Exception--$e');
      AppRoutes.makeFirst(context, const OnBoardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const AppColor.getColor().theme,
        height: context.getScreenHeight(aspectRatio: 1),
        width: context.getScreenWidth(aspectRatio: 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.logo, width: Dimensions.s120),
              const SizedBox(height: Dimensions.s20),
              Text(
                Constants.cynthians,
                style: AppTextStyle.getStyle()
                    .openSansBold!
                    .copyWith(fontSize: Dimensions.s30),
              ),
              RichText(
                text: TextSpan(
                  text: Constants.appFor,
                  style: AppTextStyle.getStyle()
                      .openSansSemiBold!
                      .copyWith(fontSize: Dimensions.s22),
                  children: [
                    TextSpan(
                      text: Constants.knowledge,
                      style: AppTextStyle.getStyle().openSansSemiBold!.copyWith(
                          fontSize: Dimensions.s22,
                          color: const AppColor.getColor().orange),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
