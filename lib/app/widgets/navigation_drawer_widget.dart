
//https://www.youtube.com/watch?v=ts9n211n8ZU

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:survey_app/app/modules/login/views/login_view.dart';
import '../routes/app_pages.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 10);
  final name ='Test Name';
  final email = 'test@test.com';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        // type: MaterialType.transparency,
        // color: Color.fromRGBO(50, 75, 205, 1),
        color: Colors.white70,
        child: ListView(
          padding: EdgeInsets.all(2.0),
          children: [
            buildHeader(),
            const SizedBox(height: 20,),
            buildMenuItem(
              text: "Shop Survey",
              icon: Icons.accessibility,
              onClicked: () => selectedItem(context, 1),
            ),
            buildMenuItem(
              text: "Shop Collection",
              icon: Icons.accessibility,
              onClicked: () => selectedItem(context, 2),
            ),
            // const SizedBox(height: 5,),
            buildMenuItem(
              text: "Add Toll Vendor",
              icon: Icons.accessibility,
              onClicked: () => selectedItem(context, 3),
            ),
            // const SizedBox(height: 5,),
            buildMenuItem(
              text: "Daily Toll Collection",
              icon: Icons.accessibility,
              onClicked: () => selectedItem(context, 4),
            ),
            // const SizedBox(height: 5,),
            buildMenuItem(
              text: "Hoarding Survey",
              icon: Icons.account_balance,
              onClicked: () => selectedItem(context, 5),
            ),
            const SizedBox(height: 5,),
            buildMenuItem(
              text: "Septic Tank Survey",
              icon: Icons.build,
              onClicked: () => selectedItem(context, 6),
            ),
            const SizedBox(height: 5,),
            buildMenuItem(
              text: "SWM Survey",
              icon: Icons.backup_table,
              onClicked: () => selectedItem(context, 7),
            ),

            const SizedBox(height: 27,),
            Divider(color: Colors.white70,),
            const SizedBox(height: 27,),
            buildMenuItem(
              text: "Profile",
              icon: Icons.account_circle,
              onClicked: () => selectedItem(context, 8),
            ),
            const SizedBox(height: 5,),
            buildMenuItem(
              text: "Log out",
              icon: Icons.arrow_back,
              onClicked: () => selectedItem(context, 9),
            ),

          ],
        ),


      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked
  }) {
    final color = Colors.black;
    final hoverColor = Colors.red;

    return ListTile(
      dense: true,
      isThreeLine: false,
      leading: Icon(icon, color: color,),
      title: Text(text,style: TextStyle(color: color, fontSize: 14),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index){
    Navigator.of(context).pop();

    switch(index){
      case 1:
        Get.toNamed(Routes.SHOP_SURVEY);
        break;
      case 2:
        Get.toNamed(Routes.SHOP_PAYMENT);
        break;
      case 3:
        Get.toNamed(Routes.TOLL_SURVEY);
        break;
      case 4:
        Get.toNamed(Routes.TOLL_PAYMENT);
        break;
      case 5:
        Get.toNamed(Routes.HOARDING_SURVEY);
        break;
      case 6:
        Get.toNamed(Routes.SEPTIC_SURVEY);
        break;
      case 7:
        Get.toNamed(Routes.SWM_SURVEY);
        break;
      case 9:
        Get.defaultDialog(
          title: "Municipal Survey",
          middleText: "Press Confirm to Logout...",
          // content: getContent(),
          middleTextStyle: TextStyle(color: Colors.white70),
          barrierDismissible: false,
          backgroundColor: Colors.black12,
          radius: 10.0,
          confirm: confirmBtn(),
          cancel: cancelBtn(),
        );
        break;
    }
  }

  Widget confirmBtn() {
    return ElevatedButton(onPressed: () {
      GetStorage().remove('key');
      Get.offAllNamed(Routes.LOGIN);
    }, child: Text("Confirm"));
  }


  Widget cancelBtn() {
    return ElevatedButton(onPressed: () {
      Get.back();
    }, child: Text("Cancel"));
  }

  Widget buildHeader(
      // required String urlImage,
      // required String name,
      // required String email,
      // required VoidCallback onClicked,
      ) =>
      Container(
        padding: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: InkWell(
          // onTap: onClicked,
          child: Column(
            children: [
              SizedBox(height: 40.0,),
              Text('Survey Options', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      );
}



