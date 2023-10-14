import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/functions.dart';
import '../../../common/theme_helper.dart';
import '../../../widgets/location_widget.dart';
import '../../../widgets/number_input_widget.dart';
import '../../../widgets/string_input_widget.dart';
import '../controllers/add_shop_survey_controller.dart';
import 'package:survey_app/app/common/functions.dart';

class AddShopSurveyView extends GetView<AddShopSurveyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHOP SURVEY'),
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
                Obx(() {
                  if (controller.isDataProcessing == true) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Circle',
                          style: titleStyle,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.only(top: 8.0),
                          height: 52,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          child: DropdownButtonFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            isDense: true,
                            items: controller.lstCircles.map((element) {
                              return DropdownMenuItem(
                                child: new Text(element['circle']),
                                value: element['circle'].toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.circle.value = value.toString();
                            },
                            value: controller.circle.value,
                          ),
                        ),
                      ],
                    );
                  }
                }),
                StringInputField(
                  title: "Interviewee Name",
                  hint: "",
                  // callbackValue: controller.interviewee,
                  controller: controller.intervieweeController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 20,
                ), // IntervieweeName
                StringInputField(
                  title: "Relation",
                  hint: "",
                  // callbackValue: controller.relation,
                  controller: controller.relationController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 20,
                ), // relation
                StringInputField(
                  title: "Sairat Holder Name",
                  hint: "",
                  // callbackValue: controller.licenseeName,
                  controller: controller.licenseeNameController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 25,
                ), // LicenseeName
                StringInputField(
                  title: "Sairat Holder Father",
                  hint: "",
                  // callbackValue: controller.licenseeFather,
                  controller: controller.licenseeFatherController,
                  allowEmpty: true,
                  // minLength: 1,
                  // maxLength: 20,
                ), // LicenseeFather
                StringInputField(
                  title: "Address",
                  hint: "",
                  // callbackValue: controller.address,
                  controller: controller.addressController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 50,
                ), // Address
                StringInputField(
                  title: "Locality",
                  hint: "",
                  // callbackValue: controller.locality,
                  controller: controller.localityController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 50,
                ), // Locality
                StringInputField(
                  title: "Allotment No",
                  hint: " ",
                  // callbackValue: controller.allotmentNo,
                  controller: controller.allotmentNoController,
                  allowEmpty: true,
                  // minLength: 5,
                  maxLength: 50,
                ), // Allotment No
                StringInputField(
                  title: "Shop Name",
                  hint: " ",
                  // callbackValue: controller.shopName,
                  controller: controller.shopNameController,
                  allowEmpty: false,
                  minLength: 2,
                  maxLength: 50,
                ), // Shop No
                StringInputField(
                  title: "Shop No",
                  hint: " ",
                  // callbackValue: controller.shopNo,
                  controller: controller.shopNoController,
                  allowEmpty: true,
                  // minLength: 5,
                  maxLength: 50,
                ), // Shop No
                StringInputField(
                  title: "Plot No",
                  hint: " ",
                  // callbackValue: controller.plotNo,
                  controller: controller.plotNoController,
                  allowEmpty: true,
                  maxLength: 30,
                ), // Plot No
                StringInputField(
                  title: "Shop Type",
                  hint: "",
                  // callbackValue: controller.holdingNo,
                  controller: controller.holdingNoController,
                  allowEmpty: true,
                  maxLength: 20,
                ), // Holding No
                Obx(() {
                  if (controller.isBuildingTypeProcessing == true) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Building Type',
                          style: titleStyle,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.only(top: 8.0),
                          height: 52,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.grey, width: 1.0),
                              borderRadius: BorderRadius.circular(12)),
                          child: DropdownButtonFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            isDense: true,
                            items: controller.lstBuildingType.map((element) {
                              return DropdownMenuItem(
                                child: new Text(element['building']),
                                value: element['building'].toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.buildingType.value = value.toString();
                            },
                            value: controller.buildingType.value,
                          ),
                        ),
                      ],
                    );
                  }
                }),
                // StringInputField(
                //   title: "Building Type",
                //   hint: "Building Type",
                //   // callbackValue: controller.buildingType,
                //   controller: controller.buildingTypeController,
                //   allowEmpty: false,
                //   minLength: 2,
                //   maxLength: 20,
                // ), // Building Type
                StringInputField(
                  title: "Floor",
                  hint: "",
                  // callbackValue: controller.floor,
                  controller: controller.floorController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 20,
                ), // Floor
                StringInputField(
                  title: "Area",
                  hint: "",
                  // callbackValue: controller.areaName,
                  controller: controller.areaNameController,
                  allowEmpty: false,
                  minLength: 2,
                  maxLength: 50,
                ), // Area Name
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
                  title: "Email",
                  hint: "",
                  // callbackValue: controller.email,
                  controller: controller.emailController,
                  allowEmpty: true,
                  maxLength: 50,
                ), // Email
                NumberInputField(
                  title: "Mobile",
                  hint: "",
                  // callbackValue: controller.email,
                  controller: controller.mobileController,
                  allowEmpty: false,
                  minLength: 10,
                  maxLength: 10,
                ), // Mobile
                StringInputField(
                  title: "GST",
                  hint: "",
                  // callbackValue: controller.gst,
                  controller: controller.gSTController,
                  allowEmpty: true,
                  // minLength: 5,
                  maxLength: 15,
                ), // GST
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
