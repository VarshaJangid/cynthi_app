import '/ui/reset_password/reset_mobile/reset_mobile.dart';
import '/ui/component/background_widget.dart';
import '/ui/component/login_text_field.dart';
import '/ui/component/app_text_field.dart';
import 'loginwithpassword_view_model.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/context_extension.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';
import '/utils/theme_color.dart';
import '/utils/dimensions.dart';
import '/utils/app_route.dart';

class LoginWithPasswordScreen extends StatelessWidget {
  const LoginWithPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginWithPassViewModel>.reactive(
      viewModelBuilder: () => LoginWithPassViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: const AppColor.getColor().creamColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => AppRoutes.dismiss(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: const AppColor.getColor().black,
              ),
            ),
          ),
          body: BackgroundWidget(
            child: SizedBox(
              height: context.getScreenHeight(aspectRatio: 1),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                    Dimensions.s30, Dimensions.s10, Dimensions.s30, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Constants.cynthians,
                      style: AppTextStyle.getStyle().comfortaaBold!.copyWith(
                            fontSize: Dimensions.s25,
                            color: const AppColor.getColor().black,
                          ),
                    ),
                    const SizedBox(height: Dimensions.s15),
                    Text(
                      Constants.logBack,
                      style: AppTextStyle.getStyle().openSansSemiBold!.copyWith(
                          fontSize: Dimensions.s25,
                          color: const AppColor.getColor().black),
                    ),
                    const SizedBox(height: Dimensions.s15),
                    Text(
                      Constants.youAreAlreadyRegistered,
                      style: AppTextStyle.getStyle().openSansRegular!.copyWith(
                          fontSize: Dimensions.s20,
                          color: const AppColor.getColor().grey),
                    ),
                    const SizedBox(height: Dimensions.s10),
                    Text(
                      Constants.logBackInToContinue,
                      style: AppTextStyle.getStyle().openSansRegular!.copyWith(
                          fontSize: Dimensions.s20,
                          color: const AppColor.getColor().grey),
                    ),
                    const SizedBox(height: Dimensions.s40),
                    LoginTextField(
                      controller: viewModel.mobileNumber,
                      changedCountry: viewModel.onCountryChange,
                    ),
                    const SizedBox(height: Dimensions.s25),
                    AppTextField(
                      obscureText: !viewModel.showPassword,
                      labelText: Constants.enterPassword,
                      isIcon: true,
                      controller: viewModel.password,
                      iconPressed: () => viewModel.togglePassVisibility(),
                    ),
                    const SizedBox(height: Dimensions.s10),
                    GestureDetector(
                      onTap: () =>
                          AppRoutes.goto(context, const ResetMobileScreen()),
                      child: Text(
                        Constants.forgotYourPassword,
                        style: AppTextStyle.getStyle()
                            .openSansSemiBold!
                            .copyWith(
                                color: const AppColor.getColor().grey,
                                fontSize: Dimensions.s15),
                      ),
                    ),
                    const SizedBox(height: Dimensions.s30),
                    CustomButton(
                      title: Constants.Continue,
                      callback: () => viewModel.validation(context),
                    ),
                    const SizedBox(height: Dimensions.s20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                          Dimensions.s15, 0, Dimensions.s15, 0),
                      child: RichText(
                        text: TextSpan(
                          text: Constants.buCreatingAnAccount,
                          style: AppTextStyle.getStyle()
                              .openSansRegular!
                              .copyWith(color: const AppColor.getColor().black),
                          children: [
                            TextSpan(
                              text: Constants.privacyPolicy,
                              style: AppTextStyle.getStyle()
                                  .openSansBold!
                                  .copyWith(
                                    color: const AppColor.getColor().black,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
