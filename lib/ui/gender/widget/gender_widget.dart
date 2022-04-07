import 'package:cynthi/utils/dimensions.dart';
import 'package:cynthi/utils/theme_color.dart';

import '/utils/app_text_style.dart';
import '/model/gender_model.dart';
import 'package:flutter/material.dart';

class GenderButtonWidget extends StatelessWidget {
  final GestureTapCallback callback;
  final GenderModel genderModel;

  const GenderButtonWidget({required this.callback, required this.genderModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.only(right: Dimensions.s10),
        child: Container(
          padding: const EdgeInsets.fromLTRB(
              Dimensions.s22, Dimensions.s14, Dimensions.s22, Dimensions.s14),
          decoration: BoxDecoration(
            color: const AppColor.getColor().lightYellow,
            border: Border.all(
                color: genderModel.isSelected == true
                    ? Colors.black
                    : const AppColor.getColor().lightYellow,
                width: 2),
            borderRadius: BorderRadius.circular(Dimensions.s35),
          ),
          child: Text(
            "${genderModel.title}",
            style: AppTextStyle.getStyle()
                .openSansSemiBold!
                .copyWith(color: const AppColor.getColor().black),
          ),
        ),
      ),
    );
  }
}
