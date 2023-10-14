import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/functions.dart';
import '../../print_receipt.dart';
import '../providers/add_daily_toll_provider.dart';

class AddDailyTollController extends GetxController {
  final GlobalKey<FormState>shopFormKey = GlobalKey<FormState>();

  late TextEditingController sairatController;
  late TextEditingController fatherController;
  late TextEditingController marketNameController;
  late TextEditingController localityController;
  late TextEditingController shopNameController;
  late TextEditingController rateController;
  late TextEditingController amountController;

  late DateTime billFrom;
  late DateTime billTo;
  late int billDays;



  void clearTextEditingControllers() {
    // circleController.clear();
    sairatController.clear();
    fatherController.clear();
    marketNameController.clear();
    localityController.clear();
    shopNameController.clear();
    rateController.clear();
    amountController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    // circleController = TextEditingController();
    sairatController = TextEditingController();
    fatherController = TextEditingController();
    marketNameController = TextEditingController();
    localityController = TextEditingController();
    shopNameController = TextEditingController();
    rateController = TextEditingController();
    amountController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

  }

  // void increment() => count.value++;

  String? validateString(String value) {
    if (value == null) {
      return "Empty String";
    }
    if (value.length == 0) {
      return "Empty String";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid String";
    }
    return null;
  }

  void validateForm() async{
    final isValid = shopFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    shopFormKey.currentState!.save();

    var result =  await AddDailyTollProvider().saveNewToll(
        {
          'VendorName': sairatController.value.text,
          'VendorFather': fatherController.value.text,
          'ShopName': marketNameController.value.text,
          'MarketName': localityController.value.text,
          'AreaName': shopNameController.value.text,
          'Rate': rateController.value.text,
        });

    if(result.error == true){
      CommonUtils.showSnackBar('Could not Save', result.errorMessage, Colors.red);
    } else {
      Get.back();
      CommonUtils.showSnackBar('Success', result.errorMessage, Colors.blue);
      Get.to(PrintReceipt(),
          transition: Transition.rightToLeft,
          duration: Duration(seconds: 1),
          arguments: [
            {'vendor_id':'2'},
            {'tran_id':'45'},
            {'from':'01/01/2022'},
            {'to':'01/05/2022'},
            {'vendor_name': 'Test Kumar Singh'},
            {'market_name': 'Daily Market'},
            {'area_name': 'Bistupur'},
            {'rate': '3.50'},
            {'amount': '624'}
          ],
          preventDuplicates: true);

      // Get.to(PrintReceipt(),
      //   transition: Transition.rightToLeft,
      //   duration: Duration(seconds: 1),
      //   arguments: ['Abhishek','abhi@email.com',98765431],
      //   preventDuplicates: true)
      // var data = Get.arguments; in the destination
    }
  }
}
