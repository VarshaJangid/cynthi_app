import 'package:percent_indicator/linear_percent_indicator.dart';
import '/ui/component/background_widget.dart';
import '/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '/utils/theme_color.dart';
import 'mobile_view_model.dart';
import '/utils/dimensions.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MobileViewModel>.reactive(
      viewModelBuilder: () => MobileViewModel(),
      onModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton:
                viewModel.currentIndex == 2 || viewModel.currentIndex == 4
                    ? FloatingActionButton(
                        elevation: 0,
                        onPressed: () {
                          viewModel.currentIndex == 2
                              ? viewModel.otpVerify(context)
                              : viewModel.genderToNextScreen();
                        },
                        backgroundColor: Colors.grey,
                        child: const Icon(Icons.arrow_forward_ios),
                      )
                    : Container(),
            backgroundColor: const AppColor.getColor().creamColor,
            body: BackgroundWidget(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: context.getScreenHeight(aspectRatio: 1),
                  width: context.getScreenWidth(aspectRatio: 1),
                  child: Column(
                    children: [
                      const SizedBox(height: Dimensions.s10),
                      LinearPercentIndicator(
                        padding: const EdgeInsets.all(00),
                        width: MediaQuery.of(context).size.width,
                        lineHeight: 5,
                        percent: viewModel.getCompletionPercentage(),
                        progressColor: const Color(0XFF08263d),
                      ),
                      const SizedBox(height: Dimensions.s20),
                      viewModel.registerFlow(),
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
