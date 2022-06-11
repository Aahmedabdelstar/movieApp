import 'package:flutter/material.dart';

import '../resource/constants_manager.dart';
import '../resource/font_manager.dart';
import '../resource/values_manager.dart';
import '../utils/helpers_functions.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool textWithIcon;
  final bool textWithImage;
  final bool loading;
  final Icon? iconData;
  final String? image;
  final Color? btnColor, borderColor;
  final double? btnTextSize;
  final Color? btnTextColor;
  final Gradient? gradient;
  final FontWeight? btnTextFontWeight;
  final double? btnWidth, borderWidth, btnHeight, btnBorderRadius;

  const CustomButton(
      {Key? key,
      required this.onTap,
      this.btnColor,
      this.loading = false,
      this.iconData,
      this.textWithIcon = false,
      this.textWithImage = false,
      this.btnBorderRadius,
      this.btnHeight,
      this.btnTextSize,
      this.btnTextColor,
      this.image,
      this.gradient,
      this.btnTextFontWeight,
      required this.text,
      this.borderColor,
      this.borderWidth,
      this.btnWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: btnHeight ??
            heightOfScreen(context) * AppConstants.heightButtonStandardPercentage,
        width: btnWidth ?? double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: gradient != null
            ? BoxDecoration(
                gradient: gradient,
                borderRadius:
                    BorderRadius.all(Radius.circular(btnBorderRadius ?? 50)),
                border: Border.all(
                    width: borderWidth == null ? 1 : borderWidth!,
                    color: borderColor == null ? Colors.white : borderColor!))
            : BoxDecoration(
                color: btnColor ?? Colors.transparent,
                borderRadius:
                    BorderRadius.all(Radius.circular(btnBorderRadius ?? 50)),
                border: Border.all(
                    width: borderWidth == null ? 1 : borderWidth!,
                    color: borderColor == null
                        ? Colors.transparent
                        : borderColor!)),
        child: textWithIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconData!,
                  SizedBox(width: widthOfScreen(context) * .05),
                  loading
                      ? const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator())
                      : Text(text,
                          style: TextStyle(
                              color: btnTextColor ?? Colors.black,
                              fontSize: btnTextSize ?? FontSizeManager.s14,
                              fontWeight:
                                  btnTextFontWeight ?? FontWeight.normal)),
                ],
              )
            : textWithImage
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(image!, height: AppSize.s20),
                      SizedBox(width: widthOfScreen(context) * .05),
                      loading
                          ? const SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator())
                          : Text(text,
                              style: TextStyle(
                                  color: btnTextColor ?? Colors.black,
                                  fontSize: btnTextSize ?? FontSizeManager.s14,
                                  fontWeight:
                                      btnTextFontWeight ?? FontWeight.normal)),
                    ],
                  )
                : Center(
                    child: loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(text,
                            style: TextStyle(
                                color: btnTextColor ?? Colors.black,
                                fontSize: btnTextSize ?? AppConstants.buttonTextSize,
                                fontWeight: btnTextFontWeight ?? FontWeight.bold,
                              fontFamily: FontConstants.fontFamily
                            )),
                  ),
      ),
    );
  }
}
