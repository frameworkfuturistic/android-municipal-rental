import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:survey_app/app/modules/toll_survey/views/toll_update_view.dart';
import '../../../widgets/number_input_widget.dart';
import '../../../widgets/string_input_widget.dart';
import '../controllers/toll_survey_controller.dart';
import '../../../routes/app_pages.dart';

class TollSurveyView extends GetView<TollSurveyController> {
  const TollSurveyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigoAccent[400],
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("Add New Toll"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Container(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Pick a Locality', style: TextStyle(color: Colors.white),),
                          ),
                          color: Colors.blueAccent,
                        ),
                        content: setupAlertDialogContainer(context),
                      );
                    });
              },
              icon: Icon(Icons.filter_alt_outlined, color: Colors.yellow,)
          ),
          // IconButton(onPressed: () => Get.toNamed(Routes.ADD_DAILY_TOLL), icon: Icon(Icons.add, color: Colors.blueAccent,))
        ],
      ),
      body: Form(
        key: controller.shopFormKey,
        autovalidateMode: AutovalidateMode.always,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent[100],
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ), //Border.all
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          1.0,
                          1.0,
                        ), //Offset
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Obx(() => Text('Market : ' + controller.pickedLocationName.value, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                      SizedBox(height: 20,),
                      Obx(() => Text('Circle : ' + controller.pickedAreaName.value, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                    ],
                  ),
                ), //MarketName and Circle
                StringInputField(
                  title: "Shop No",
                  hint: "",
                  // callbackValue: controller.locality,
                  controller: controller.shopNoController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 50,
                ), // Locality
                StringInputField(
                  title: "Vendor Name",
                  hint: "",
                  // callbackValue: controller.locality,
                  controller: controller.vendorNameController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 50,
                ), // Locality
                StringInputField(
                  title: "Address",
                  hint: "",
                  // callbackValue: controller.locality,
                  controller: controller.addressController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 50,
                ), // Locality
                NumberInputField(
                  title: "Rate",
                  hint: "",
                  // callbackValue: controller.email,
                  controller: controller.rateController,
                  allowEmpty: false,
                  minLength: 2,
                  maxLength: 8,
                ), // Mobile
                // NumberInputField(
                //   title: "Length",
                //   hint: "",
                //   // callbackValue: controller.email,
                //   controller: controller.presentLengthController,
                //   allowEmpty: false,
                //   minLength: 2,
                //   maxLength: 8,
                // ), // Mobile
                // NumberInputField(
                //   title: "Breadth",
                //   hint: "",
                //   // callbackValue: controller.email,
                //   controller: controller.presentBreadthController,
                //   allowEmpty: false,
                //   minLength: 2,
                //   maxLength: 8,
                // ), // Mobile
                // NumberInputField(
                //   title: "Height",
                //   hint: "",
                //   // callbackValue: controller.email,
                //   controller: controller.presentHeightController,
                //   allowEmpty: false,
                //   minLength: 2,
                //   maxLength: 8,
                // ), // Mobile
                StringInputField(
                  title: "Trade License No",
                  hint: "",
                  // callbackValue: controller.gst,
                  controller: controller.tradeLicenseController,
                  allowEmpty: true,
                  // minLength: 5,
                  maxLength: 15,
                ),
                StringInputField(
                  title: "Construction",
                  hint: "",
                  // callbackValue: controller.gst,
                  controller: controller.constructionController,
                  allowEmpty: true,
                  // minLength: 5,
                  maxLength: 15,
                ),
                StringInputField(
                  title: "Mobile No",
                  hint: "",
                  // callbackValue: controller.gst,
                  controller: controller.mobileController,
                  allowEmpty: true,
                  // minLength: 5,
                  maxLength: 15,
                ),
                StringInputField(
                  title: "Remarks",
                  hint: "",
                  // callbackValue: controller.gst,
                  controller: controller.remarksController,
                  allowEmpty: true,
                  // minLength: 5,
                  maxLength: 15,
                ),

                // GST
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      minWidth: 200.0,
                      height: 35,
                      color: Color(0xFF801E48),
                      child: new Text('Save',
                          style: new TextStyle(
                              fontSize: 16.0, color: Colors.white)),
                      onPressed: () => controller.validateForm(),
                    ),
                  ),
                ) //Save Button
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget setupAlertDialogContainer(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // color: Colors.grey,
          padding: EdgeInsets.all(1.0),
          height: 300.0,
          width: 300.0,
          child: ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: controller.lstLocations.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    controller.getTollShops(controller.lstLocations[index]['AreaName'], controller.lstLocations[index]['Location']);
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    // height: double.infinity,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(1.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset:
                          Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Card(
                      // margin: EdgeInsets.all(5.0),
                      child: Text(controller.lstLocations[index]
                      ['AreaLocation'] ==
                          null
                          ? ''
                          : controller.lstLocations[index]
                      ['AreaLocation']),
                    ),
                  ),
                );
              }),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },child: Text("Cancel"),),
        )
      ],
    );
  }

}
