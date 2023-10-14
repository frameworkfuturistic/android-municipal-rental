import 'package:get/get.dart';

import '../controllers/shop_payment_controller.dart';

class ShopPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopPaymentController>(
      () => ShopPaymentController(),
    );
  }
}
