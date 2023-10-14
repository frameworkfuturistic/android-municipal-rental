import 'package:get/get.dart';

import '../../../common/functions.dart';
import '../../../common/strings.dart';
import '../../hoarding_survey/hoarding_survey_model.dart';

class HoardingSurveyProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return HoardingSurvey.fromJson(map);
    //   if (map is List)
    //     return map.map((item) => HoardingSurvey.fromJson(item)).toList();
    // };
    // httpClient.baseUrl = 'YOUR-API-URL';
  }

  //Get
  Future<List<dynamic>> getHoardingSurveyList(page) async {
    // var token = 'Bearer ' + Strings.token;
    String token = await CommonUtils.getToken();
    token = 'Bearer ' + token;

    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'getSurveyHoarding';

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

  Future<HoardingSurvey?> getHoardingSurvey(int id) async {
    final response = await get('hoardingsurvey/$id');
    return response.body;
  }

  Future<Response<HoardingSurvey>> postHoardingSurvey(
          HoardingSurvey hoardingsurvey) async =>
      await post('hoardingsurvey', hoardingsurvey);
  Future<Response> deleteHoardingSurvey(int id) async =>
      await delete('hoardingsurvey/$id');
}
