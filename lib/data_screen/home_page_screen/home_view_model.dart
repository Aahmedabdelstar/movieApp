import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import '../../data/models/popular_person_model.dart';
import '../../data/models/repository_model.dart';
import '../../utils/helpers_functions.dart';
import 'home_view_rep.dart';


class HomeViewModel extends ViewModel {


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasData = false;
  bool get hasData => _hasData;




  List<PopularPersonModel> popularPeopleList = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  init() {
    getPopularPeople();
  }


  getPopularPeople() async {
    _isLoading = true;
    _hasData = false;
    notifyListeners();
    RepositoryModel repositoryModel = await HomeViewRepository().getPopularPeople();

    debugPrint("model ${repositoryModel.stateCode}");
    debugPrint("model ${repositoryModel.data}");

    if (repositoryModel.success) {
      popularPeopleList = repositoryModel.data;

      debugPrint("popularPeopleList $popularPeopleList");

      _isLoading = false;
      _hasData = true;
    }else if (repositoryModel.stateCode == 502){
      showSnackBar(scaffoldKey, "Check Internet Connection");
    }
    _isLoading = false;
    notifyListeners();
  }



}
