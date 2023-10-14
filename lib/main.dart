import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/modules/login/views/login_view.dart';
import 'app/routes/app_pages.dart';
import 'app/common/functions.dart';

void main() async{
  await GetStorage.init();
  // bool isLogged = isLoggedIn() as bool;
  runApp(
    GetMaterialApp(
      title: "Municipal Survey",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      // home: Obx(() {
      //   if(isLogged){
      //     return HomeView();
      //   } else {
      //     return LoginView();
      //   }
      // }),
      getPages: AppPages.routes,
    ),
  );

}


