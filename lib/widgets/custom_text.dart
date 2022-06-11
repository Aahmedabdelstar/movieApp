import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resource/font_manager.dart';


class CustomText extends StatefulWidget {
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? letterSpacing;
  final double? textHeight;
  final bool? underLine;
  final String? fontFamily;
  final TextAlign? align;
  final TextOverflow? textOverflow;

  const CustomText(
      {Key? key,
      this.title,
      this.color,
      this.size,
      this.fontFamily,
      this.letterSpacing,
      this.fontWeight,
      this.textHeight,
      this.maxLines,
      this.underLine,
      this.align,
      this.textOverflow,
      })
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {

    return Text(
      widget.title ?? '',
      textAlign: widget.align ??  TextAlign.start,
      maxLines: widget.maxLines,
      overflow: widget.textOverflow ?? TextOverflow.ellipsis,
      textScaleFactor: 1.0,
      style: TextStyle(
        letterSpacing: widget.letterSpacing ?? 0,
        height: widget.textHeight??1.8,
        fontFamily: widget.fontFamily ?? FontConstants.fontFamily ,
        decoration: widget.underLine != null ?
        TextDecoration.underline : TextDecoration.none,
        fontSize: widget.size ?? 16,
        fontWeight: widget.fontWeight ?? FontWeight.normal,
        color: widget.color ?? Colors.black,
      ),
    );
  }
}
