import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resource/color_manager.dart';
import '../resource/font_manager.dart';

class CustomTextField extends StatefulWidget {

  final String? hint;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final String? errorText;
  final Function(String?)? onSaved;
  final Function(String)? onChange;
  final Function(String?)? validator;
  final Function(String?)? onFileSubmitted;
  final bool? enabled;
  final bool? availableArabic;
  final TextInputType? type;
  final TextEditingController? controller ;
  final bool? isPhoneNumber;
  final bool? obscureText;
  final double borderRadius;
  final int? linesNumber;
  final EdgeInsetsGeometry contentPadding;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final Color? fillColor;
  // final Color? errorBorderColor;

  //  TextDirection textDirection;

  const CustomTextField({Key? key,
    this.errorText,
    this.focusedBorderColor = Colors.black,
    this.enabledBorderColor = ColorManager.greyColorBorder,
    this.type,
    this.hint,
    this.onSaved,
    this.enabled=true,
    this.validator,
    this.onChange,
    this.onFileSubmitted,
    this.availableArabic=true,
    this.controller,
    this.isPhoneNumber=false,
    this.obscureText=false,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 50,
    this.linesNumber = 1,
    this.fillColor = Colors.white,
    this.textAlign = TextAlign.left,
    this.contentPadding=const EdgeInsets.only(left: 20,right: 20),
    // this.textDirection:TextDirection.ltr,

  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomFieldsWidgetState();
}

class _CustomFieldsWidgetState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onFieldSubmitted: widget.onFileSubmitted??(v){},
      obscureText: widget.obscureText!,
      maxLines: widget.linesNumber,
      enabled: widget.enabled,
      textAlign: widget.textAlign!,
      validator: (val){
        widget.validator!(val);
      },
      onSaved: (val){
        widget.onSaved!(val);
      },
      cursorColor: Colors.black,
      keyboardType: widget.type,
      onChanged: (val){
        widget.onChange!(val);
      },
      controller: widget.controller,
      style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        fontWeight: FontWeight.normal
      ),
      autocorrect: false,
      inputFormatters: widget.availableArabic!?null:
      widget.isPhoneNumber!?
      <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ]:
      <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z-0-9@. ]")),
      ],



      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText:widget.hint,
        filled: true,
        hintStyle: const TextStyle(color: ColorManager.greyColorDark2,fontFamily: FontConstants.fontFamily),
        contentPadding: widget.contentPadding,
        fillColor:widget.fillColor!,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.enabledBorderColor!,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.focusedBorderColor!,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),


        focusedErrorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),


        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.enabledBorderColor!,
          ),
        ),
      ),
    );
  }
}






