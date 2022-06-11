import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/api_response.dart';
import '../web_services.dart';

class BuildResponseOut{


  static ApiResponse buildResponseOut(Response response1) {
    ApiResponse apiResponse = ApiResponse();
    print("response1 $response1");
    var response = WebService.decodeResp(response1);
    if (response1.statusCode == 200) {
      if(response['error'] != null){
        print("error");
        apiResponse.statusCode = 199;  //password incorrect
        apiResponse.status = false;
        apiResponse.message = response['error'];
        apiResponse.body = response['error'];
      }else{

        apiResponse.statusCode = 200;
        apiResponse.status = response['code'] ?? true;
        apiResponse.message = response['message'] ?? '';
        apiResponse.body = response['data'];

      }
    } else if (response.statusCode == 401) {
      debugPrint("Un Authenticated");
      // navigateAndDeleteAllBackStacks(LoginScreen.routeName, context);
    } else if (response.statusCode == 422 || response.statusCode == 404) {
      if (response.data is Map<String, dynamic>) {
        Map<String, dynamic> responseBody = response.data;
        apiResponse.statusCode = 422;
        apiResponse.status = response.data['status'];
        apiResponse.message = responseBody['data'] == null
            ? response.data["message"]
            : responseBody['data'].containsKey('errors')
            ? responseBody['data']['errors']
            : response.data["message"];
      } else {
        apiResponse.statusCode = response.statusCode;
        apiResponse.message = response.data.toString();
      }
    } else if (response.statusCode == 400) {
      if (response.data is Map<String, dynamic>) {
        apiResponse.statusCode = 400;
        apiResponse.status = response.data['status'];
        apiResponse.message = response.data['message'];
        apiResponse.body = response.data['results']['errors'];
      } else {
        apiResponse.statusCode = response.statusCode;
        apiResponse.message = response.data.toString();
      }
    } else if (response.statusCode == 500) {
      if (response.data is Map<String, dynamic>) {
        Map<String, dynamic> responseBody = response.data;
        apiResponse.statusCode = 500;
        apiResponse.status = response.data['status'];
        apiResponse.message = responseBody['data'] == null
            ? response.data["message"]
            : responseBody['data'].containsKey('errors')
            ? responseBody['data']['errors']
            : response.data["message"];
      } else {
        apiResponse.statusCode = response.statusCode;
        apiResponse.message = response.data.toString();
      }
    } else {
      apiResponse.statusCode = response.statusCode;
      apiResponse.message = "there is an error";
    }
    return apiResponse;
  }


}