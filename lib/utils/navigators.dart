import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void pushNewScreen(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
    // CupertinoPageRoute(builder: (context) => widget),
  );
}

void pushNamedRoute(BuildContext context, String route,{arguments}) {
  Navigator.of(context).pushNamed(route,arguments: arguments);
}

void pushReplacementNamedRoute(BuildContext context, String route,{arguments}) {
  Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
}

void navigateAndDeleteAllBackStacks(String route, BuildContext context,{arguments}) {
  SchedulerBinding.instance.addPostFrameCallback((_) async {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false, arguments: arguments);
  });
}

void popRoute(BuildContext context) {
  Navigator.of(context).pop();
}


