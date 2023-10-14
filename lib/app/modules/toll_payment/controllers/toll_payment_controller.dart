import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:survey_app/app/modules/toll_payment/providers/toll_payment_provider.dart';

import '../../../common/functions.dart';
import '../providers/toll_payment_provider.dart';

class TollPaymentController extends GetxController {
  //TODO: Implement ShopPaymentController

  var lstShops = List<dynamic>.empty(growable: true).obs;
  var lstShopsFiltered = List<dynamic>.empty(growable: true).obs;
  var lstLocations = List<dynamic>.empty(growable: true).obs;

  var lstFilteredByShopID = List<dynamic>.empty(growable: true);
  var lstTollReceipts = List<dynamic>.empty(growable: true);

  var printString1 = "";
  var printString2 = "";

  var page = 1;
  final count = 0.obs;
  var isDataProcessing = false.obs;
  var shopID = 1;
  var currentDate = DateTime.now().obs;
  var startDate = DateTime.now().obs;
  var payableAmount = 0.obs;

  var mVendorName = "";
  var mAddress = "";
  var mShopType = "";
  var mAreaName = "";
  var mLocation = "";
  var mDailyTollFee = 0;
  var mLastPaymentDate = DateTime.now();
  var mTranID = "";
  var mDateFrom = "";
  var mDateTo = "";
  var mAmount = "";
  var mPmtMode = "";
  var mRatePaid = "";
  var mPmtDays = "";
  var mPaymentDate = "";
  var mUserName = "";
  var mUserMobile = "";
  var mCreatedAt = "";
  final myFormat = new DateFormat('dd-MM-yyyy');

  @override
  void onInit() {
    super.onInit();
    getTollLocations();
    // getSurveyedShops(page);
  }

  Future<bool> getTollReceipt() async{
    lstTollReceipts = await TollPaymentProvider().getTollReceipt(shopID);

    mVendorName = "";
    mAddress = "";
    mShopType = "";
    mAreaName = "";
    mLocation = "";
    mDailyTollFee = 0;
    // mLastPaymentDate = DateTime.now();
    mTranID = "";
    mDateFrom = "";
    mDateTo = "";
    mAmount = "";
    mPmtMode = "";
    mRatePaid = "";
    mPmtDays = "";
    mPaymentDate = "";
    mUserName = "";
    mUserMobile = "";
    mCreatedAt = "";

    printString1 = "";
    printString2 = "";

    if (lstTollReceipts != null) {
      mVendorName = lstTollReceipts[0]["VendorName"];
      mAddress = lstTollReceipts[0]["Address"];
      mShopType = lstTollReceipts[0]["ShopType"];
      mAreaName = lstTollReceipts[0]["AreaName"];
      mLocation = lstTollReceipts[0]["Location"];
      mDailyTollFee = lstTollReceipts[0]["DailyTollRate"];
      mLastPaymentDate = new DateFormat('dd-MM-yyyy').parse(lstTollReceipts[0]["LastPaymentDate"]);
      startDate.value = mLastPaymentDate.add(Duration(days: 1));
      // mLastPaymentDate = DateFormat('dd-MM-yyyy').parse(lstTollReceipts[0]["LastPaymentDate"]);
      // mLastPaymentDate = DateTime.parse(lstTollReceipts[0]["LastPaymentDate"]);
      mTranID = lstTollReceipts[0]["TranID"].toString();
      mDateFrom = lstTollReceipts[0]["DateFrom"];
      mDateTo = lstTollReceipts[0]["DateTo"];
      mAmount = lstTollReceipts[0]["Amount"].toString();
      mPmtMode = lstTollReceipts[0]["PmtMode"];
      mRatePaid = lstTollReceipts[0]["RatePaid"].toString();
      mPmtDays = lstTollReceipts[0]["PmtDays"].toString();
      mPaymentDate = lstTollReceipts[0]["PaymentDate"];
      mUserName = lstTollReceipts[0]["UserName"];
      mUserMobile = lstTollReceipts[0]["UserMobile"];
      mCreatedAt = lstTollReceipts[0]["CreatedAt"];
    }

    currentDate.value = DateTime.now();
    var mDays = currentDate.value.difference(startDate.value).inDays;
    payableAmount.value = (mDays * mDailyTollFee);

    return true;
  }

  getPrintString1() {
    var retStr = "";
    // retStr = "VENDOR NAME :" + mVendorName + "\n" ;
    retStr += "VENDOR ID :" + shopID.toString() + "\n" ;
    retStr += "MARKET :" + mLocation + "\n" ;
    retStr += "CIRCLE :" + mAreaName + "\n" ;
    retStr += "FROM :" + mDateFrom + "\n" ;
    retStr += "TO :" + mDateTo + "\n" ;
    retStr += "DAILY TOLL FEE :" + mDailyTollFee.toString() + "\n" ;
    retStr += "AMOUNT :" + mAmount + "\n" ;

    return retStr;
  }

  getPrintString2() {
    var retStr = "";
    retStr = "TAX COLLECTOR NAME :" + mUserName + "\n" ;
    retStr += "TAX COLLECTOR MOBILE :" + mUserMobile + "\n" ;

    return retStr;
  }

  getPrintString3() {
    var retStr = "";
    retStr += "Note: Daily toll does not authorize ownership";
    retStr += "      of any shop or place.";
    return retStr;
  }

  filterByShopID(var askShopID) async{
    shopID = askShopID;
    lstFilteredByShopID = lstShopsFiltered.where((e) => e['id'] == shopID).toList();
    await getTollReceipt();
    // lstFilteredByShopID = lstShopsFiltered.where((e) => e['id'] == shopID).toList(growable: true);
  }

  chooseStartDate() async{
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1)
    );
    if(pickedDate != null && pickedDate != startDate.value) {
      startDate.value = pickedDate;
      var mDays = currentDate.value.difference(startDate.value).inDays;
      payableAmount.value = (mDays * mDailyTollFee);
    }
  }

  chooseEndDate() async{
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: startDate.value,
        lastDate: DateTime(startDate.value.year + 1)
    );
    if(pickedDate != null && pickedDate != currentDate.value) {
      currentDate.value = pickedDate;
      var mDays = currentDate.value.difference(startDate.value).inDays + 1;
      payableAmount.value = (mDays * mDailyTollFee);
    }
  }

  Future<bool> saveDailyToll() async{
    try {
      String mDateFrom = '';
      String mDateTo = '';
      DateTime mDateTimeFrom = startDate.value;
      DateTime mDateTimeTo = currentDate.value;
      mDateFrom = DateFormat('dd-MM-yyyy').format(mDateTimeFrom).toString();
      mDateTo = DateFormat('dd-MM-yyyy').format(mDateTimeTo).toString();

      isDataProcessing(true);
      var result =  await TollPaymentProvider().postTollPay( shopID,
          {
            'From': mDateFrom.toString(),
            'To': mDateTo.toString(),
          });
      if(result.error == true){
        CommonUtils.showSnackBar("Error", result.errorMessage, Colors.red);
        return false;
      }
      isDataProcessing(false);
      return true;

      // await ShopPaymentProviderProvider().postTollPay(shopID, currentDate).then((resp) {
      //   isDataProcessing(false);
      // }, onError: (err) {
      //   isDataProcessing(false);
      //   CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
      // });
    } catch (exception) {
      isDataProcessing(false);
      CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
      return false;
    }
  }

  void getTollLocations() {
    try {
      isDataProcessing(true);
      TollPaymentProvider().getLocationArea().then((resp) {
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

  void getTollShops(var areaName, var location) async {
    try {
      isDataProcessing(true);
      await TollPaymentProvider().getTollList(areaName,location).then((resp) {
        isDataProcessing(false);
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

  void getSurveyedShops(var page) {
    try {
      isDataProcessing(true);
      TollPaymentProvider().getShopList(page).then((resp) {
        isDataProcessing(false);
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

  }

  void increment() => count.value++;
}
