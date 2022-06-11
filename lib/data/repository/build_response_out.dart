import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/api_response.dart';
import '../web_services.dart';

class BuildResponseOut{


  static ApiResponse buildResponseOut(Response response) {
    ApiResponse apiResponse = ApiResponse();
    debugPrint("response1 ${response.data}");
    // var response = WebService.decodeResp(response1);
    if (response.statusCode == 200) {
      if(response.data['error'] != null){
        debugPrint("error after status code 200");
        apiResponse.statusCode = 199;  //password incorrect
        apiResponse.status = false;
        apiResponse.message = response.data['error'];
        apiResponse.body = response.data['error'];
      }else{
        debugPrint("result after status code 200");
        debugPrint("result after status code 2002");
        debugPrint("result after status code 2003");

        apiResponse.statusCode = 200;
        apiResponse.status = response.data['code'] ?? true;
        apiResponse.message = response.data['message'] ?? '';
        apiResponse.body = response.data['results'];

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