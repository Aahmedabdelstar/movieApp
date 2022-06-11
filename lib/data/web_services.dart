import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/data/repository/build_error_response.dart';
import 'package:movie_app/data/repository/build_response_out.dart';
import 'package:movie_app/data/shared_preferences.dart';
import '../resource/constants_manager.dart';
import '../resource/end_points_manager.dart';
import '../resource/strings_manager.dart';
import 'models/api_response.dart';


class WebService {
  static final String _endpoint = Uri.encodeFull(EndPointsStrings.baseUrl);


  static Future<ApiResponse> callApi( String resource, {
    dynamic formData,
    Map<String, String>? header,
    required ApiMethodType apiMethodType,
    Map<String, dynamic>? queryParameters,
    int timeout= AppConstants.connectionTimeOut}) async {
    var headers;




    String language = await getString(AppStrings.languageKey, AppStrings.defaultLanguageKey);
    String token = await getString(AppStrings.tokenKey, '');

    if(token != '' ){
       headers = header ?? { AppStrings.acceptKey : 'application/json',
        AppStrings.appLangKey: language, AppStrings.authorizationKey: '${AppStrings.bearerKey} $token'};
    }else{
       headers = header ?? { AppStrings.acceptKey : 'application/json',
        AppStrings.appLangKey: language, };
    }


    queryParameters ??= {};
    queryParameters[AppStrings.appLangKey] = language;




    try {
      Dio dio = Dio(
        BaseOptions(
            baseUrl: Uri.encodeFull(_endpoint),
            connectTimeout: timeout,
            receiveTimeout: timeout,
            sendTimeout: timeout,
            headers: headers,
            queryParameters: queryParameters),
      );
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };


      late Response response ;

      if(apiMethodType == ApiMethodType.post){
        response = await dio.post(Uri.encodeFull(resource),
            data: formData, queryParameters: queryParameters);
      }else if (apiMethodType == ApiMethodType.get){
        response = await dio.get(Uri.encodeFull(resource),
            queryParameters: queryParameters);
      }

      debugPrint("URL: $resource");
      debugPrint("BODY: ${formData.toString()}");
      debugPrint("HEADER: ${headers.toString()}");
      debugPrint("RESPONSE: $response");
      return BuildResponseOut.buildResponseOut(response);
    }
    catch (_error) {
      DioError error = _error as DioError;
      debugPrint("Error BODY: ${formData.toString()}");
      debugPrint("Error HEADER: ${headers.toString()}");
      debugPrint("Error URL: $resource");
      debugPrint("Error ERROR: ${error.toString()}");
      if (error.response == null) {
        return BuildErrorResponse.buildErrorResponse(error);
      } else {
        return BuildResponseOut.buildResponseOut(error.response!);
      }
    }
  }



  static dynamic decodeResp(d) {
    const JsonDecoder decoder =  JsonDecoder();
    if (d is Response) {
      final dynamic jsonBody = d.data;
      final statusCode = d.statusCode;

      if (statusCode! < 200 || statusCode >= 300 || jsonBody == null) {
        throw Exception("statusCode: $statusCode");
      }

      if (jsonBody is String && jsonBody.isNotEmpty) {
        return decoder.convert(jsonBody);
      } else {
        return jsonBody;
      }
    } else {
      throw d;
    }
  }




}


enum ApiMethodType {
  post,
  get,
  update,
  delete
}