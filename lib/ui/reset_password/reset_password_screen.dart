import '/ui/reset_password/reset_pass_view_model.dart';
import '/ui/component/background_widget.dart';
import '/ui/component/app_text_field.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/context_extension.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';
import '/utils/theme_color.dart';
import '/utils/dimensions.dart';
import '/utils/app_route.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key, required this.viewModel})
      : super(key: key);
  final ResetPassViewModel viewModel;

  @override
  _ResetPasswordScreen createState() => _ResetPasswordScreen();
}

class _ResetPasswordScreen extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const AppColor.getColor().creamColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => AppRoutes.dismiss(context),
        ),
      ),
      body: BackgroundWidget(
        child: SizedBox(
          height: context.getScreenHeight(aspectRatio: 1),
          width: context.getScreenWidth(aspectRatio: 1),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
                Dimensions.s20, Dimensions.s10, Dimensions.s20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Constants.resetYourPassword,
                  style: AppTextStyle.getStyle().openSansBold!.copyWith(
                      fontSize: Dimensions.s25,
                      color: const AppColor.getColor().black),
                ),
                const SizedBox(height: Dimensions.s10),
                Text(
                  Constants.yourNewPassword,
                  style: AppTextStyle.getStyle().openSansRegular!.copyWith(
                      fontSize: Dimensions.s20, color: const Color(0XFF666666)),
                ),
                const SizedBox(height: Dimensions.s60),
                AppTextField(
                  obscureText: !showPassword,
                  controller: widget.viewModel.pass,
                  labelText: Constants.createPassword,
                  isIcon: true,
                  iconPressed: () => togglePassVisibility(),
                ),
                const SizedBox(height: Dimensions.s30),
                AppTextField(
                  controller: widget.viewModel.confirmPass,
                  labelText: Constants.confirmPassword,
                  isIcon: true,
                  iconPressed: () => toggleConfirmPassVisibility(),
                  obscureText: !showConfirmPassword,
                ),
                const SizedBox(height: Dimensions.s40),
                CustomButton(
                  title: Constants.resetPassword.toUpperCase(),
                  callback: () {
                    widget.viewModel.validation(
                        context, widget.viewModel.mobileNumber.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  bool get showPassword => _showPassword;

  bool get showConfirmPassword => _showConfirmPassword;

  //show Password
  void togglePassVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  //show Confirm Password
  void toggleConfirmPassVisibility() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
  }
}
