import 'package:get/get.dart';

import '../controllers/shop_survey_controller.dart';

class ShopSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopSurveyController>(
      () => ShopSurveyController(),
    );
  }
}
