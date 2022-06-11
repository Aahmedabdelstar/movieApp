import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../resource/constants_manager.dart';
import '../models/api_response.dart';

class BuildErrorResponse{


  static ApiResponse buildErrorResponse(DioError error) {

    if (error.error.toString() == "Connecting timed out [${AppConstants.connectionTimeOut}ms]" ) {
      return ApiResponse(
          status: false,statusCode: 502, message: "Check your internet connection"
      );
    } else if (error is TimeoutException) {
      return ApiResponse(
          statusCode: 504, message: "Request execution time reached the limit");
    } else {
      return ApiResponse(statusCode: 500, message: error.toString());
    }
  }


}