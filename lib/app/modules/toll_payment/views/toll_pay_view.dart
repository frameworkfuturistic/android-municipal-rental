import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../print_receipt.dart';
import 'package:survey_app/app/modules/toll_payment/controllers/toll_payment_controller.dart';

class TollPayView extends GetView<TollPaymentController> {
  const TollPayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Toll Pay'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.all(Radius.circular(1.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset:
                      Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('VendorName :'),
                  Text(controller.lstFilteredByShopID[0]['VendorName'])
                ],

              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.all(Radius.circular(1.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset:
                    Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Address :'),
                  // Text(controller.lstShopsFiltered[controller.shopID]['Address'])
                  Text(controller.lstFilteredByShopID[0]['Address'])
                ],

              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.all(Radius.circular(1.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset:
                    Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ShopType :'),
                  Text(controller.lstFilteredByShopID[0]['ShopType'])
                  // Text(controller.lstShopsFiltered[controller.shopID]['ShopType'])
                ],

              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.all(Radius.circular(1.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset:
                    Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Location :'),
                  Text(controller.lstFilteredByShopID[0]['Location'])
                  // Text(controller.lstShopsFiltered[controller.shopID]['Location'])
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.all(Radius.circular(1.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset:
                    Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('AreaName :',),
                  Text(controller.lstFilteredByShopID[0]['AreaName'])
                  // Text(controller.lstShopsFiltered[controller.shopID]['AreaName'])
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.all(Radius.circular(1.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset:
                    Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Last Pmt Date :'),
                  Text(controller.lstFilteredByShopID[0]['LastPaymentDate'])
                  // Text(controller.lstShopsFiltered[controller.shopID]['LastPaymentDate'] == null ? '' : controller.lstShopsFiltered[controller.shopID]['LastPaymentDate'] )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.all(Radius.circular(1.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset:
                    Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Last Pmt Amt :'),
                      Text(controller.lstFilteredByShopID[0]['LastAmount'].toString())
                    ],
                  ),
                  Row(
                    children: [
                      Text('Rate :'),
                      Text(controller.mDailyTollFee.toString())
                    ],
                  ),
                  // Text(controller.lstShopsFiltered[controller.shopID]['LastAmount'] == null ? '' : controller.lstShopsFiltered[controller.shopID]['LastAmount'] )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  child: Text("Print last receipt"),
                  onPressed: () async {
                    await controller.getTollReceipt();
                    Get.to(PrintReceipt(),
                      transition: Transition.rightToLeft,
                      duration: Duration(seconds: 1),
                      arguments: [
                        { 'print_string1' : controller.getPrintString1()},
                        { 'print_string2' : controller.getPrintString2()},
                        { 'print_string3' : controller.getPrintString3()},
                        // {'vendor_id': controller.shopID},
                        // {'vendor_name': controller.mVendorName},
                        // {'area_name': controller.mAreaName},
                        // {'location': controller.mLocation},
                        // {'tran_id': controller.mTranID},
                        // {'date_from': controller.mDateFrom},
                        // {'date_to': controller.mDateTo},
                        // {'amount': controller.mAmount},
                        // {'pmt_mode': controller.mAmount},
                        // {'daily_toll_fee': controller.mDailyTollFee},
                        // {'days': controller.mPmtDays},
                        // {'payment_date': controller.mLastPaymentDate},
                        // {'collector_name': controller.mUserName},
                        // {'collector_mobile': controller.mUserMobile},
                        // {'created_at': controller.mCreatedAt},
                      ],
                      preventDuplicates: true);

                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 14))),
                  ),
                ),
              ),
            Container(
              color: Colors.blueGrey,
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: ()=> controller.chooseStartDate(),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black12),
                          ),
                          child: Text('Select From')
                      ),
                      ElevatedButton(
                          onPressed: ()=> controller.chooseEndDate(),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black12),
                          ),
                          child: Text('Select To')
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(DateFormat('dd/MM/yyyy')
                          .format(controller.startDate.value).toString()
                          + " To " + DateFormat('dd/MM/yyyy')
                          .format(controller.currentDate.value).toString(),
                          style: TextStyle(color: Colors.white))),
                      SizedBox(height: 5,),
                      Obx(() => Text("Payable :" + controller.payableAmount.toString(), style: TextStyle(color: Colors.white),))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: FractionallySizedBox(
                widthFactor: 1, // means 100%, you can change this to 0.8 (80%)
                child: ElevatedButton.icon(
                  // onPressed: () => Get.defaultDialog(
                  //   title: "Update Payment ?",
                  //   middleText: "Press Confirm if Accepted payment",
                  //   // content: getContent(),
                  //   middleTextStyle: TextStyle(color: Colors.black54),
                  //   barrierDismissible: false,
                  //   backgroundColor: Colors.green[200],
                  //   radius: 10.0,
                  //   confirm: confirmBtn(),
                  //   cancel: cancelBtn(),
                  // ),

                  onPressed: () => {
                    if(controller.payableAmount <= 0){
                        Get.defaultDialog(
                        title: "Invalid Payment ?",
                        middleText: "Selected Date must be greater than last payment date",
                        middleTextStyle: TextStyle(color: Colors.black54),
                        barrierDismissible: true,
                        backgroundColor: Colors.green[200],
                        radius: 10.0,
                        // confirm: confirmBtn(),
                        // cancel: cancelBtn(),
                      )
                  } else {
                    Get.defaultDialog(
                      title: "Update Payment ?",
                      middleText: "Press Confirm if Accepted payment",
                      // content: getContent(),
                      middleTextStyle: TextStyle(color: Colors.black54),
                      barrierDismissible: false,
                      backgroundColor: Colors.green[200],
                      radius: 10.0,
                      confirm: confirmBtn(),
                      cancel: cancelBtn(),
                    ),
                  }
                },
                  label: Text('Submit', style: TextStyle(color: Colors.white)),
                  icon: Icon(Icons.check, color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget confirmBtn() {
    return ElevatedButton(onPressed: () async{
        await controller.saveDailyToll();
        await controller.getTollReceipt();
        Get.back();
        Get.back();

        Get.to(PrintReceipt(),
            transition: Transition.rightToLeft,
            duration: Duration(seconds: 1),
            arguments: [
              { 'print_string1' : controller.getPrintString1()},
              { 'print_string2' : controller.getPrintString2()},
              //
              // {'vendor_id': controller.lstTollReceipts[0]['VendorID']},
              // {'vendor_name': controller.lstTollReceipts[0]['VendorName']},
              // {'area_name': controller.lstTollReceipts[0]['AreaName']},
              // {'location': controller.lstTollReceipts[0]['Location']},
              // {'tran_id': controller.lstTollReceipts[0]['TranID']},
              // {'date_from': controller.lstTollReceipts[0]['DateFrom']},
              // {'date_to': controller.lstTollReceipts[0]['DateTo']},
              // {'amount': controller.lstTollReceipts[0]['Amount']},
              // {'pmt_mode': controller.lstTollReceipts[0]['PmtMode']},
              // {'daily_toll_fee': controller.lstTollReceipts[0]['DailyTollFee']},
              // {'days': controller.lstTollReceipts[0]['Days']},
              // {'payment_date': controller.lstTollReceipts[0]['PaymentDate']},
              // {'collector_name': controller.lstTollReceipts[0]['CollectorName']},
              // {'collector_mobile': controller.lstTollReceipts[0]['CollectorMobile']},
              // {'created_at': controller.lstTollReceipts[0]['CreatedAt']},
            ],
            preventDuplicates: true);
    },

    // {
    //   // GetStorage().remove('key');
    //   // Get.offAllNamed(Routes.LOGIN);
    //
    child: Text("Confirm"));
  }

  Widget cancelBtn() {
    return ElevatedButton(onPressed: () {
      Get.back();
    }, child: Text("Cancel"));
  }
}
