

import 'package:flutter/material.dart';

import '../../data/models/api_response.dart';
import '../../data/models/person_image_model.dart';
import '../../data/models/repository_model.dart';
import '../../data/web_services.dart';
import '../../resource/strings_manager.dart';

class PersonDetailsRepository {
  PersonDetailsRepository._internal();

  static final PersonDetailsRepository _singleton = PersonDetailsRepository._internal();

  factory PersonDetailsRepository() {
    return _singleton;
  }





  Future<RepositoryModel> getPersonImages(int personId) async {
    try {
      ApiResponse response = await WebService.callApi(
          'person/$personId/images',
          apiMethodType: ApiMethodType.get,
          queryParameters: {
            AppStrings.apiKey: AppStrings.apiKeyValue,
          }
      );
      if (response.statusCode == 200) {
        List<PersonImageModel> personImagesList = [];

        debugPrint("response.body ${response.body}");


        for (var item in response.body) {
          personImagesList.add(PersonImageModel.fromJson(item));
        }
        return RepositoryModel(
          success: true,
          data: personImagesList,
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