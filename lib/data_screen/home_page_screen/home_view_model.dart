import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';
import '../../data/models/repository_model.dart';
import '../../utils/helpers_functions.dart';
import 'home_view_rep.dart';


class HomeViewModel extends ViewModel {


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasData = false;
  bool get hasData => _hasData;




  // List<ToyCategoryModel> homePageCategories = [];
  bool searchResult = false;
  bool newToysAdded = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  init() {
    getExploreToysData();
  }






  getExploreToysData() async {
    _isLoading = true;
    _hasData = false;
    notifyListeners();
    RepositoryModel repositoryModel = await HomeViewRepository().getToysCategories();
    if (repositoryModel.success) {
      // homePageCategories = repositoryModel.data;
      _isLoading = false;
      _hasData = true;
    }else{
      showSnackBar(scaffoldKey, "Check Internet Connection");
    }
    _isLoading = false;
    notifyListeners();
  }


  setToyFavourite(){

  }

  callApiAnotherTime(){
    _hasData = false;
  }

  refreshToys(){
    _hasData = false;
    getExploreToysData();
  }





}
