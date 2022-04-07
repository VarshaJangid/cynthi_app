import '/ui/component/background_widget.dart';
import '/ui/component/login_text_field.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '../reset_pass_view_model.dart';
import '/utils/context_extension.dart';
import 'package:stacked/stacked.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';
import '/utils/theme_color.dart';
import '/utils/dimensions.dart';
import '/utils/app_route.dart';

class ResetMobileScreen extends StatelessWidget {
  const ResetMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPassViewModel>.reactive(
      viewModelBuilder: () => ResetPassViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const AppColor.getColor().creamColor,
            body: BackgroundWidget(
              child: SizedBox(
                height: context.getScreenHeight(aspectRatio: 1),
                width: context.getScreenWidth(aspectRatio: 1),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(Dimensions.s20,
                      Dimensions.s30, Dimensions.s30, Dimensions.s20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => AppRoutes.dismiss(context),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: Dimensions.s30,
                          color: const AppColor.getColor().black,
                        ),
                      ),
                      const SizedBox(height: Dimensions.s15),
                      Text(
                        Constants.cynthians,
                        style: AppTextStyle.getStyle().comfortaaBold!.copyWith(
                            fontSize: Dimensions.s25,
                            color: const AppColor.getColor().black),
                      ),
                      const SizedBox(height: Dimensions.s15),
                      Text(
                        Constants.enterContactNumber,
                        style: AppTextStyle.getStyle()
                            .openSansSemiBold!
                            .copyWith(
                                fontSize: Dimensions.s22,
                                color: const AppColor.getColor().black),
                      ),
                      const SizedBox(height: Dimensions.s40),
                      LoginTextField(
                        controller: viewModel.mobileNumber,
                      ),
                      const SizedBox(height: Dimensions.s40),
                      CustomButton(
                        title: Constants.Continue,
                        callback: () {
                          viewModel.checkUserExist(
                              context, viewModel.mobileNumber.text);
                        },
                      ),
                      const SizedBox(height: Dimensions.s20),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.s10, right: Dimensions.s10),
                        child: RichText(
                          text: TextSpan(
                            text: Constants.buCreatingAnAccount,
                            style: AppTextStyle.getStyle()
                                .openSansRegular!
                                .copyWith(
                                    color: const AppColor.getColor().black),
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
          ),
        );
      },
    );
  }
}
