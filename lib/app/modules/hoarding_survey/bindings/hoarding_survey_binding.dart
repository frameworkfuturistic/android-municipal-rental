import 'package:get/get.dart';

import '../controllers/hoarding_survey_controller.dart';

class HoardingSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HoardingSurveyController>(
      () => HoardingSurveyController(),
    );
  }
}
