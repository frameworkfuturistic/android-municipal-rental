import 'package:get/get.dart';

import '../../../common/functions.dart';
import '../../../common/strings.dart';
import '../shop_survey_model.dart';

class ShopSurveyProvider extends GetConnect {
  static String urlSurvey = 'http://urban.framework-futuristic.com/api/getSurveyShops';

  // static String urlSurvey = 'http://framework-futuristic.com/api/getSurveyShops';
  // static String urlAddSurvey = 'http://framework-futuristic.com/api/getSurveyShops';
  static var api_key = 'eff41ef6-d430-4887-aa55-9fcf46c72c99';
  static var token = '1|xqazMWVVAIoNBFLYPOUqTNQHCb4U7o3MbkMG4JBJ';

  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return ShopSurvey.fromJson(map);
    //   if (map is List)
    //     return map.map((item) => ShopSurvey.fromJson(item)).toList();
    // };
    // httpClient.baseUrl = Strings.base_url;
  }

  Future<List<dynamic>> getLocationArea() async {
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'getshopcirclemarket';

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

  Future<List<dynamic>> getShopList(circleName, marketName) async {
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'getshopdetails';

    var queryParameters = {
      'Circle': circleName,
      'Market': marketName,
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

  Future<List<dynamic>> getShopReceipt(shopID) async {
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'getshopbyid/' + shopID.toString();

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
      Get.snackbar("Exception", "exception");
      return <dynamic>[];
      // only executed if error is of type Exception
    } catch (error) {
      Get.snackbar("test", "message");
      return <dynamic>[];
      // executed for errors of all types other than Exception
    }
  }

//Get
  // Future<List<dynamic>> getShopSurveyList(page) async {
  //   // var token = 'Bearer ' + Strings.token;
  //   String token = await CommonUtils.getToken();
  //   token = 'Bearer ' + token;
  //
  //   var apiKey = Strings.api_key;
  //   String url = Strings.base_url + 'getSurveyShops';
  //
  //   final response = await get(
  //       '$url',
  //       headers: <String, String> {
  //         'Authorization': token,
  //         'API-KEY': apiKey,
  //       });
  //
  //   if (response.status.hasError) {
  //     return Future.error(response.statusText!);
  //   } else {
  //     return response.body['data'];
  //   }
  // }
  //
  //
  // Future<ShopSurvey?> getShopSurvey(int id) async {
  //   final response = await get('shopsurvey/$id',
  //       headers: <String, String> {
  //         'Authorization': 'Bearer $Strings.token',
  //         'API-KEY': '$Strings.api_key',
  //       });
  //   return response.body['data'];
  // }
  //
  // Future<Response<ShopSurvey>> postShopSurvey(ShopSurvey shopsurvey) async {
  //   try {
  //     final response = await post('shopsurvey', shopsurvey,
  //         headers: <String, String> {
  //           'Authorization': 'Bearer $Strings.token',
  //           'API-KEY': '$Strings.api_key',
  //         });
  //     if (response.status.hasError) {
  //       return Future.error(response.statusText!);
  //     } else {
  //       return response.body['data'];
  //     }
  //   } catch (exception) {
  //     return Future.error(exception.toString());
  //   }
  // }
  //
  //
  // Future<String> saveSurvey(Map data) async {
  //   try {
  //     final response = await post('shopsurvey', data,
  //         headers: <String, String> {
  //           'Authorization': 'Bearer $Strings.token',
  //           'API-KEY': '$Strings.api_key',
  //         });
  //     if (response.status.hasError) {
  //       return Future.error(response.statusText!);
  //     } else {
  //       return response.body['data'];
  //     }
  //   } catch (exception) {
  //     return Future.error(exception.toString());
  //   }
  //
  // }
  //
  //
  //
  // Future<Response> deleteShopSurvey(int id) async =>
  //     await delete('shopsurvey/$id');
}
