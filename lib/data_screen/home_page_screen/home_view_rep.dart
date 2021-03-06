import 'package:flutter/material.dart';

import '../../data/models/api_response.dart';
import '../../data/models/repository_model.dart';
import '../../data/models/popular_person_model.dart';
import '../../data/web_services.dart';
import '../../resource/end_points_manager.dart';
import '../../resource/strings_manager.dart';


class HomeViewRepository {
  HomeViewRepository._internal();

  static final HomeViewRepository _singleton = HomeViewRepository._internal();

  factory HomeViewRepository() {
    return _singleton;
  }


  Future<RepositoryModel> getPopularPeople() async {
    try {
      ApiResponse response = await WebService.callApi(
          EndPointsStrings.getPopularPeopleEndPoint,
          apiMethodType: ApiMethodType.get,
        queryParameters: {
          AppStrings.apiKey: AppStrings.apiKeyValue,
        }
      );
      if (response.statusCode == 200) {
        List<PopularPersonModel> popularPersonList = [];

        debugPrint("response.body ${response.body}");


        for (var item in response.body) {
          popularPersonList.add(PopularPersonModel.fromJson(item));
        }
        return RepositoryModel(
          success: true,
          data: popularPersonList,
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
