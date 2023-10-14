import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/navigation_drawer_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
    backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.white,
        // title: Text("Municipal Survey", style: TextStyle(color: Colors.blueGrey[700], fontSize: 20),),
        centerTitle: true,
      ),
      drawer: NavigationDrawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  // SizedBox(height: 50,),
                  Center(child: Text('SURVEYOR - n', style: TextStyle(color: Colors.blue, fontSize: 40, fontWeight: FontWeight.bold),)),
                  SizedBox(height: 50,),
                  Divider(
                      color: Colors.black,
                    height: 15,
                  ),
                  Center(child: Text('SURVEY', style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold),)),
                  Center(child: Text('&', style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold),)),
                  Center(child: Text('PAYMENT COLLECTION', style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.bold),)),
                  Divider(
                      color: Colors.black,
                    height: 15,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                  // width: 200,
                  // height: 400,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 20,),
                Text("Jamshedpur Notified Area Committee", style: TextStyle(fontSize: 14, color: Colors.blueGrey),),
              ],
            ),
            SizedBox(height: 20,),
          ],
        )

        ),
    );
  }
}
