import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/data_screen/home_page_screen/home_view.dart';
import 'package:movie_app/utils/navigators.dart';
import '../../providers/main_provider.dart';
import '../../resource/color_manager.dart';
import '../../utils/helpers_functions.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MainProvider? _helperProvider;

  bool firstTimeExecutedFunction = true;


  @override
  void initState() {
    super.initState();
    startTimer();
  }


  startTimer() async {
     Timer(const Duration(seconds: 3), nextScreen);
  }

  nextScreen() async {
    pushReplacementNamedRoute(context, HomePageView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Container(
          width: widthOfScreen(context),
          padding: EdgeInsets.only(top: heightOfScreen(context) * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Images().logoTextSplashScreen,
                width: widthOfScreen(context) * 0.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
