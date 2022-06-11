import 'dart:io';

import 'package:flutter/material.dart';

import '../resource/color_manager.dart';



bool validateEmail(String value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}





void showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
  scaffoldKey.currentState!.showSnackBar(
    SnackBar(
      backgroundColor: ColorManager.orangeColor,
      content: Text(
        message,
        style: const TextStyle(fontSize: 16,color: Colors.black),
      ),
    ),
  );
}

double heightOfScreen(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return screenHeight;
}

double widthOfScreen(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth;
}


Widget divider({double ? marginHorizontal,  double ? marginVertical}) {
  return  Container(
    margin: EdgeInsets.symmetric(horizontal: marginHorizontal??0,vertical: marginVertical??0),
    height: 0.1,
    color: ColorManager.greyColorDark2,
  );
}




double percentHeightAndWidthOfScreen(BuildContext context) {
  double percentHeight = MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
  return percentHeight;
}



Future<bool> isConnectedToInternet() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  } on SocketException catch (_) {
    return false;
  }
}


