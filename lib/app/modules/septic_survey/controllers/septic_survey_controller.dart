import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/functions.dart';
import '../providers/septic_survey_provider.dart';

class SepticSurveyController extends GetxController {
  //TODO: Implement SepticSurveyController
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
      SepticSurveyProvider().getSepticSurveyList(page).then((resp) {
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
