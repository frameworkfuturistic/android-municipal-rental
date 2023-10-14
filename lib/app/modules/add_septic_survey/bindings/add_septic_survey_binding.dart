import 'package:get/get.dart';

import '../controllers/add_septic_survey_controller.dart';

class AddSepticSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddSepticSurveyController>(
      () => AddSepticSurveyController(),
    );
  }
}
