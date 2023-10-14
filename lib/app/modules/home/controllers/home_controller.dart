import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_app/app/common/functions.dart';
import 'package:survey_app/app/modules/login/login_model.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var isProcessing = true.obs;
  bool isLoggedIn = false;

  @override
  void onInit() async{
    super.onInit();
  }

  Future<bool> checkLoggedIn() async{
    try{
      var mKey = await GetStorage().read('key');
      if (mKey == null){
        return false;
      }
      if( mKey.toString().trim().length > 0){
        return true;
      } else {
        return false;
      }
    } catch(ex) {
      return false;
    }
  }

  @override
  void onReady() async{
    super.onReady();
    // isProcessing(true);
    isLoggedIn = await checkLoggedIn();
    // isProcessing(false);
    // Get.off(()=>Login());
    if (isLoggedIn == false){
      Get.offNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {}
  // void increment() => count.value++;
}
