import 'package:get/get.dart';

import '../../../common/functions.dart';
import '../../../common/strings.dart';

class SwmSurveyProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = 'YOUR-API-URL';
  }

  //Get
  Future<List<dynamic>> getSepticSurveyList(page) async {
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'getSurveySeptic';

    final response = await get(
        '$url',
        headers: <String, String> {
          'Authorization': token,
          'API-KEY': apiKey,
        });

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['data'];
    }
  }

}
