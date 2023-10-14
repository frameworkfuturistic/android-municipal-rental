import 'dart:convert';

import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../../../common/functions.dart';
import '../../../common/strings.dart';

class TollSurveyProvider extends GetConnect {
  static String urlSurvey = 'http://urban.framework-futuristic.com/api/getAllShops';

  // static String urlSurvey = 'http://framework-futuristic.com/api/getSurveyShops';
  // static String urlAddSurvey = 'http://framework-futuristic.com/api/getSurveyShops';
  static var api_key = 'eff41ef6-d430-4887-aa55-9fcf46c72c99';
  static var token = '1|xqazMWVVAIoNBFLYPOUqTNQHCb4U7o3MbkMG4JBJ';

  @override
  void onInit() {
    // httpClient.baseUrl = 'YOUR-API-URL';
    httpClient.defaultContentType = "multipart/form-data";
    httpClient.timeout = Duration(seconds: 20);
  }

  //Get
  Future<List<dynamic>> getShopList(page) async {
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'getAllShops';

    try{
      final response = await get(
          '$url',
          headers: <String, String> {
            'Authorization': token,
            'API-KEY': apiKey,
          }).timeout(Duration(seconds: 20));

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body;
      }
    } on Exception catch (exception) {
      Get.snackbar("test", "message");
      return <dynamic>[];
      // only executed if error is of type Exception
    } catch (error) {
      Get.snackbar("test", "message");
      return <dynamic>[];
      // executed for errors of all types other than Exception
    }
  }

  Future<List<dynamic>> getTollList(areaName, location) async {
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'get-vendor-details';

    var queryParameters = {
      'AreaName': areaName,
      'Location': location,
    };

    try{
      final response = await get(
          '$url',
          query: queryParameters,
          headers: <String, String> {
            'Authorization': token,
            'API-KEY': apiKey,
          }).timeout(Duration(seconds: 20));

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body;
      }
    } on Exception catch (exception) {
      Get.snackbar("test", "message");
      return <dynamic>[];
      // only executed if error is of type Exception
    } catch (error) {
      Get.snackbar("test", "message");
      return <dynamic>[];
      // executed for errors of all types other than Exception
    }
  }

  Future<List<dynamic>> getTollReceipt(shopID) async {
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'get-tolls/' + shopID.toString();

    // var queryParameters = {
    //   'AreaName': areaName,
    //   'Location': location,
    // };

    try{
      final response = await get(
          '$url',
          // query: queryParameters,
          headers: <String, String> {
            'Authorization': token,
            'API-KEY': apiKey,
          }).timeout(Duration(seconds: 20));

      if (response.status.hasError) {
        Get.snackbar("Error", "No Previous Data");
        return Future.error(response.statusText!);
      } else {
        return response.body;
      }
    } on Exception catch (exception) {
      Get.snackbar("test", "message");
      return <dynamic>[];
      // only executed if error is of type Exception
    } catch (error) {
      Get.snackbar("test", "message");
      return <dynamic>[];
      // executed for errors of all types other than Exception
    }
  }

  Future<List<dynamic>> getLocationArea() async {
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'get-toll-location';

    try{
      final response = await get(
          '$url',
          headers: <String, String> {
            'Authorization': token,
            'API-KEY': apiKey,
          }).timeout(Duration(seconds: 20));

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body;
      }
    } on Exception catch (exception) {
      Get.snackbar("test", "message");
      return <dynamic>[];
      // only executed if error is of type Exception
    } catch (error) {
      Get.snackbar("test", "message");
      return <dynamic>[];
      // executed for errors of all types other than Exception
    }
  }

  Future<APIResponse> postTollPay(var shopID, Map data) async {
    String url = Strings.base_url + 'toll-payment/'+ shopID.toString();
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
            data: response.body,
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

  Future<List<dynamic>> postTollPayDiscarded(var vendorID, var paymentUpto) async {
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'toll-payment/' + vendorID.toString();

    var fieldsData = [];
    fieldsData.add({"To", paymentUpto});

    try {
      final response = await post('$url',
          json.encode(fieldsData),
          headers: <String, String> {
            'Authorization': token,
            'API-KEY': apiKey,
          }).timeout(Duration(seconds: 20));

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return response.body;
      }
    } on Exception catch (exception) {
      Get.snackbar("error", "message");
      return <dynamic>[];
    } catch (error) {
      Get.snackbar("error", "message");
      return <dynamic>[];
    }
  }

  Future<APIResponse> updateToll(Map data) async {
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

}
