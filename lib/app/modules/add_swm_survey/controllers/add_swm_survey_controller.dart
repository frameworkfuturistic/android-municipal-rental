import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSwmSurveyController extends GetxController {
  //TODO: Implement AddSwmSurveyController
  final GlobalKey<FormState>swmFormKey = GlobalKey<FormState>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
