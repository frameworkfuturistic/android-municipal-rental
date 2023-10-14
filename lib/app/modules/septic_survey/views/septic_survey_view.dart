import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/septic_survey_controller.dart';

class SepticSurveyView extends GetView<SepticSurveyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.green, //change your color here
        ),
        // title: Text(
        //   'Shop Survey',
        //   style: TextStyle(color: Colors.blue),
        // ),
        actions: <Widget>[
          IconButton(onPressed: () => Get.toNamed(Routes.ADD_SEPTIC_SURVEY), icon: Icon(Icons.add, color: Colors.red,))
        ],
      ),
      body: Obx(() {
        if (controller.isDataProcessing.value == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(5.0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Text("SEPTIC TANK SURVEY", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.lstSeptic.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => Get.snackbar("Testing",
                              controller.lstSeptic[index]['id'].toString()),
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            // height: double.infinity,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(5.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  offset:
                                  Offset(0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Card(
                              // margin: EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    // shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 1), borderRadius: BorderRadius.circular(5)),
                                    title: SizedBox(
                                        height: 30.0,
                                        child: Text(
                                          controller.lstSeptic[index]['HouseOwner'] ==
                                              null
                                              ? ''
                                              : controller.lstSeptic[index]
                                          ['HouseOwner'],
                                          style:
                                          TextStyle(color: Colors.blue[900], fontSize: 18),
                                        )),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.lstSeptic[index]
                                        ['HoldingNo'] ==
                                            null
                                            ? ''
                                            : controller.lstSeptic[index]
                                        ['HoldingNo']),
                                        Text(controller.lstSeptic[index]
                                        ['Address'] ==
                                            null
                                            ? ''
                                            : controller.lstSeptic[index]
                                        ['Address']),
                                        Text(controller.lstSeptic[index]
                                        ['Locality'] ==
                                            null
                                            ? ''
                                            : controller.lstSeptic[index]
                                        ['Locality']),
                                      ],
                                    ),
                                    leading: ConstrainedBox(
                                      constraints: BoxConstraints(
                                          minWidth: 64,
                                          minHeight: 64,
                                          maxWidth: 94,
                                          maxHeight: 94),
                                      child: Image.network(
                                          controller.lstSeptic[index]['Image1'],
                                          fit: BoxFit.fill),
                                    ),
                                    // leading: CircleAvatar(
                                    //   backgroundImage: NetworkImage(data[index]['Image1']),
                                    // ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
