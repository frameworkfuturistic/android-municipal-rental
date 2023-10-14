import 'package:get/get.dart';

import '../modules/add_daily_toll/bindings/add_daily_toll_binding.dart';
import '../modules/add_daily_toll/views/add_daily_toll_view.dart';
import '../modules/add_hoarding_survey/bindings/add_hoarding_survey_binding.dart';
import '../modules/add_hoarding_survey/views/add_hoarding_survey_view.dart';
import '../modules/add_septic_survey/bindings/add_septic_survey_binding.dart';
import '../modules/add_septic_survey/views/add_septic_survey_view.dart';
import '../modules/add_shop_survey/bindings/add_shop_survey_binding.dart';
import '../modules/add_shop_survey/views/add_shop_survey_view.dart';
import '../modules/add_swm_survey/bindings/add_swm_survey_binding.dart';
import '../modules/add_swm_survey/views/add_swm_survey_view.dart';
import '../modules/hoarding_survey/bindings/hoarding_survey_binding.dart';
import '../modules/hoarding_survey/views/hoarding_survey_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/septic_survey/bindings/septic_survey_binding.dart';
import '../modules/septic_survey/views/septic_survey_view.dart';
import '../modules/shop_payment/bindings/shop_payment_binding.dart';
import '../modules/shop_payment/views/shop_payment_view.dart';
import '../modules/shop_payment/views/shop_payment_view.dart';
import '../modules/shop_survey/bindings/shop_survey_binding.dart';
import '../modules/shop_survey/views/shop_survey_view.dart';
import '../modules/swm_survey/bindings/swm_survey_binding.dart';
import '../modules/swm_survey/views/swm_survey_view.dart';
import '../modules/toll_payment/bindings/toll_payment_binding.dart';
import '../modules/toll_payment/views/toll_payment_view.dart';
import '../modules/toll_survey/bindings/toll_survey_binding.dart';
import '../modules/toll_survey/views/toll_survey_view.dart';
import '../modules/toll_survey/views/toll_update_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SHOP_SURVEY,
      page: () => ShopSurveyView(),
      binding: ShopSurveyBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SHOP_SURVEY,
      page: () => AddShopSurveyView(),
      binding: AddShopSurveyBinding(),
    ),
    GetPage(
      name: _Paths.HOARDING_SURVEY,
      page: () => HoardingSurveyView(),
      binding: HoardingSurveyBinding(),
    ),
    GetPage(
      name: _Paths.ADD_HOARDING_SURVEY,
      page: () => AddHoardingSurveyView(),
      binding: AddHoardingSurveyBinding(),
    ),
    GetPage(
      name: _Paths.SEPTIC_SURVEY,
      page: () => SepticSurveyView(),
      binding: SepticSurveyBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SEPTIC_SURVEY,
      page: () => AddSepticSurveyView(),
      binding: AddSepticSurveyBinding(),
    ),
    GetPage(
      name: _Paths.SHOP_PAYMENT,
      page: () => ShopPaymentView(),
      binding: ShopPaymentBinding(),
    ),
    GetPage(
      name: _Paths.TOLL_PAYMENT,
      page: () => TollPaymentView(),
      binding: TollPaymentBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DAILY_TOLL,
      page: () => const AddDailyTollView(),
      binding: AddDailyTollBinding(),
    ),
    GetPage(
      name: _Paths.TOLL_SURVEY,
      page: () => const TollSurveyView(),
      binding: TollSurveyBinding(),
    ),
    GetPage(
      name: _Paths.TOLL_UPDATE,
      page: () => const UpdateTollView(),
      binding: TollSurveyBinding(),
    ),
    GetPage(
      name: _Paths.SWM_SURVEY,
      page: () => const SwmSurveyView(),
      binding: SwmSurveyBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SWM_SURVEY,
      page: () => const AddSwmSurveyView(),
      binding: AddSwmSurveyBinding(),
    ),
  ];
}
