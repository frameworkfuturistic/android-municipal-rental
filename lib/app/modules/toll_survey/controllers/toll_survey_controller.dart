import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../common/functions.dart';
import '../providers/toll_survey_provider.dart';

class TollSurveyController extends GetxController {
  //TODO: Implement AddShopSurveyController
  final GlobalKey<FormState>shopFormKey = GlobalKey<FormState>();

  var lstShops = List<dynamic>.empty(growable: true).obs;
  var lstShopsFiltered = List<dynamic>.empty(growable: true).obs;
  var lstLocations = List<dynamic>.empty(growable: true).obs;
  var lstFilteredByShopID = List<dynamic>.empty(growable: true);
  var lstTollReceipts = List<dynamic>.empty(growable: true);
  var page = 1;
  final count = 0.obs;
  var isDataProcessing = false.obs;
  var shopID = 1;
  var currentDate = DateTime.now().obs;
  var pickedAreaName = ''.obs;
  var pickedLocationName = ''.obs;


  var lstCircles = List<dynamic>.empty(growable: true).obs;
  var lstBuildingType = List<dynamic>.empty(growable: true).obs;
  var lstFloor = List<dynamic>.empty(growable: true).obs;
  // var isDataProcessing = false.obs;
  var isBuildingTypeProcessing = false.obs;
  // var _inProcess = false.obs;

  File? _selectedFile1 = null;
  File? _selectedFile2 = null;
  var selectedImage1Path = ''.obs;
  var selectedImage2Path = ''.obs;
  var selectedImage1Size = ''.obs;
  var selectedImage2Size = ''.obs;

  final ImagePicker _picker = ImagePicker();

  // late TextEditingController circleController;
  // late TextEditingController areaNameController;
  late TextEditingController shopNoController;
  late TextEditingController shopTypeController;
  late TextEditingController vendorNameController;
  late TextEditingController addressController;
  late TextEditingController rateController;
  late TextEditingController lastPaymentDateController;
  late TextEditingController lastAmountController;
  // late TextEditingController locationController;
  late TextEditingController presentLengthController;
  late TextEditingController presentBreadthController;
  late TextEditingController presentHeightController;
  late TextEditingController tradeLicenseController;
  late TextEditingController constructionController;
  late TextEditingController mobileController;
  late TextEditingController remarksController;

  var circle = "NA".obs;
  var buildingType = 'NA'.obs;


  // void getCircles() {
  //   try {
  //     isDataProcessing(true);
  //     int mCtr = 1;
  //     AddShopProviderProvider().getCircles().then((resp) {
  //       lstCircles.clear();
  //       lstCircles.add({'circle':'NA'});
  //       // resp.forEach((element) {
  //       //   lstCircles.add({'id': mCtr.toString(), 'circle': element['circle']});
  //       //   mCtr = mCtr + 1;
  //       // });
  //
  //       lstCircles.addAll(resp);
  //       isDataProcessing(false);
  //     }, onError: (err) {
  //       isDataProcessing(false);
  //       CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
  //     });
  //   } catch (exception) {
  //     isDataProcessing(false);
  //     CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
  //   }
  // }
  //
  // void getBuildingTypes() {
  //   try {
  //     isBuildingTypeProcessing(true);
  //     int mCtr = 1;
  //     AddShopProviderProvider().getBuildingTypes().then((resp) {
  //       lstBuildingType.clear();
  //       lstBuildingType.add({'building':'NA'});
  //       // resp.forEach((element) {
  //       //   lstCircles.add({'id': mCtr.toString(), 'circle': element['circle']});
  //       //   mCtr = mCtr + 1;
  //       // });
  //
  //       lstBuildingType.addAll(resp);
  //       isBuildingTypeProcessing(false);
  //     }, onError: (err) {
  //       isBuildingTypeProcessing(false);
  //       CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
  //     });
  //   } catch (exception) {
  //     isBuildingTypeProcessing(false);
  //     CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
  //   }
  // }


  void getTollLocations() {
    try {
      isDataProcessing(true);
      TollSurveyProvider().getLocationArea().then((resp) {
        isDataProcessing(false);
        lstLocations.addAll(resp);
      }, onError: (err) {
        isDataProcessing(false);
        CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isDataProcessing(false);
      CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
    }
  }


  void filterSearch(search){
    List<dynamic> mlist = lstShops.where((e) => e['VendorName'].toLowerCase().contains(search)).toList();
    // List<dynamic> mlist = lstShops.where((e) => e['ShopName'].toLowerCase().contains(search)).toList(growable: true);
    lstShopsFiltered.clear();
    lstShopsFiltered.addAll(mlist);

    // lstShopsFiltered = mlist;

    // Iterable<String> filtered = lstShops.whereType();
    // lstShopsFiltered = lstShops.where((user) => user['shopname'].toLowerCase().contains(search));
    // List<String> filteredList = filtered.toList();
  }

  filterByShopID(var askShopID){
    shopID = askShopID;
    lstFilteredByShopID = lstShopsFiltered.where((e) => e['id'] == shopID).toList();
    // lstFilteredByShopID = lstShopsFiltered.where((e) => e['id'] == shopID).toList(growable: true);
  }

  void getTollShops(var areaName, var location) async {
    try {
      isDataProcessing(true);
      await TollSurveyProvider().getTollList(areaName,location).then((resp) {
        isDataProcessing(false);
        pickedAreaName.value = areaName;
        pickedLocationName.value = location;
        lstShops.clear();
        lstShops.addAll(resp);
        // lstShopsFiltered = lstShops;
        List<dynamic> mlist = lstShops.toList();
        // List<dynamic> mlist = lstShops.where((e) => e['ShopName'].toLowerCase().contains(search)).toList(growable: true);
        lstShopsFiltered.clear();
        lstShopsFiltered.addAll(mlist);

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
    // areaNameController.clear();
    shopNoController.clear();
    shopTypeController.clear();
    vendorNameController.clear();
    addressController.clear();
    rateController.clear();
    lastPaymentDateController.clear();
    lastAmountController.clear();
    // locationController.clear();
    presentLengthController.clear();
    presentBreadthController.clear();
    presentHeightController.clear();
    tradeLicenseController.clear();
    constructionController.clear();
    mobileController.clear();
    remarksController.clear();
  }

  @override
  void onInit() {
    super.onInit();

    getTollLocations();

    // areaNameController = TextEditingController();
    shopNoController = TextEditingController();
    shopTypeController = TextEditingController();
    vendorNameController = TextEditingController();
    addressController = TextEditingController();
    rateController = TextEditingController();
    lastPaymentDateController = TextEditingController();
    lastAmountController = TextEditingController();
    // locationController = TextEditingController();
    presentLengthController = TextEditingController();
    presentBreadthController = TextEditingController();
    presentHeightController = TextEditingController();
    tradeLicenseController = TextEditingController();
    constructionController = TextEditingController();
    mobileController = TextEditingController();
    remarksController = TextEditingController();

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
    if (pickedAreaName.value.length == 0) return;
    if (pickedLocationName.value.length == 0) return;

    if (!isValid) {
      return;
    }
    shopFormKey.currentState!.save();

    // String _img64Image1, _img64Image2;
    // final bytes1 = _selectedFile1!.readAsBytesSync();
    // final bytes2 = _selectedFile2!.readAsBytesSync();
    // _img64Image1 = base64Encode(bytes1);
    // _img64Image2 = base64Encode(bytes2);

    var result =  await TollSurveyProvider().updateToll(
        {
          'AreaName': pickedAreaName.value,
          'ShopNo': shopNoController.value.text,
          'ShopType': 'DAILY-TOLL',
          'VendorName': vendorNameController.value.text,
          'Address': addressController.value.text,
          'Rate': rateController.value.text,
          'LastPaymentDate': DateTime.now().toString(),
          'LastAmount': "0",
          'Location': pickedLocationName.value,
          'PresentLength': presentLengthController.value.text,
          'PresentBreadth': presentBreadthController.value.text,
          'PresentHeight': presentHeightController.value.text,
          // 'NoOfFloors': n.value.text,
          'TradeLicense': tradeLicenseController.value.text,
          'Construction': constructionController.value.text,
          // 'Utility': utility.value.text,
          'Mobile': mobileController.value.text,
          'Remarks': remarksController.value.text,
          // 'Photograph1': _img64Image1,
          // 'Photograph2': _img64Image2,
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
