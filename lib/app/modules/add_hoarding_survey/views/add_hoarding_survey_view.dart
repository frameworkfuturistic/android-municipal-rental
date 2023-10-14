import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/functions.dart';
import '../../../common/theme_helper.dart';
import '../../../widgets/location_widget.dart';
import '../../../widgets/number_input_widget.dart';
import '../../../widgets/string_input_widget.dart';

import '../controllers/add_hoarding_survey_controller.dart';

class AddHoardingSurveyView extends GetView<AddHoardingSurveyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOARDING SURVEY'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.hoardingFormKey,
        autovalidateMode: AutovalidateMode.always,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  if (controller.isHoardingTypeProcessing == true) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Hoarding Type',
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
                            items: controller.lstHoardingTypes.map((element) {
                              return DropdownMenuItem(
                                child: new Text(element['hoardingType']),
                                value: element['hoardingType'].toString(),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.hoardingType.value = value.toString();
                            },
                            value: controller.hoardingType.value,
                          ),
                        ),
                      ],
                    );
                  }
                }),
                StringInputField(
                  title: "Hoarding Code",
                  hint: "Hoarding Code",
                  // callbackValue: controller.interviewee,
                  controller: controller.hoardingCodeController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 20,
                ), // IntervieweeName
                StringInputField(
                  title: "Hoarding Location",
                  hint: "Hoarding Location",
                  // callbackValue: controller.interviewee,
                  controller: controller.locationController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 20,
                ), // IntervieweeName
                StringInputField(
                  title: "Hoarding Content",
                  hint: "Hoarding Content",
                  // callbackValue: controller.relation,
                  controller: controller.contentController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 20,
                ), // relation
                StringInputField(
                  title: "Agency Name",
                  hint: "Agency Name",
                  // callbackValue: controller.licenseeName,
                  controller: controller.agencyController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 25,
                ), // LicenseeName
                StringInputField(
                  title: "Hoarding Length",
                  hint: "Hoarding Length",
                  // callbackValue: controller.licenseeFather,
                  controller: controller.lengthController,
                  allowEmpty: true,
                  // minLength: 1,
                  // maxLength: 20,
                ), // LicenseeFather
                StringInputField(
                  title: "Hoarding Width",
                  hint: "Hoarding Width",
                  // callbackValue: controller.address,
                  controller: controller.widthController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 50,
                ), // Address
                StringInputField(
                  title: "Holding No",
                  hint: "Holding No",
                  // callbackValue: controller.holdingNo,
                  controller: controller.holdingController,
                  allowEmpty: true,
                  maxLength: 20,
                ), // Holding No
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
