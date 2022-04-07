import '/ui/reset_password/reset_pass_view_model.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '/ui/component/background_widget.dart';
import '/utils/context_extension.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';
import '/utils/app_methods.dart';
import '/utils/theme_color.dart';
import '/utils/dimensions.dart';
import '/utils/app_route.dart';
import 'dart:async';

class ResetOtpScreen extends StatefulWidget {
  const ResetOtpScreen({required this.viewModel});

  final ResetPassViewModel viewModel;

  @override
  _ResetOtpScreen createState() => _ResetOtpScreen();
}

class _ResetOtpScreen extends State<ResetOtpScreen> {
  Timer? _timer;
  int startTimer = 60;

  void startTime() {
    if (_timer != null) {
      _timer!.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        setState(() {
          if (startTimer < 1) {
            timer.cancel();
          } else {
            startTimer = startTimer - 1;
            print("start $startTimer");
          }
        });
      });
    }
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const AppColor.getColor().creamColor,
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            widget.viewModel.otpVerify(context);
          },
          backgroundColor: Colors.grey,
          child: const Icon(Icons.arrow_forward_ios),
        ),
        body: BackgroundWidget(
          child: SizedBox(
            height: context.getScreenHeight(aspectRatio: 1),
            width: context.getScreenWidth(aspectRatio: 1),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                  Dimensions.s20, 0, Dimensions.s30, Dimensions.s20),
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
                    Constants.verifyYourNumber,
                    style: AppTextStyle.getStyle().openSansSemiBold!.copyWith(
                        fontSize: Dimensions.s22,
                        color: const AppColor.getColor().black),
                  ),
                  const SizedBox(height: Dimensions.s80),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Dimensions.s20, right: Dimensions.s110),
                    child: PinCodeTextField(
                      autoFocus: true,
                      enablePinAutofill: true,
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: const AppColor.getColor().grey,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: true,
                      textStyle: TextStyle(
                        color: const AppColor.getColor().grey,
                        fontWeight: FontWeight.bold,
                      ),
                      obscuringCharacter: 'X',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "Enter OTP";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: Dimensions.s35,
                        fieldWidth: Dimensions.s35,
                        activeFillColor: const AppColor.getColor().white,
                        activeColor: const AppColor.getColor().white,
                        selectedColor: const AppColor.getColor().white,
                        inactiveColor: const AppColor.getColor().white,
                        inactiveFillColor: const AppColor.getColor().white,
                        selectedFillColor: const AppColor.getColor().white,
                      ),
                      controller: widget.viewModel.otpController,
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
                  const SizedBox(height: Dimensions.s100),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Dimensions.s10, right: Dimensions.s10),
                    child: Row(
                      children: [
                        Text(
                          Constants.otpShouldArrive + '$startTimer' + "s.",
                          style: AppTextStyle.getStyle()
                              .openSansRegular!
                              .copyWith(color: const AppColor.getColor().black),
                        ),
                        TextButton(
                          onPressed: () {
                            if (startTimer.toString() != "0") {
                              flutterToast(
                                  "Please wait ... ", Colors.redAccent);
                            } else {
                              widget.viewModel.sendOtp(context);
                            }
                          },
                          child: Text(
                            Constants.resendOTP,
                            style: AppTextStyle.getStyle()
                                .openSansBold!
                                .copyWith(
                                    color: const AppColor.getColor().black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
