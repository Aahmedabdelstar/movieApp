import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {


  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _hasData = false;
  bool get hasData => _hasData;



  MainProvider() {
    getConfiguration();
  }





  Future<void> getConfiguration() async {

  }







}
