import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/location_widget.dart';
import '../../../widgets/number_input_widget.dart';
import '../../../widgets/string_input_widget.dart';

class SwmSurveyEntryView extends GetView {
  const SwmSurveyEntryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SWM SURVEY'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.septicFormKey,
        autovalidateMode: AutovalidateMode.always,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StringInputField(
                  title: "Property Owner",
                  hint: "",
                  // callbackValue: controller.interviewee,
                  controller: controller.houseOwnerController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 50,
                ), // House Owner
                StringInputField(
                  title: "Property Type",
                  hint: "",
                  // callbackValue: controller.relation,
                  controller: controller.holdingNoController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 20,
                ), // Holding No
                NumberInputField(
                  title: "Mobile",
                  hint: "",
                  // callbackValue: controller.licenseeName,
                  controller: controller.mobileController,
                  allowEmpty: false,
                  minLength: 10,
                  maxLength: 10,
                ), // Mobile
                StringInputField(
                  title: "Address",
                  hint: "",
                  // callbackValue: controller.licenseeFather,
                  controller: controller.addressController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 100,
                ), // Address
                StringInputField(
                  title: "Locality",
                  hint: "",
                  // callbackValue: controller.address,
                  controller: controller.localityController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 50,
                ), // Locality
                StringInputField(
                  title: "Interviewee Name",
                  hint: "",
                  // callbackValue: controller.locality,
                  controller: controller.intervieweeController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 50,
                ), // Interviewee
                StringInputField(
                  title: "Relation with Property Owner",
                  hint: "",
                  // callbackValue: controller.allotmentNo,
                  controller: controller.relationController,
                  allowEmpty: true,
                  // minLength: 5,
                  maxLength: 50,
                ), // Relation
                LocationInputField(
                  title: 'Longitude',
                  controller: controller.longitudeController,
                  isLatitude: false,
                ),
                LocationInputField(
                  title: 'Latitude',
                  controller: controller.latitudeController,
                  isLatitude: true,
                ),
                StringInputField(
                  title: "Length of Septic Latrine",
                  hint: "",
                  // callbackValue: controller.email,
                  controller: controller.lengthController,
                  allowEmpty: true,
                  maxLength: 50,
                ), // Length
                StringInputField(
                  title: "Width of Septic Latrine",
                  hint: "",
                  // callbackValue: controller.gst,
                  controller: controller.widthController,
                  allowEmpty: true,
                  // minLength: 5,
                  maxLength: 15,
                ), // Width
                StringInputField(
                  title: "Capacity of Septic Latrine",
                  hint: "",
                  // callbackValue: controller.gst,
                  controller: controller.capacityController,
                  allowEmpty: true,
                  // minLength: 5,
                  maxLength: 15,
                ), // Capacity
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
