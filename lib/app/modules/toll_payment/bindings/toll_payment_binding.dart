import 'package:get/get.dart';
import 'package:survey_app/app/modules/toll_payment/controllers/toll_payment_controller.dart';

class TollPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TollPaymentController>(
      () => TollPaymentController(),
    );
  }
}
