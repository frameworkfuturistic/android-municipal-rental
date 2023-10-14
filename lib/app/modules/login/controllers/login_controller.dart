import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_app/app/modules/home/views/home_view.dart';
import 'package:survey_app/app/modules/login/providers/login_provider.dart';
import 'package:survey_app/app/routes/app_pages.dart';

import '../../../common/functions.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final GlobalKey<FormState>loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<bool> login() async{
    try{
      if(emailController.value.text.trim().length == 0){
        CommonUtils.showSnackBar('Invalid Email', 'Please Enter Valid Email', Colors.red);
        return false;
      }
      if (!GetUtils.isEmail(emailController.value.text.trim())){
        CommonUtils.showSnackBar('Invalid Email', 'Please Enter Valid Email', Colors.red);
        return false;
      }
      if (passwordController.value.text.length < 6) {
        CommonUtils.showSnackBar('Invalid Password', 'At least 8 Characters required', Colors.red);
        return false;
      }

      var result =  await LoginProvider().authenticate(
          {
            'email': emailController.value.text,
            'password': passwordController.value.text,
          });

      if(result.error == true){
        CommonUtils.showSnackBar('Could not Login', result.errorMessage, Colors.red);
        return false;
      } else {
        if (result.data == null) {
          GetStorage().remove('key');
          return false;
        }
        GetStorage().write('key', result.data);
        Get.offAll(()=>HomeView());
        CommonUtils.showSnackBar('Success', result.errorMessage, Colors.blue);
        return true;
      }
    } catch(ex) {
      CommonUtils.showSnackBar('Success', ex.toString(), Colors.blue);
      return false;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
