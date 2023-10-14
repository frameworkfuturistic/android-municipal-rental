import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/app/modules/swm_survey/providers/swm_survey_provider.dart';

import '../../../common/functions.dart';

class SwmSurveyController extends GetxController {
  //TODO: Implement SwmSurveyController

  var lstSeptic = List<dynamic>.empty(growable: true).obs;
  var page = 1;
  final count = 0.obs;
  var isDataProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    getSurveyedSeptic(page);
  }

  void getSurveyedSeptic(var page) {
    try {
      isDataProcessing(true);
      SwmSurveyProvider().getSepticSurveyList(page).then((resp) {
        isDataProcessing(false);
        lstSeptic.addAll(resp);
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
