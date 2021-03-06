import 'package:flutter/material.dart';
import 'package:movie_app/providers/main_provider.dart';
import 'package:movie_app/resource/routes_manager.dart';
import 'package:provider/provider.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  MovieAppState createState() => MovieAppState();
  static final navigatorKey = GlobalKey<NavigatorState>();
}

class MovieAppState extends State<MovieApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => MainProvider(),
      child: Consumer<MainProvider>(
        builder: (context, value, child) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: MovieApp.navigatorKey,
              routes: Routes.routes,
              onGenerateRoute: Routes.getRoutes,
            ),
          );
        },
      ),
    );
  }
}


