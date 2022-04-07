import 'package:cynthi/utils/dimensions.dart';
import 'package:cynthi/utils/theme_color.dart';

import '/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import '/utils/context_extension.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback callback;
  final String title;

  const CustomButton({required this.callback, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getScreenWidth(aspectRatio: 1),
      height: context.getScreenHeight(aspectRatio: .08),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const AppColor.getColor().theme,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.s50))),
        onPressed: callback,
        child: Text(
          title,
          style: AppTextStyle.getStyle().openSansSemiBold,
        ),
      ),
    );
  }
}
