import 'package:get/get.dart';

import '../controllers/add_shop_survey_controller.dart';

class AddShopSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddShopSurveyController>(
      () => AddShopSurveyController(),
    );
  }
}
