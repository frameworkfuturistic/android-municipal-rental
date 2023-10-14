import 'package:get/get.dart';

import '../controllers/swm_survey_controller.dart';

class SwmSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SwmSurveyController>(
      () => SwmSurveyController(),
    );
  }
}
