import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;

  const LoadingWidget({Key? key, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
            ),
            height: size,
            width: size,
            child: Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(color ?? Colors.black),
              ),
            ))
        : Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
            ),
            height: size,
            width: size,
            child: const Center(
              child: CupertinoActivityIndicator(),
            ));
  }
}


