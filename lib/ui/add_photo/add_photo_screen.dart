import '/ui/register/mobile_view_model.dart';
import '/ui/component/custom_button.dart';
import 'package:flutter/material.dart';
import '/utils/app_text_style.dart';
import '/utils/app_constant.dart';
import '/utils/theme_color.dart';
import '/utils/app_methods.dart';
import '/utils/dimensions.dart';
import 'dart:io';

class AddPhotoScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String password;
  final DateTime datePicked;
  final String gender;
  final String mobile;
  final MobileViewModel viewModel;

  const AddPhotoScreen(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.password,
      required this.datePicked,
      required this.gender,
      required this.mobile,
      required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(Dimensions.s20, 0, Dimensions.s20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              viewModel.currentIndex = 4;
              viewModel.notifyListeners();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: Dimensions.s30,
              color: const AppColor.getColor().black,
            ),
          ),
          Center(
            child: Text(
              Constants.addPhotoOfYou,
              style: AppTextStyle.getStyle().openSansSemiBold!.copyWith(
                  fontSize: Dimensions.s22,
                  color: const AppColor.getColor().black),
            ),
          ),
          const SizedBox(height: Dimensions.s20),
          Center(
            child: Container(
              height: Dimensions.s120,
              width: Dimensions.s120,
              padding: const EdgeInsets.all(Dimensions.s10),
              decoration: BoxDecoration(
                color: const AppColor.getColor().white,
                borderRadius: BorderRadius.circular(Dimensions.s100),
                border: Border.all(
                    width: 2, color: const AppColor.getColor().black),
                image: DecorationImage(
                  image: FileImage(
                    File(viewModel.imageFile!.path),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: Dimensions.s50),
          CustomButton(
            callback: () => viewModel.getFromCamera(),
            title: Constants.takePhoto.toUpperCase(),
          ),
          const SizedBox(height: Dimensions.s20),
          CustomButton(
            callback: () => viewModel.getFromGallery(),
            title: Constants.chooseFromCameraRoll.toUpperCase(),
          ),
          const SizedBox(height: Dimensions.s30),
          Text(
            Constants.enterYourLocation,
            style: AppTextStyle.getStyle().openSansSemiBold!.copyWith(
                color: const AppColor.getColor().black,
                fontSize: Dimensions.s22),
          ),
          const SizedBox(height: Dimensions.s20),
          TextField(
            cursorColor: const AppColor.getColor().black,
            controller: viewModel.locationController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: Dimensions.s10),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: const AppColor.getColor().black)),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: const AppColor.getColor().black),
                ),
                hintText: Constants.enterLocation,
                hintStyle: AppTextStyle.getStyle()
                    .openSansSemiBold!
                    .copyWith(color: const AppColor.getColor().black)),
          ),
          const SizedBox(height: Dimensions.s30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color(0XFF828687),
                    padding: const EdgeInsets.fromLTRB(Dimensions.s30,
                        Dimensions.s12, Dimensions.s30, Dimensions.s12)),
                onPressed: () {
                  if (viewModel.imageFile!.path.isEmpty) {
                    flutterToast(Constants.imageRequired, Colors.redAccent);
                  } else if (viewModel.locationController.text.isEmpty) {
                    flutterToast(Constants.locationRequired, Colors.redAccent);
                  } else {
                    Future.delayed(const Duration(milliseconds: 500),
                        () => viewModel.registerUser(context));
                  }
                },
                child: Text(Constants.create.toUpperCase()),
              )
            ],
          )
        ],
      ),
    );
  }
}
