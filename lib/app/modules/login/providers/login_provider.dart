import 'package:get/get.dart';

import '../../../common/api_response.dart';
import '../../../common/strings.dart';
import '../login_model.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (map) {
    //   if (map is Map<String, dynamic>) return Login.fromJson(map);
    //   if (map is List) return map.map((item) => Login.fromJson(item)).toList();
    // };
    // httpClient.baseUrl = 'YOUR-API-URL';
  }

  // void getSurveyedSeptic(var page) {
  //   try {
  //     isDataProcessing(true);
  //     SepticSurveyProvider().getSepticSurveyList(page).then((resp) {
  //       isDataProcessing(false);
  //       lstSeptic.addAll(resp);
  //     }, onError: (err) {
  //       isDataProcessing(false);
  //       CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
  //     });
  //   } catch (exception) {
  //     isDataProcessing(false);
  //     CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
  //   }
  // }
  //

  Future<APIResponse> authenticate(Map data) async {
    var apiKey = Strings.api_key;
    String url = Strings.base_url + 'checkLogin';

    try{
      final response = await post(
          '$url',data,
          headers: <String, String> {
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
            data: response.body['token'],
            error: false,
            errorMessage: response.statusText!
        );
      }
    } catch(ex) {
      return APIResponse(
          data: null,
          error: true,
          errorMessage: ex.toString()
      );
    }
  }

  Future<Login?> getLogin(int id) async {
    final response = await get('login/$id');
    return response.body;
  }

  Future<Response<Login>> postLogin(Login login) async =>
      await post('login', login);
  Future<Response> deleteLogin(int id) async => await delete('login/$id');
}
