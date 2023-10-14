import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/app/modules/hoarding_survey/providers/hoarding_survey_provider.dart';

import '../../../common/functions.dart';

class HoardingSurveyController extends GetxController {
  //TODO: Implement HoardingSurveyController

  var lstHoardings = List<dynamic>.empty(growable: true).obs;
  var page = 1;
  final count = 0.obs;
  var isDataProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getSurveyedHoardings(page);
  }

  void getSurveyedHoardings(var page) {
    try {
      isDataProcessing(true);
      HoardingSurveyProvider().getHoardingSurveyList(page).then((resp) {
        isDataProcessing(false);
        lstHoardings.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isDataProcessing(false);
      CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
