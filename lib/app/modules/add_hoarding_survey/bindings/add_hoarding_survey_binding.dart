import 'package:get/get.dart';

import '../controllers/add_hoarding_survey_controller.dart';

class AddHoardingSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddHoardingSurveyController>(
      () => AddHoardingSurveyController(),
    );
  }
}
