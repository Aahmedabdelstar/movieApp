import 'package:flutter/cupertino.dart';

import '../../resource/end_points_manager.dart';
import '../../resource/strings_manager.dart';
import '../models/api_response.dart';
import '../models/repository_model.dart';
import '../models/user_model.dart';
import '../shared_preferences.dart';
import '../web_services.dart';

class Repository {
  Repository._internal();
  static final Repository _singleton =  Repository._internal();

  factory Repository() {
    return _singleton;
  }




  Future<RepositoryModel> getUserData() async {
    try {
      int userId = await getInteger(AppStrings.userIdKey, 0);
      ApiResponse response = await WebService.callApi(
          '${EndPointsStrings.toysCategoriesEndPoint}/$userId',
          apiMethodType: ApiMethodType.get);
      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.body);
        return RepositoryModel(
          success: true,
          data: userModel,
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
