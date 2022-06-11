import 'package:flutter/material.dart';

import '../../data/models/api_response.dart';
import '../../data/models/repository_model.dart';
import '../../data/models/toy_category_model.dart';
import '../../data/web_services.dart';
import '../../resource/end_points_manager.dart';


class HomeViewRepository {
  HomeViewRepository._internal();

  static final HomeViewRepository _singleton = HomeViewRepository._internal();

  factory HomeViewRepository() {
    return _singleton;
  }


  Future<RepositoryModel> getToysCategories() async {
    try {
      ApiResponse response = await WebService.callApi(
          EndPointsStrings.toysCategoriesEndPoint,
          apiMethodType: ApiMethodType.get);
      if (response.statusCode == 200) {
        debugPrint("sucess${response.body}");

        List<ToyCategoryModel> toysCategoriesList = [];
        for (var item in response.body) {
          toysCategoriesList.add(ToyCategoryModel.fromJson(item));
        }
        debugPrint("repo length ${toysCategoriesList.length}");
        return RepositoryModel(
          success: true,
          data: toysCategoriesList,
        );
      } else {
        return RepositoryModel(success: false, message: response.message!);
      }
    } catch (e) {
      return RepositoryModel(
          success: false, message: "There is en error");
    }
  }


}
