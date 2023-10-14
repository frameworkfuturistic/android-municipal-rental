import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:survey_app/app/modules/toll_survey/controllers/toll_survey_controller.dart';

import '../../../widgets/location_widget.dart';
import '../../../widgets/string_input_widget.dart';


class UpdateTollView extends GetView<TollSurveyController> {
  const UpdateTollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigoAccent[100],
        title: Text('Update Toll Records'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.shopFormKey,
        autovalidateMode: AutovalidateMode.always,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("From"),
                //     DateTimeField(
                //       format: DateFormat("dd-MM-yyyy"),
                //       onShowPicker: (context, currentValue) {
                //         return showDatePicker(
                //             context: context,
                //             firstDate: DateTime(1900),
                //             initialDate: currentValue ?? DateTime.now(),
                //             lastDate: DateTime(2100));
                //       },
                //     ),
                //     Text("To"),
                //     DateTimeField(
                //       format: DateFormat("dd-MM-yyyy"),
                //       onShowPicker: (context, currentValue) {
                //         return showDatePicker(
                //             context: context,
                //             firstDate: DateTime(1900),
                //             initialDate: currentValue ?? DateTime.now(),
                //             lastDate: DateTime(2100));
                //       },
                //     ),
                //   ],
                // ),

                StringInputField(
                  title: "Vendor Name",
                  hint: "",
                  // callbackValue: controller.licenseeName,
                  controller: controller.vendorNameController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 25,
                ), // LicenseeName
                // StringInputField(
                //   title: "Vendor Father",
                //   hint: "",
                //   // callbackValue: controller.licenseeFather,
                //   controller: controller.licenseeFatherController,
                //   allowEmpty: true,
                //   // minLength: 1,
                //   // maxLength: 20,
                // ), // LicenseeFather
                // StringInputField(
                //   title: "Market Name",
                //   hint: "",
                //   // callbackValue: controller.address,
                //   controller: controller.areaNameController,
                //   allowEmpty: false,
                //   minLength: 1,
                //   maxLength: 50,
                // ), // Address
                // StringInputField(
                //   title: "Locality",
                //   hint: "",
                //   // callbackValue: controller.locality,
                //   controller: controller.localityController,
                //   allowEmpty: false,
                //   minLength: 1,
                //   maxLength: 50,
                // ), // Locality
                // StringInputField(
                //   title: "Shop Name",
                //   hint: " ",
                //   // callbackValue: controller.shopName,
                //   controller: controller.shopNameController,
                //   allowEmpty: true,
                //   minLength: 2,
                //   maxLength: 50,
                // ),
                // LocationInputField(
                //   title: 'Longitude',
                //   controller: controller.longitudeController,
                //   isLatitude: false,
                // ),
                // LocationInputField(
                //   title: 'Latitude',
                //   controller: controller.latitudeController,
                //   isLatitude: true,
                // ),

                Obx(() => controller.selectedImage1Path == ''
                    ? Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Text(
                        'Select image from camera/gallery',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      )),
                )
                    : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Image.file(
                              File(controller.selectedImage1Path.value))),
                    ),
                    Obx(() => Center(
                        child: Text(
                          controller.selectedImage1Size.value,
                          style: TextStyle(
                              fontSize: 12, color: Colors.black),
                        )))
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                        color: Colors.green,
                        child: Text(
                          "Camera",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          controller.getImage1(ImageSource.camera);
                        }),
                    MaterialButton(
                        color: Colors.deepOrange,
                        child: Text(
                          "Device",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          controller.getImage1(ImageSource.gallery);
                        })
                  ],
                ),
                Obx(() => controller.selectedImage2Path == ''
                    ? Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                      child: Text(
                        'Select image from camera/gallery',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      )),
                )
                    : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Image.file(
                              File(controller.selectedImage2Path.value))),
                    ),
                    Obx(() => Center(
                        child: Text(
                          controller.selectedImage2Size.value,
                          style: TextStyle(
                              fontSize: 12, color: Colors.black),
                        )))
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                        color: Colors.green,
                        child: Text(
                          "Camera",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          controller.getImage2(ImageSource.camera);
                        }),
                    MaterialButton(
                        color: Colors.deepOrange,
                        child: Text(
                          "Device",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          controller.getImage2(ImageSource.gallery);
                        })
                  ],
                ),

                // NumberInputField(
                //   title: "Rate",
                //   hint: "",
                //   // callbackValue: controller.email,
                //   controller: controller.rateController,
                //   allowEmpty: false,
                //   minLength: 2,
                //   maxLength: 8,
                // ), // Mobile
                // StringInputField(
                //   title: "Amount",
                //   hint: "",
                //   // callbackValue: controller.gst,
                //   controller: controller.amountController,
                //   allowEmpty: true,
                //   // minLength: 5,
                //   maxLength: 15,
                // ), // GST
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
}

