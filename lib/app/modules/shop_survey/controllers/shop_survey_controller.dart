import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/app/modules/shop_survey/providers/shop_survey_provider.dart';

import '../../../common/functions.dart';

class ShopSurveyController extends GetxController with StateMixin<dynamic>{
  //TODO: Implement ShopSurveyController

  var lstShops = List<dynamic>.empty(growable: true).obs;
  var lstShopsFiltered = List<dynamic>.empty(growable: true).obs;
  var lstShopReceipts = List<dynamic>.empty(growable: true);
  var lstLocations = List<dynamic>.empty(growable: true).obs;
  var shopID = 1;
  var lstFilteredByShopID = List<dynamic>.empty(growable: true);

  var page = 1;
  final count = 0.obs;
  var isDataProcessing = false.obs;

  var mMarket = "";
  var mAllottee = "";
  var mShopNo = "";
  var mRatePaid = "";
  var mLastPaymentDate = "";
  var mAmount = "";
  var mPmtMode = "";
  var mPaymentFrom = "";
  var mPaymentTo = "";
  var mPmtMonths = "";
  var mPaymentDate = "";
  var mUserName = "";
  var mUserMobile = "";
  var mCreatedAt = "";

  @override
  void onInit() {
    super.onInit();
    getShopLocations();
  }

  void getShopLocations() async {
    try {
      isDataProcessing(true);
      await ShopSurveyProvider().getLocationArea().then((resp) {
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
    lstShopsFiltered.clear();
    lstShopsFiltered.addAll(mlist);
  }

  void getShops(var circleName, var marketName) async {
    try {
      isDataProcessing(true);
      await ShopSurveyProvider().getShopList(circleName,marketName).then((resp) {
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

  filterByShopID(var askShopID) async{
    shopID = askShopID;
    lstFilteredByShopID = lstShopsFiltered.where((e) => e['id'] == shopID).toList();
    await getShopDetails();
    // lstFilteredByShopID = lstShopsFiltered.where((e) => e['id'] == shopID).toList(growable: true);
  }


  Future<bool> getShopDetails() async{
    lstShopReceipts = await ShopSurveyProvider().getShopReceipt(shopID);

    mMarket = "";
    mAllottee = "";
    mShopNo = "";
    mRatePaid = "";
    mLastPaymentDate = "";
    mAmount = "";
    mPmtMode = "";
    mPaymentFrom = "";
    mPaymentTo = "";
    mPmtMonths = "";
    mPaymentDate = "";
    mUserName = "";
    mUserMobile = "";
    mCreatedAt = "";

    if (lstShopReceipts != null) {
      mMarket = lstShopReceipts[0]["Market"] ==null ? '' : lstShopReceipts[0]["Market"].toString();;
      mAllottee = lstShopReceipts[0]["Allottee"] ==null ? '' : lstShopReceipts[0]["Allottee"].toString();
      mShopNo = lstShopReceipts[0]["ShopNo"] ==null ? '' : lstShopReceipts[0]["ShopNo"].toString();
      mRatePaid = lstShopReceipts[0]["RatePaid"] ==null ? '' : lstShopReceipts[0]["RatePaid"].toString();
      mLastPaymentDate = lstShopReceipts[0]["LastPaymentDate"] ==null ? '' : lstShopReceipts[0]["LastPaymentDate"].toString();
      mAmount = lstShopReceipts[0]["Amount"] ==null ? '' : lstShopReceipts[0]["Amount"].toString();
      mPmtMode = lstShopReceipts[0]["PmtMode"] ==null ? '' : lstShopReceipts[0]["PmtMode"].toString();
      mPaymentFrom = lstShopReceipts[0]["PaymentFrom"] ==null ? '' : lstShopReceipts[0]["PaymentFrom"].toString();
      mPaymentTo = lstShopReceipts[0]["PaymentTo"] ==null ? '' : lstShopReceipts[0]["PaymentTo"].toString();
      mPmtMonths = lstShopReceipts[0]["PmtMonths"] ==null ? '' : lstShopReceipts[0]["PmtMonths"].toString();
      mPaymentDate = lstShopReceipts[0]["PaymentDate"] ==null ? '' : lstShopReceipts[0]["PaymentDate"].toString();
      mUserName = lstShopReceipts[0]["UserName"] ==null ? '' : lstShopReceipts[0]["UserName"].toString();
      mUserMobile = lstShopReceipts[0]["UserMobile"] ==null ? '' : lstShopReceipts[0]["UserMobile"].toString();
      mCreatedAt = lstShopReceipts[0]["created_at"] ==null ? '' : lstShopReceipts[0]["created_at"].toString();
    }
    return true;
  }


  // void getSurveyedShops(var page) {
  //   try {
  //     isDataProcessing(true);
  //     ShopSurveyProvider().getShopSurveyList(page).then((resp) {
  //       isDataProcessing(false);
  //       lstShops.addAll(resp);
  //     }, onError: (err) {
  //       isDataProcessing(false);
  //       CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
  //     });
  //   } catch (exception) {
  //     isDataProcessing(false);
  //     CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
  //   }
  // }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

  }

  void increment() => count.value++;
}
