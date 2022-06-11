import 'package:flutter/material.dart';

import '../resource/color_manager.dart';
import '../resource/constants_manager.dart';
import '../resource/font_manager.dart';
import '../utils/helpers_functions.dart';
import 'custom_text.dart';

class RoundedButtonMaleFemale extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final bool? genderSelected;

  const RoundedButtonMaleFemale(
      {Key? key, this.onTap, this.title, this.genderSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heightOfScreen(context) *
            AppConstants.heightButtonStandardPercentage,
        width: widthOfScreen(context) * 0.4,
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.greyColorBorder),
            borderRadius: BorderRadius.circular(40),
            color: genderSelected!
                ? ColorManager.primaryColor
                : ColorManager.whiteColor),
        child: Center(
          child: CustomText(
              title: title,
              size: FontSizeManager.s16,
              color: genderSelected! ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
