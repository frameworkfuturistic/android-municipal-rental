import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class CommonUtils {
  static void showSnackBar(String title, String message, Color backgroundColor){
    Get.snackbar(title,message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white
    );
  }

  static Future<bool> hasLocationPermission() async{
    var status = await Permission.location.status;
    if (status.isGranted) {
      return true;
    } else {
      Map<Permission, PermissionStatus> permStatus = await [
        Permission.location,
      ].request();
      if (await Permission.location.isPermanentlyDenied) {
        openAppSettings();
      } else {
        return true;
      }
    }
   return false;
  }

  static Future<String?> getCurrentLongitude({bool isLatitude=true}) async{
    String retValue = '';
    try {
      if (hasLocationPermission() == false) {
        CommonUtils.showSnackBar(
            'Please Grant Permission', 'Permission Required', Colors.red);
        return '';
      }
      Position _currentPosition;
      await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best,
          forceAndroidLocationManager: true)
          .then((Position position) {
            if(isLatitude) {
              retValue = (position.latitude.toString() + '00000000000000000000').substring(0,10);
            } else {
              retValue = (position.longitude.toString() + '00000000000000000000').substring(0,10);
            }

      }).catchError((e) {
        return retValue;
      });
      return retValue;
    } catch (ex) {
      return retValue;
    }
  }

  static Future<String> getToken() async{
    return await GetStorage().read('key');
  }

  static Future<bool> setPrinter(String printerName) async{
    await GetStorage().write('printer',printerName);
    return true;
  }

  static Future<String> getPrinter() async{
    return await GetStorage().read('printer');
  }

  static Future<bool> setPrinterConnected() async{
    await GetStorage().write('printer_connected',true);
    return true;
  }

  static Future<bool> getPrinterConnected() async{
    return await GetStorage().read('printer_connected');
  }

  static Future<bool> isLoggedIn() async{
    try{
      if( await GetStorage().read('key').toString().trim().length > 0){
        return true;
      } else {
        return false;
      }
    } catch(ex) {
      return false;
    }
  }

}