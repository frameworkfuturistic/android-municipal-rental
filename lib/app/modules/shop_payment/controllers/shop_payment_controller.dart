import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:survey_app/app/modules/shop_payment/providers/shop_payment_provider.dart';

import '../../../common/functions.dart';

class ShopPaymentController extends GetxController {
  //TODO: Implement ShopPaymentController

  var lstShops = List<dynamic>.empty(growable: true).obs;
  var lstShopsFiltered = List<dynamic>.empty(growable: true).obs;
  var lstLocations = List<dynamic>.empty(growable: true).obs;

  var lstFilteredByShopID = List<dynamic>.empty(growable: true);
  var lstShopReceipts = List<dynamic>.empty(growable: true);

  late TextEditingController pmtController;

  var page = 1;
  final count = 0.obs;
  var isDataProcessing = false.obs;
  var shopID = 1;
  var startDate = DateTime.now().obs;
  var currentDate = DateTime.now().obs;
  var payableAmount = 0.0.obs;
  var payableUpto = ''.obs;

  var mShopNo = "";
  var mAllottee = "";
  var mCircle = "";
  var mMarket = "";
  var mAddress = "";
  var mRate = 0.0;
  var mArrear = 0.0;
  var mDue = 0.0;
  var mAllottedLength ='';
  var mAllottedBreadth ='';
  var mArea ='';
  var mNoOfFloors = '';
  var mPresentOccupier = "";
  var mContactNo ='';
  var mPaidFrom ='';
  var mPaidTo ='';
  var mLastDemand = 0.0;
  var mLastPaymentAmount = 0.0;
  var mLastPmtMode = '';
  var mLastRate = 0.0;
  DateTime mLastPaymentDate = DateTime.now();
  var mLastPaymentTime ='';
  var mLastCreatedBy = '';
  var mLastUserMobile = '';
  var mPaidFromN = 0;
  var mPaidToN = 0;
  // double mMonthlyRate = 0.0;
  // double mRatePaid = 0.0;
  // DateTime mLastPaymentDate = DateTime.now();
  // double mAmount = 0.0;
  // var mPmtMode = "";
  // var mPaymentFrom = "";
  // var mPaymentTo = "";
  // var mPmtMonths = "";
  // var mPaymentDate = "";
  // var mUserName = "";
  // var mUserMobile = "";
  // var mCreatedAt = "";
  // var mConstruction = "";
  // var mContactNo = "";
  final myFormat = new DateFormat('dd-MM-yyyy');

  @override
  void onInit() {
    super.onInit();
    getShopLocations();
    pmtController = TextEditingController();
    // getSurveyedShops(page);
  }

  Future<bool> getShopReceipt() async{
    try {
      lstShopReceipts = await ShopPaymentProvider().getShopReceipt(shopID);

      mShopNo = "";
      mAllottee = "";
      mCircle = "";
      mMarket = "";
      mAddress = "";
      mRate = 0.0;
      mArrear = 0.0;
      mLastDemand = 0.0;
      mAllottedLength ='';
      mAllottedBreadth ='';
      mArea ='';
      mNoOfFloors = '';
      mPresentOccupier = "";
      mContactNo ='';
      mPaidFrom ='';
      mPaidTo ='';
      mLastPaymentAmount = 0.0;
      mLastRate = 0.0;
      mLastPmtMode = '';
      mLastPaymentDate = DateTime.now();
      mLastPaymentTime ='';
      mLastCreatedBy = '';
      mLastUserMobile = '';


      if (lstShopReceipts != null) {
        mShopNo = lstShopReceipts[0]["ShopNo"] ==null ? '' : lstShopReceipts[0]["ShopNo"].toString();;
        mAllottee = lstShopReceipts[0]["Allottee"] ==null ? '' : lstShopReceipts[0]["Allottee"].toString();
        mCircle = lstShopReceipts[0]["Circle"] ==null ? '' : lstShopReceipts[0]["Circle"].toString();;
        mMarket = lstShopReceipts[0]["Market"] ==null ? '' : lstShopReceipts[0]["Market"].toString();;
        mAddress = lstShopReceipts[0]["Address"] ==null ? '' : lstShopReceipts[0]["Address"].toString();;
        mRate = lstShopReceipts[0]["Rate"] == null ? 0.0 : double.parse(lstShopReceipts[0]["Rate"]);
        mArrear = lstShopReceipts[0]["Arrear"] == null ? 0 : double.parse(lstShopReceipts[0]["Arrear"]);
        mAllottedLength = lstShopReceipts[0]["AllottedLength"] ==null ? '' : lstShopReceipts[0]["AllottedLength"].toString();;
        mAllottedBreadth = lstShopReceipts[0]["AllottedBreadth"] ==null ? '' : lstShopReceipts[0]["AllottedBreadth"].toString();;
        mArea = lstShopReceipts[0]["Area"] ==null ? '' : lstShopReceipts[0]["Area"].toString();;
        mNoOfFloors = lstShopReceipts[0]["NoOfFloors"] ==null ? '' : lstShopReceipts[0]["NoOfFloors"].toString();;
        mPresentOccupier = lstShopReceipts[0]["PresentOccupier"] ==null ? '' : lstShopReceipts[0]["PresentOccupier"].toString();
        mContactNo = lstShopReceipts[0]["ContactNo"] ==null ? '' : lstShopReceipts[0]["ContactNo"].toString();
        mPaidFrom = lstShopReceipts[0]["PaidFrom"] ==null ? '' : lstShopReceipts[0]["PaidFrom"].toString();
        mPaidTo = lstShopReceipts[0]["PaidTo"] ==null ? '' : lstShopReceipts[0]["PaidTo"].toString();
        mLastRate = lstShopReceipts[0]["LastRate"] == "" ? 0.0 : double.parse(lstShopReceipts[0]["LastRate"]);
        mLastDemand = lstShopReceipts[0]["LastDemand"] == "" ? 0.0 : double.parse(lstShopReceipts[0]["LastDemand"]);
        mLastPaymentAmount = lstShopReceipts[0]["LastPaymentAmount"] == "" ? 0.0 : double.parse(lstShopReceipts[0]["LastPaymentAmount"]);
        mLastPmtMode = lstShopReceipts[0]["LastPmtMode"] ==null ? '' : lstShopReceipts[0]["LastPmtMode"].toString();
        mLastPaymentDate = new DateFormat('yyyy-MM-dd').parse(lstShopReceipts[0]["LastPaymentDate"]);
        mLastPaymentTime = lstShopReceipts[0]["LastPaymentTime"] ==null ? '' : lstShopReceipts[0]["LastPaymentTime"].toString();
        mLastCreatedBy = lstShopReceipts[0]["LastCreatedBy"] ==null ? '' : lstShopReceipts[0]["LastCreatedBy"].toString();
        mLastUserMobile = lstShopReceipts[0]["LastUserMobile"] ==null ? '' : lstShopReceipts[0]["LastUserMobile"].toString();
        startDate.value = mLastPaymentDate;
        mPaidToN = lstShopReceipts[0]["PaidToN"] ==null ? 24270 : lstShopReceipts[0]["PaidToN"];

        // startDate.value = mLastPaymentDate.add(Duration(days: 1));

        //
        //
        // mMonthlyRate = lstShopReceipts[0]["MonthlyRate"] == null ? 0.0 : double.parse(lstShopReceipts[0]["MonthlyRate"]);
        // mShopNo = lstShopReceipts[0]["ShopNo"] ==null ? '' : lstShopReceipts[0]["ShopNo"].toString();
        // mRatePaid = lstShopReceipts[0]["RatePaid"] ==null ? 0 : double.parse(lstShopReceipts[0]["RatePaid"]);
        // // mLastPaymentDate = DateTime.parse(lstShopReceipts[0]["LastPaymentDate"]);
        //
        // mLastPaymentDate = new DateFormat('yyyy-MM-dd').parse(lstShopReceipts[0]["LastPaymentDate"]);
        // startDate.value = mLastPaymentDate.add(Duration(days: 1));
        //
        //
        // mAmount = lstShopReceipts[0]["Amount"] ==null ? 0 : double.parse(lstShopReceipts[0]["Amount"]);
        // mPmtMode = lstShopReceipts[0]["PmtMode"] ==null ? '' : lstShopReceipts[0]["PmtMode"].toString();
        // mPaymentFrom = lstShopReceipts[0]["PaymentFrom"] ==null ? '' : lstShopReceipts[0]["PaymentFrom"].toString();
        // mPaymentTo = lstShopReceipts[0]["PaymentTo"] ==null ? '' : lstShopReceipts[0]["PaymentTo"].toString();
        // mPmtMonths = lstShopReceipts[0]["PmtMonths"] ==null ? '' : lstShopReceipts[0]["PmtMonths"].toString();
        // mPaymentDate = lstShopReceipts[0]["PaymentDate"] ==null ? '' : lstShopReceipts[0]["PaymentDate"].toString();
        // mConstruction = lstShopReceipts[0]["Construction"] ==null ? '' : lstShopReceipts[0]["Construction"].toString();;
        // mUserName = lstShopReceipts[0]["UserName"] ==null ? '' : lstShopReceipts[0]["UserName"].toString();
        // mUserMobile = lstShopReceipts[0]["UserMobile"] ==null ? '' : lstShopReceipts[0]["UserMobile"].toString();
        // mCreatedAt = lstShopReceipts[0]["CreatedAt"] ==null ? '' : lstShopReceipts[0]["CreatedAt"].toString();
      }

      mDue = mLastDemand - mLastPaymentAmount;

      var mMonths1 = (currentDate.value.year * 12) + currentDate.value.month;
      var mMonths2 = (startDate.value.year * 12) + startDate.value.month;

      var mm = 0;
      mm = mMonths1;
      mm -= mPaidToN ;

      //currentDate.value.difference(startDate.value);
      payableAmount.value = (mm * mRate) + mArrear;

      // if (((mLastPaymentDate.year * 12) + mLastPaymentDate.month) == (currentDate.value.year * 12) + currentDate.value.month) {
      //   // payableAmount.value= mArrear.roundToDouble();
      //   payableAmount.value= mArrear;
      // }
      payableAmount.value= double.parse((payableAmount.value).toStringAsFixed(2));
      return true;
    } on Exception catch (exception) {
      Get.snackbar("Exception", exception.toString());
      return false;
    } catch (error) {
      Get.snackbar("Error", error.toString());
      return false;
    }


  }

  getPrintString1() {
    var retStr = "";
    retStr += "S H O P -- R E N T \n" ;
    retStr += "===========================\n" ;
    retStr += "===========================\n" ;

    retStr += "SAIRAT HOLDER NAME :" + mAllottee + "\n" ;
    retStr += "SHOP ID :" + mShopNo.toString() + "\n" ;
    // retStr += "MARKET :" + mMarket + "\n" ;
    retStr += "MARKET :" + mMarket + "\n" ;
    // retStr += "AREA :" +  lstFilteredByShopID[0]['Circle']+ "\n" ;
    retStr += "FROM MONTH :" + mPaidFrom + "\n" ;
    retStr += "TO MONTH :" + mPaidTo + "\n" ;

    // retStr += "CGST @9% :\n" ;
    // retStr += "SGST @9% :\n" ;
    retStr += "PAYABLE AMOUNT :" + mLastDemand.toString() + "\n" ;
    retStr += "AMOUNT PAID :" + mLastPaymentAmount.toString()  + "\n" ;
    retStr += "BILL DUE :" + mDue.toString()  + "\n" ;
    retStr += "CURRENT DUE :" + mArrear.toString() + "\n" ;
    // retStr += "DUE AMOUNT :" + mArrear.toString() + "\n" ;

    return retStr;
  }

  getPrintString2() {
    var retStr = "";
    retStr = "TAX COLLECTOR NAME :" + mLastCreatedBy + "\n" ;
    retStr += "MOBILE NO :" + mLastUserMobile + "\n" ;

    return retStr;
  }

  getPrintString3() {
    var retStr = "";
    retStr = "                                Signature";
    retStr += "Note: This receipt is an online generated";
    retStr += "      receipt. Tax invoice can be collected";
    retStr += "       from the office of JNAC Market or";
    retStr += "       Tax Invoice will be emailed";
    return retStr;
  }

  filterByShopID(var askShopID) async{
    shopID = askShopID;
    lstFilteredByShopID = lstShopsFiltered.where((e) => e['id'] == shopID).toList();
    await getShopReceipt();
    // lstFilteredByShopID = lstShopsFiltered.where((e) => e['id'] == shopID).toList(growable: true);
  }

  chooseDate() async{
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: currentDate.value,
        firstDate: DateTime(2021),
        lastDate: DateTime(DateTime.now().year + 1)
    );
    if(pickedDate != null && pickedDate != currentDate.value) {
      currentDate.value = pickedDate;
      var mMonths1 = (currentDate.value.year * 12) + currentDate.value.month;
      var mMonths2 = (startDate.value.year * 12) + startDate.value.month;

      var mMonths = mMonths1 - mMonths2;
      // mMonths += 1;
      //currentDate.value.difference(startDate.value);
    payableAmount.value = (mMonths * mRate) + mArrear;

      if (((mLastPaymentDate.year * 12) + mLastPaymentDate.month) == (currentDate.value.year * 12) + currentDate.value.month) {
        payableAmount.value= mArrear;
      }
      payableAmount.value= double.parse((payableAmount.value).toStringAsFixed(2));

    }
  }

  Future<bool> saveShopRent() async{
    try {
      if (pmtController.text.trim().length ==0) return false;
      if ( double.parse(pmtController.text) > payableAmount.value) return false;

      String mDate='';
      DateTime mDateTime = currentDate.value;
      mDate = DateFormat('dd-MM-yyyy').format(mDateTime).toString();

      isDataProcessing(true);
      var result =  await ShopPaymentProvider().postShopPay( shopID,
          {
            'To': mDate.toString(),
            'Amount' : double.parse(pmtController.text)
          });
      pmtController.text = "";
      isDataProcessing(false);
      if(result.error == true) {
        Get.back();
        // CommonUtils.showSnackBar("Error", result.errorMessage, Colors.red);

      }

      return result.error;

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

  void getShopLocations() async {
    try {
      isDataProcessing(true);
      await ShopPaymentProvider().getLocationArea().then((resp) {
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

  void getShops(var circleName, var marketName) async {
    try {
      isDataProcessing(true);
      await ShopPaymentProvider().getShopList(circleName,marketName).then((resp) {
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

  // void getSurveyedShops(var page) {
  //   try {
  //     isDataProcessing(true);
  //     ShopPaymentProvider().getShopList().then((resp) {
  //       isDataProcessing(false);
  //       lstShops.addAll(resp);
  //       // lstShopsFiltered = lstShops;
  //       List<dynamic> mlist = lstShops.toList();
  //       // List<dynamic> mlist = lstShops.where((e) => e['ShopName'].toLowerCase().contains(search)).toList(growable: true);
  //       lstShopsFiltered.clear();
  //       lstShopsFiltered.addAll(mlist);
  //
  //     }, onError: (err) {
  //       isDataProcessing(false);
  //       CommonUtils.showSnackBar("Error", err.toString(), Colors.red);
  //     });
  //   } catch (exception) {
  //     isDataProcessing(false);
  //     CommonUtils.showSnackBar("Error", exception.toString(), Colors.red);
  //   }
  // }

  void filterSearch(search){
    List<dynamic> mlist = lstShops.where((e) => e['Allottee'].toLowerCase().contains(search)).toList();
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
