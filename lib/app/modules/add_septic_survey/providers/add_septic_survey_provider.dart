import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../../../common/functions.dart';
import '../../../common/strings.dart';

class AddSepticSurveyProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<APIResponse> saveSepticLatrine(Map data) async {
    String url = Strings.base_url + 'addSurveySeptic';
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
