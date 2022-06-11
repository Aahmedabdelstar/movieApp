import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/models/popular_person_model.dart';

class MainProvider extends ChangeNotifier {


  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _hasData = false;
  bool get hasData => _hasData;


  PopularPersonModel? selectedPersonModel;



  MainProvider() {
    getConfiguration();
  }



  changeSelectedToy({PopularPersonModel? personSelected}) {
    selectedPersonModel = personSelected;
    notifyListeners();
  }





  Future<void> getConfiguration() async {

  }







}
