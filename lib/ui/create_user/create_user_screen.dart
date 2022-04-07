import 'dart:ui';

import '/ui/create_user/create_user_field.dart';
import '/ui/register/mobile_view_model.dart';
import '/ui/component/custom_button.dart';
import '/utils/context_extension.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';
import '/utils/theme_color.dart';
import '/utils/dimensions.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({Key? key, required this.viewModel}) : super(key: key);
  final MobileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          Dimensions.s20, 0, Dimensions.s20, Dimensions.s20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              viewModel.currentIndex = 1;
              viewModel.notifyListeners();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: Dimensions.s30,
              color: const AppColor.getColor().black,
            ),
          ),
          const SizedBox(height: Dimensions.s10),
          Text(
            Constants.cynthians,
            style: AppTextStyle.getStyle().comfortaaBold!.copyWith(
                  fontSize: Dimensions.s25,
                  color: const AppColor.getColor().black,
                ),
          ),
          const SizedBox(height: Dimensions.s8),
          Text(
            Constants.createYourAccount,
            style: AppTextStyle.getStyle().openSansSemiBold!.copyWith(
                  fontSize: Dimensions.s25,
                  color: const AppColor.getColor().black,
                ),
          ),
          const SizedBox(height: Dimensions.s15),
          Text(
            Constants.createAnAccountToGetStarted,
            style: AppTextStyle.getStyle()
                .openSansRegular!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(height: Dimensions.s35),
          Row(
            children: [
              SizedBox(
                width: context.getScreenWidth(aspectRatio: 1 / 2.4),
                child: textField(
                  context,
                  Constants.firstName,
                  viewModel.firstName,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: context.getScreenWidth(aspectRatio: 1 / 2.4),
                child: textField(
                  context,
                  Constants.lastName,
                  viewModel.lastName,
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.s20),
          CreateUserField(
            obscureText: !viewModel.showPassword,
            controller: viewModel.password,
            labelText: Constants.createPassword,
            isIcon: true,
            iconPressed: () => viewModel.togglePassVisibility(),
          ),
          const SizedBox(height: Dimensions.s20),
          CreateUserField(
            controller: viewModel.confirmPassword,
            labelText: Constants.confirmPassword,
            isIcon: true,
            iconPressed: () => viewModel.toggleConfirmPassVisibility(),
            obscureText: !viewModel.showConfirmPassword,
          ),
          const SizedBox(height: Dimensions.s20),
          CustomButton(
              title: Constants.next,
              callback: () {
                viewModel.genderScreen(context);
              }),
          Padding(
            padding: const EdgeInsets.all(Dimensions.s15),
            child: RichText(
              text: TextSpan(
                text: Constants.buCreatingAnAccount,
                style: AppTextStyle.getStyle().openSansRegular!.copyWith(
                      color: const AppColor.getColor().black,
                    ),
                children: [
                  TextSpan(
                    text: Constants.privacyPolicy,
                    style: AppTextStyle.getStyle().openSansBold!.copyWith(
                          color: const AppColor.getColor().black,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField(
    BuildContext context,
    String title,
    TextEditingController controller,
  ) =>
      SizedBox(
        width: context.getScreenWidth(aspectRatio: 1),
        height: context.getScreenHeight(aspectRatio: .08),
        child: TextField(
          controller: controller,
          cursorColor: Colors.black,
          autocorrect: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: Dimensions.s30 + 4),
            labelText: title,
            labelStyle: TextStyle(
                color: const AppColor.getColor().grey,
                fontSize: Dimensions.s14),
            filled: true,
            fillColor: const Color(0XFFf6f2e7),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.s15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.s15),
              borderSide:
                  BorderSide(color: const AppColor.getColor().black, width: 2),
            ),
          ),
        ),
      );
}
