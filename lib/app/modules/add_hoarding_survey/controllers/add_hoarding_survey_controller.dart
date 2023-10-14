import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:survey_app/app/common/functions.dart';
import '../providers/add_hoarding_provider.dart';

class AddHoardingSurveyController extends GetxController {
  //TODO: Implement AddShopSurveyController
  final GlobalKey<FormState>hoardingFormKey = GlobalKey<FormState>();

  var lstHoardingTypes = List<dynamic>.empty(growable: true).obs;
  var isHoardingTypeProcessing = false.obs;
  // var _inProcess = false.obs;

  File? _selectedFile1 = null;
  File? _selectedFile2 = null;
  var selectedImage1Path = ''.obs;
  var selectedImage2Path = ''.obs;
  var selectedImage1Size = ''.obs;
  var selectedImage2Size = ''.obs;

  final ImagePicker _picker = ImagePicker();

  // late TextEditingController circleController;
  late TextEditingController hoardingCodeController;
  late TextEditingController contentController;
  late TextEditingController agencyController;
  late TextEditingController locationController;
  late TextEditingController lengthController;
  late TextEditingController widthController;
  late TextEditingController longitudeController;
  late TextEditingController latitudeController;
  late TextEditingController holdingController;

  var hoardingType = 'NA'.obs;

  void getHoardingTypes() {
    try {
      isHoardingTypeProcessing(true);
      int mCtr = 1;
      AddHoardingProvider().getHoardingTypes().then((resp) {
        lstHoardingTypes.clear();
        lstHoardingTypes.add({'hoardingType':'NA'});
        // resp.forEach((element) {
        //   lstCircles.add({'id': mCtr.toString(), 'circle': element['circle']});
        //   mCtr = mCtr + 1;
        // });

        lstHoardingTypes.addAll(resp);
        isHoardingTypeProcessing(false);
      }, onError: (err) {
        isHoardingTypeProcessing(false);
        CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
      });
    } catch (exception) {
      isHoardingTypeProcessing(false);
      CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
    }
  }

  void clearTextEditingControllers() {
    hoardingCodeController.clear();
    contentController.clear();
    agencyController.clear();
    locationController.clear();
    lengthController.clear();
    widthController.clear();
    longitudeController.clear();
    latitudeController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    hoardingCodeController = TextEditingController();
    contentController = TextEditingController();
    agencyController = TextEditingController();
    locationController = TextEditingController();
    lengthController = TextEditingController();
    widthController = TextEditingController();
    longitudeController = TextEditingController();
    latitudeController = TextEditingController();
    holdingController = TextEditingController();
    getHoardingTypes();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

  }

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
    final isValid = hoardingFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    hoardingFormKey.currentState!.save();

    String _img64Image1, _img64Image2;
    final bytes1 = _selectedFile1!.readAsBytesSync();
    final bytes2 = _selectedFile2!.readAsBytesSync();
    _img64Image1 = base64Encode(bytes1);
    _img64Image2 = base64Encode(bytes2);

    var result =  await AddHoardingProvider().saveHoarding(
        {
          'hoardingType': hoardingType.value,
          'hoardingCode': hoardingCodeController.value.text,
          'holdingNo': holdingController.value.text,
          'content': contentController.value.text,
          'agency': agencyController.value.text,
          'location': locationController.value.text,
          'latitude': latitudeController.value.text,
          'longitude': longitudeController.value.text,
          'hoardingLength': lengthController.value.text,
          'hoardingLocation': locationController.value.text,
          'width': widthController.value.text,
          'length': lengthController.value.text,
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

  // void getImage1(ImageSource imageSource) async {
  //   // final pickedFile =  await ImagePicker().g
  //   final XFile? pickedFile = await _picker.pickImage(
  //     source: imageSource,
  //     // maxWidth: Get.width,
  //     // maxHeight: Get.height,
  //     imageQuality: 1,
  //   );
  //   if(pickedFile != null){
  //     File? cropped = await ImageCropper().cropImage(
  //         sourcePath: pickedFile.path,
  //         aspectRatioPresets: [
  //           CropAspectRatioPreset.square,
  //           CropAspectRatioPreset.ratio3x2,
  //           CropAspectRatioPreset.original,
  //           CropAspectRatioPreset.ratio4x3,
  //           CropAspectRatioPreset.ratio16x9
  //         ],
  //         // aspectRatio: CropAspectRatio(
  //         //     ratioX: 1, ratioY: 1),
  //         // compressQuality: 100,
  //         // maxWidth: 900,
  //         // maxHeight: 900,
  //         // compressFormat: ImageCompressFormat.jpg,
  //         androidUiSettings: AndroidUiSettings(
  //           toolbarColor: Colors.deepOrange,
  //           toolbarTitle: "Framework Cropper",
  //           statusBarColor: Colors.deepOrange.shade900,
  //           backgroundColor: Colors.white,
  //         )
  //     );
  //     if(cropped == null) {
  //       _selectedFile1 = null;
  //       selectedImage1Path.value = '';
  //       selectedImage1Size.value = '';
  //     } else {
  //       _selectedFile1 = File(selectedImage1Path.value);
  //       selectedImage1Path.value = cropped.path;
  //       selectedImage1Size.value = (File(selectedImage1Path.value).lengthSync()/1024/1024).toStringAsFixed(2) + "Mb";
  //     }
  //   } else {
  //     Get.snackbar('Error',
  //       'No image selected',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.blue,
  //       colorText: Colors.white,
  //     );
  //   }
  // }
  //
  // void getImage2(ImageSource imageSource) async {
  //   // final pickedFile =  await ImagePicker().g
  //   final XFile? pickedFile = await _picker.pickImage(
  //     source: imageSource,
  //     maxWidth: 300,
  //     maxHeight: 300,
  //     imageQuality: 1,
  //   );
  //   if(pickedFile != null){
  //     File? cropped = await ImageCropper().cropImage(
  //         sourcePath: pickedFile.path,
  //         aspectRatio: CropAspectRatio(
  //             ratioX: 1, ratioY: 1),
  //         compressQuality: 100,
  //         maxWidth: 900,
  //         maxHeight: 900,
  //         compressFormat: ImageCompressFormat.jpg,
  //         androidUiSettings: AndroidUiSettings(
  //           toolbarColor: Colors.deepOrange,
  //           toolbarTitle: "Framework Cropper",
  //           statusBarColor: Colors.deepOrange.shade900,
  //           backgroundColor: Colors.white,
  //         )
  //     );
  //     if(cropped == null) {
  //       _selectedFile2 = null;
  //       selectedImage2Path.value = '';
  //       selectedImage2Size.value = '';
  //     } else {
  //       selectedImage2Path.value = cropped.path;
  //       _selectedFile2 = File(selectedImage2Path.value);
  //       selectedImage2Size.value = (File(selectedImage1Path.value).lengthSync()/1024/1024).toStringAsFixed(2) + "Mb";
  //     }
  //   } else {
  //     Get.snackbar('Error',
  //       'No image selected',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.blue,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

}
