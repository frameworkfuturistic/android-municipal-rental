import 'package:get/get.dart';

import '../controllers/toll_survey_controller.dart';

class TollSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TollSurveyController>(
      () => TollSurveyController(),
    );
  }
}
