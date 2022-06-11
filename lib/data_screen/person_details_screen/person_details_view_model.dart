import 'package:flutter/material.dart';
import 'package:movie_app/data_screen/person_details_screen/person_details_repo.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../data/models/person_image_model.dart';
import '../../data/models/repository_model.dart';
import '../../providers/main_provider.dart';
import '../../utils/helpers_functions.dart';

class PersonDetailsViewModel extends ViewModel {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _hasData = false;

  bool get hasData => _hasData;


  List<PersonImageModel> personImagesList = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedImageIndex = 0;



  @override
  init() {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    getPersonImages(personId: mainProvider.selectedPersonModel!.id!);
  }


  getPersonImages({required int personId}) async {
    _isLoading = true;
    _hasData = false;
    notifyListeners();
    RepositoryModel repositoryModel = await PersonDetailsRepository().getPersonImages(personId);


    if (repositoryModel.success) {
      personImagesList = repositoryModel.data;

      debugPrint("popularPeopleList $personImagesList");

      _isLoading = false;
      _hasData = true;
    }else if (repositoryModel.stateCode == 502){
      showSnackBar(scaffoldKey, "Check Internet Connection");
    }
    _isLoading = false;
    notifyListeners();
  }



  changeSelectedImageIndex(int index) {
    selectedImageIndex = index;
    notifyListeners();
  }




}
