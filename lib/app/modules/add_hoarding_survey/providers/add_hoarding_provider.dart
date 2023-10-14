import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../../../common/functions.dart';
import '../../../common/strings.dart';

class AddHoardingProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<APIResponse> saveHoarding(Map data) async {
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    String url = Strings.base_url + 'addSurveyHoarding';
    // var token = 'Bearer ' + Strings.token;
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

  Future<List<dynamic>> getHoardingTypes() async {
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;
    //
    // var token = 'Bearer ' + Strings.token;
    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'gethoardingtypes';

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
