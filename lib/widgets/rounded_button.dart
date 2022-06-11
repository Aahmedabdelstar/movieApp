import 'package:flutter/material.dart';

import '../resource/font_manager.dart';
import '../utils/helpers_functions.dart';
import 'loading_widgets.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final bool textWithIcon;
  final bool isLoading;
  final Icon? iconData;
  final Color? btnColor, borderColor;
  final double? btnTextSize;
  final Color? btnTextColor;
  final FontWeight? btnTextFontWeight;
  final double? btnWidth, borderWidth, btnHeight, btnBorderRadius;

  const RoundedButton(
      {
      Key?key,
      this.onTap,
      this.btnColor,
      this.isLoading = false,
      this.iconData,
      this.textWithIcon = false,
      this.btnBorderRadius,
      this.btnHeight,
      this.btnTextSize,
      this.btnTextColor,
      this.btnTextFontWeight,
      required this.text,
      this.borderColor,
      this.borderWidth,
      this.btnWidth}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: btnHeight ?? heightOfScreen(context) * .05,
        width: btnWidth ?? double.infinity,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: btnColor ?? Colors.transparent,
            borderRadius:
                BorderRadius.all(Radius.circular(btnBorderRadius ?? 10)),
            border: Border.all(
                width: borderWidth == null ? 1 : borderWidth!,
                color: borderColor == null ? Colors.white : borderColor!)),
        child: textWithIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconData!,
                  SizedBox(width: widthOfScreen(context) * .05),
                  isLoading
                      ? const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator())
                      : Text(text,
                          style: TextStyle(
                              color: btnTextColor ?? Colors.black,
                              fontSize: btnTextSize ?? FontSizeManager.s16,
                              fontWeight: btnTextFontWeight ?? FontWeight.bold,
                            fontFamily: FontConstants.fontFamily
                          )),
                ],
              )
            : Center(
                child: isLoading
                    ? const LoadingWidget()
                    : Text(text,
                        style: TextStyle(
                            color: btnTextColor ?? Colors.black,
                            fontSize: btnTextSize ?? FontSizeManager.s16,
                            fontWeight: btnTextFontWeight ?? FontWeight.bold,
                            fontFamily: FontConstants.fontFamily
                        )),
              ),
      ),
    );
  }
}
