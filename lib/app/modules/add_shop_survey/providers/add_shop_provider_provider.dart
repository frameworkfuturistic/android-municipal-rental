import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:survey_app/app/common/api_response.dart';

import '../../../common/functions.dart';
import '../../../common/strings.dart';

class AddShopProviderProvider extends GetConnect {
  // static String urlSurvey = 'http://urban.framework-futuristic.com/api/addSurveyShop';

  @override
  void onInit() {
    //httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<APIResponse> saveSurvey(Map data) async {
    String url = Strings.base_url + 'addSurveyShop';
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    try {
      final response = await post(url, data,
          headers: <String, String> {
            'Authorization': token,
            'API-KEY': apiKey,
          });
      if (response.status.hasError) {
        return APIResponse(
            data: null,
            error: true,
            errorMessage: response.statusText!
        );
      } else {
        return APIResponse(
            data: response.body['data'],
            error: false,
            errorMessage: response.statusText!
        );
      }
    } catch (exception) {
      return APIResponse(
          data: null,
          error: true,
          errorMessage: exception.toString()
      );
    }
  }

  Future<List<dynamic>> getCircles() async {
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'getCircleList';

    final response = await get(
        '$url',
        headers: <String, String> {
          'Authorization': token,
          'API-KEY': apiKey,
        });

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['data'] ;
    }
  }

  Future<List<dynamic>> getBuildingTypes() async {
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'getBuildingType';

    final response = await get(
        '$url',
        headers: <String, String> {
          'Authorization': token,
          'API-KEY': apiKey,
        });

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['data'] ;
    }
  }

}
