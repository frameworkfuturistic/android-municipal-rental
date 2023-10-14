import 'package:get/get.dart';

import '../controllers/add_swm_survey_controller.dart';

class AddSwmSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddSwmSurveyController>(
      () => AddSwmSurveyController(),
    );
  }
}
