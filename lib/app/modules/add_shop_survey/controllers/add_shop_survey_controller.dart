import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:survey_app/app/common/api_response.dart';
import 'package:survey_app/app/common/functions.dart';

import '../providers/add_shop_provider_provider.dart';

class AddShopSurveyController extends GetxController {
  //TODO: Implement AddShopSurveyController
  final GlobalKey<FormState>shopFormKey = GlobalKey<FormState>();

  var lstCircles = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;

  File? _selectedFile1 = null;
  File? _selectedFile2 = null;
  var selectedImage1Path = ''.obs;
  var selectedImage2Path = ''.obs;
  var selectedImage1Size = ''.obs;
  var selectedImage2Size = ''.obs;

  final ImagePicker _picker = ImagePicker();

  late TextEditingController houseNoController;
  late TextEditingController nameController;
  late TextEditingController holdingNo;

  late TextEditingController longitudeController;
  late TextEditingController latitudeController;
  late TextEditingController mobileController;

  var circle = "NA".obs;
  var locality = 'NA'.obs;

  void getCircles() {
    try {
      isDataProcessing(true);
      int mCtr = 1;
      AddShopProviderProvider().getCircles().then((resp) {
        lstCircles.clear();
        lstCircles.add({'circle':'NA'});
        // resp.forEach((element) {
        //   lstCircles.add({'id': mCtr.toString(), 'circle': element['circle']});
        //   mCtr = mCtr + 1;
        // });

        lstCircles.addAll(resp);
        isDataProcessing(false);
      }, onError: (err) {
        isDataProcessing(false);
        CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isDataProcessing(false);
      CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
    }
  }

  void clearTextEditingControllers() {
    // circleController.clear();
    intervieweeController.clear();
    relationController.clear();
    licenseeNameController.clear();
    licenseeFatherController.clear();
    addressController.clear();
    localityController.clear();
    allotmentNoController.clear();
    allotmentDateController.clear();
    shopNameController.clear();
    shopNoController.clear();
    plotNoController.clear();
    holdingNoController.clear();
    buildingTypeController.clear();
    floorController.clear();
    areaNameController.clear();
    longitudeController.clear();
    latitudeController.clear();
    emailController.clear();
    mobileController.clear();
    gSTController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    // circleController = TextEditingController();
    intervieweeController = TextEditingController();
    relationController = TextEditingController();
    licenseeNameController = TextEditingController();
    licenseeFatherController = TextEditingController();
    addressController = TextEditingController();
    localityController = TextEditingController();
    allotmentNoController = TextEditingController();
    allotmentDateController = TextEditingController();
    shopNameController = TextEditingController();
    shopNoController = TextEditingController();
    plotNoController = TextEditingController();
    holdingNoController = TextEditingController();
    buildingTypeController = TextEditingController();
    floorController = TextEditingController();
    areaNameController = TextEditingController();
    longitudeController = TextEditingController();
    latitudeController = TextEditingController();
    emailController = TextEditingController();
    gSTController = TextEditingController();
    mobileController = TextEditingController();
    getCircles();
    getBuildingTypes();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

  }

  // void increment() => count.value++;

  String? validateString(String value) {
    if (value == null) {
      return "Empty String";
    }
    if (value.length == 0) {
      return "Empty String";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid String";
    }
    return null;
  }

  void validateForm() async{
    final isValid = shopFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    shopFormKey.currentState!.save();

    String _img64Image1, _img64Image2;
    final bytes1 = _selectedFile1!.readAsBytesSync();
    final bytes2 = _selectedFile2!.readAsBytesSync();
    _img64Image1 = base64Encode(bytes1);
    _img64Image2 = base64Encode(bytes2);

    var result =  await AddShopProviderProvider().saveSurvey(
        {
          'circle': circle.value,
          'interviewee': intervieweeController.value.text,
          'relation': relationController.value.text,
          'licenseeName': licenseeNameController.value.text,
          'licenseeFather': licenseeFatherController.value.text,
          'address': addressController.value.text,
          'locality': localityController.value.text,
          'allotmentNo': allotmentNoController.value.text,
          'allotmentDate': allotmentDateController.value.text,
          'shopName': shopNameController.value.text,
          'shopNo': shopNoController.value.text,
          'plotNo': plotNoController.value.text,
          'holdingNo': holdingNoController.value.text,
          'buildingType': buildingType.value,
          'floor': floorController.value.text,
          'areaName': areaNameController.value.text,
          'latitude': latitudeController.value.text,
          'longitude': longitudeController.value.text,
          'email': emailController.value.text,
          'mobile': mobileController.value.text,
          'gst': gSTController.value.text,
          'image1': _img64Image1,
          'image2': _img64Image2,
        });

    if(result.error == true){
      CommonUtils.showSnackBar('Could not Save', result.errorMessage, Colors.red);
    } else {
      Get.back();
      CommonUtils.showSnackBar('Success', result.errorMessage, Colors.blue);
    }
  }

  Widget getImageWidget(var selectedFileName) {
    if (selectedFileName != null) {
      return Image.file(
        selectedFileName!,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/images/placeholder.jpg",
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    }
  }

  void getImage(ImageSource source) async {
    // _inProcess = true;
    final XFile? image = await _picker.pickImage(
      source: source,
      maxWidth: 850,
      maxHeight: 850,
      imageQuality: 1,
    );

    if (image != null) {
      File? cropped = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 900,
          maxHeight: 900,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "RPS Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );
    }
  }

  void getImage1(ImageSource imageSource) async {
    // final pickedFile =  await ImagePicker().g
    final XFile? pickedFile = await _picker.pickImage(
      source: imageSource,
      // maxWidth: 700,
      // maxHeight: 700,
      // imageQuality: 1,
    );
    if(pickedFile != null){
      File? cropped = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 900,
          maxHeight: 900,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "Framework Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );
      if(cropped == null) {
        _selectedFile1 = null;
        selectedImage1Path.value = '';
        selectedImage1Size.value = '';
      } else {
        selectedImage1Path.value = cropped.path;
        _selectedFile1 = File(selectedImage1Path.value);
        selectedImage1Size.value = (File(selectedImage1Path.value).lengthSync()/1024/1024).toStringAsFixed(2) + "Mb";
      }
    } else {
      Get.snackbar('Error',
          'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    }
  }

  void getImage2(ImageSource imageSource) async {
    // final pickedFile =  await ImagePicker().g
    final XFile? pickedFile = await _picker.pickImage(
      source: imageSource,
      // maxWidth: 300,
      // maxHeight: 300,
      // imageQuality: 1,
    );
    if(pickedFile != null){
      File? cropped = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: CropAspectRatio(
              ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 900,
          maxHeight: 900,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: "Framework Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
      );
      if(cropped == null) {
        _selectedFile2 = null;
        selectedImage2Path.value = '';
        selectedImage2Size.value = '';
      } else {
        selectedImage2Path.value = cropped.path;
        _selectedFile2 = File(selectedImage2Path.value);
        selectedImage2Size.value = (File(selectedImage2Path.value).lengthSync()/1024/1024).toStringAsFixed(2) + "Mb";
      }
    } else {
      Get.snackbar('Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    }
  }


}
