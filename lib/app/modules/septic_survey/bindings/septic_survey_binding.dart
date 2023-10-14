import 'package:get/get.dart';

import '../controllers/septic_survey_controller.dart';

class SepticSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SepticSurveyController>(
      () => SepticSurveyController(),
    );
  }
}
