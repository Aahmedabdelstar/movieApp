import 'package:flutter/material.dart';

import '../data_screen/home_page_screen/home_view.dart';
import '../data_screen/person_details_screen/person_details_view.dart';
import '../data_screen/splashScreen/splash_screen.dart';

class Routes {

  static var routes = <String, WidgetBuilder>{
    "/": (ctx) => const SplashScreen(),
    HomePageView.routeName: (ctx) =>  const HomePageView(),
    PersonDetailsView.routeName: (ctx) =>  const PersonDetailsView(),
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




