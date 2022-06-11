import 'package:flutter/material.dart';

class Routes {

  static var routes = <String, WidgetBuilder>{
    // "/": (ctx) => const SplashScreen(),
  };



  static Route<BuildContext>? getRoutes(RouteSettings settings) {
    var builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(
        settings: settings,
        builder: builder,
      );
    }
    return null;
  }

}




