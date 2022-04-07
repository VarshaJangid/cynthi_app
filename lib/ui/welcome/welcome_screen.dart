import '/ui/dashboard/dashboard_screen.dart';
import '/ui/component/custom_button.dart';
import '/utils/context_extension.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';
import '/utils/theme_color.dart';
import '/utils/dimensions.dart';
import '/utils/app_route.dart';
import 'dart:io';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key, required this.name, required this.imageFile})
      : super(key: key);
  final String name;
  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const AppColor.getColor().creamColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Text(""),
      ),
      body: Container(
        padding: const EdgeInsets.all(Dimensions.s25),
        width: context.getScreenWidth(aspectRatio: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Dimensions.s120,
              width: Dimensions.s120,
              padding: const EdgeInsets.all(Dimensions.s10),
              decoration: BoxDecoration(
                color: const AppColor.getColor().white,
                borderRadius: BorderRadius.circular(Dimensions.s100),
                image: DecorationImage(
                  image: FileImage(
                    File(imageFile.path),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: Dimensions.s30),
            Text(
              Constants.welcomeAbroad + "\n$name!",
              style: AppTextStyle.getStyle().openSansSemiBold!.copyWith(
                  color: const AppColor.getColor().black,
                  fontSize: Dimensions.s22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimensions.s20),
            Text(
              Constants.weAreHappyToHaveYou,
              style: AppTextStyle.getStyle().openSansSemiBold!.copyWith(
                  color: const AppColor.getColor().black, fontSize: 17),
            ),
            const Spacer(),
            CustomButton(
              callback: () => AppRoutes.goto(context, const DashboardScreen()),
              title: Constants.begin,
            ),
            const SizedBox(height: Dimensions.s50),
          ],
        ),
      ),
    );
  }
}
