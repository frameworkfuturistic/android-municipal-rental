import 'package:get/get.dart';

import '../controllers/add_daily_toll_controller.dart';

class AddDailyTollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDailyTollController>(
      () => AddDailyTollController(),
    );
  }
}
