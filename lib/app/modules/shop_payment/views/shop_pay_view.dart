import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:survey_app/app/modules/shop_payment/controllers/shop_payment_controller.dart';
import '../../../common/functions.dart';
import '../../../widgets/number_input_widget.dart';
import '../../print_receipt.dart';


class ShopPayView extends GetView<ShopPaymentController> {
  const ShopPayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Rental Pay'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      Text('Sairat Name :',style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(controller.mAllottee,style: TextStyle(fontWeight: FontWeight.bold))
                    ],

                  ),
                ), //Sairat Name
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
                      Text('Present Occupier :',),
                      Text(controller.mPresentOccupier)
                    ],
                  ),
                ), //Present Occupier
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
                      Text('Contact No :'),
                      Text(controller.mContactNo)
                    ],
                  ),
                ), //Contact No
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
                      Text('Shop No :', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(controller.mShopNo, style: TextStyle(fontWeight: FontWeight.bold))
                    ],

                  ),
                ), //Shop No
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
                          Text('Circle :'),
                          Text(controller.mCircle)
                        ],
                      ),
                      Row(
                        children: [
                          Text('Market :'),
                          Text(controller.mMarket)
                        ],
                      )
                    ],

                  ),
                ), //Circle
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
                          Text('Monthly Rent :', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(controller.mRate.toString(), style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Row(
                        children: [
                          Text('Current Arrear :', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(controller.mArrear.toString(), style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      // Text(controller.lstShopsFiltered[controller.shopID]['LastAmount'] == null ? '' : controller.lstShopsFiltered[controller.shopID]['LastAmount'] )
                    ],
                  ),
                ), //Monthly Rent and Arrear
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
                          Text('Bill Due : '),
                          Text(controller.mDue.toStringAsFixed(2))
                        ],
                      ),
                      Row(
                        children: [
                          Text('Last Demand : '),
                          Text(controller.mLastDemand.toString())
                        ],
                      )
                    ],
                  ),
                ), //Last Demand
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
                          Text('Paid From : '),
                          Text(controller.mPaidFrom.toString())
                        ],
                      ),
                      Row(
                        children: [
                          Text('Paid To : '),
                          Text(controller.mPaidTo.toString())
                        ],
                      )
                    ],
                  ),
                ), //Last Payment Dates

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
                          Text('Last Pmt On :'),
                          Text(DateFormat("dd/MM/yyyy").format(controller.mLastPaymentDate))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pmt Amt :'),
                          Text(controller.mLastPaymentAmount.toString())
                          // Text(controller.lstShopsFiltered[controller.shopID]['LastAmount'] == null ? '' : controller.lstShopsFiltered[controller.shopID]['LastAmount'] )
                        ],
                      ),
                      // Text(controller.lstShopsFiltered[controller.shopID]['LastAmount'] == null ? '' : controller.lstShopsFiltered[controller.shopID]['LastAmount'] )
                    ],
                  ),
                ), //Last Payment Date
                // Container(
                //   padding: const EdgeInsets.all(8.0),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius:
                //     BorderRadius.all(Radius.circular(1.0)),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey.withOpacity(0.2),
                //         spreadRadius: 2,
                //         blurRadius: 3,
                //         offset:
                //         Offset(0, 1), // changes position of shadow
                //       ),
                //     ],
                //   ),
                //   child:
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('Last Pmt Amt :'),
                //       Text(controller.mLastPaymentAmount.toString())
                //       // Text(controller.lstShopsFiltered[controller.shopID]['LastAmount'] == null ? '' : controller.lstShopsFiltered[controller.shopID]['LastAmount'] )
                //     ],
                //   ),
                // ), //Last Payment Amount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Text('Payable: ' + controller.payableAmount.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          child: Text("Print last"),
                          onPressed: () async {
                            await controller.getShopReceipt();
                            Get.to(PrintReceipt(),
                                transition: Transition.rightToLeft,
                                duration: Duration(seconds: 1),
                                arguments: [
                                  { 'print_string1' : controller.getPrintString1()},
                                  { 'print_string2' : controller.getPrintString2()},
                                  { 'print_string3' : controller.getPrintString3()},
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
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text('Payment upto: ' + DateFormat('dd/MM/yyyy')
                          .format(controller.currentDate.value).toString(), style: TextStyle(color: Colors.white))) ,
                      ElevatedButton(
                          onPressed: () async { await controller.chooseDate();},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white30),
                          ),
                          // style: ElevatedButton.styleFrom(
                          //   // backgroundColor: Colors.white30,
                          //   padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          //   textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          // ),
                          child: Text('Select Date')),
                    ],
                  ),
                ),
                NumberInputField(
                  title: "Amount [Only monthly payment is allowed]",
                  hint: "",
                  // callbackValue: controller.email,
                  controller: controller.pmtController,
                  allowEmpty: false,
                  minLength: 2,
                  maxLength: 8,
                ), // Mobile
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: FractionallySizedBox(
                    widthFactor: 1, // means 100%, you can change this to 0.8 (80%)
                    child: ElevatedButton.icon(
                      onPressed: () async{
                        if (controller.pmtController.text.length == 0) {
                          Get.defaultDialog(
                            title: "Invalid Payment ?",
                            middleText: "No payment",
                            middleTextStyle: TextStyle(color: Colors.black54),
                            barrierDismissible: true,
                            backgroundColor: Colors.green[200],
                            radius: 10.0,
                            // confirm: confirmBtn(),
                            // cancel: cancelBtn(),
                          );
                          return;
                        }

                        if (double.parse(controller.pmtController.text) > controller.payableAmount.value){
                          Get.defaultDialog(
                            title: "Invalid Payment ?",
                            middleText: "Selected Date must be greater than last payment date",
                            middleTextStyle: TextStyle(color: Colors.black54),
                            barrierDismissible: true,
                            backgroundColor: Colors.green[200],
                            radius: 10.0,
                          );
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
                          );
                        };

                        // if (controller.pmtController.text.length == 0 || double.parse(controller.pmtController.text) > controller.payableAmount.value) {
                        //   Get.defaultDialog(
                        //     title: "Invalid Payment ?",
                        //     middleText: "Selected Date must be greater than last payment date",
                        //     middleTextStyle: TextStyle(color: Colors.black54),
                        //     barrierDismissible: true,
                        //     backgroundColor: Colors.green[200],
                        //     radius: 10.0,
                        //     // confirm: confirmBtn(),
                        //     // cancel: cancelBtn(),
                        //   );
                        // } else {
                        //   Get.defaultDialog(
                        //     title: "Update Payment ?",
                        //     middleText: "Press Confirm if Accepted payment",
                        //     // content: getContent(),
                        //     middleTextStyle: TextStyle(color: Colors.black54),
                        //     barrierDismissible: false,
                        //     backgroundColor: Colors.green[200],
                        //     radius: 10.0,
                        //     confirm: confirmBtn(),
                        //     cancel: cancelBtn(),
                        //   );
                        // }

                        // await controller.getTollReceipt();

                      },
                      label: Text('Submit', style: TextStyle(color: Colors.white)),
                      icon: Icon(Icons.check, color: Colors.white),
                    ),
                  ),
                ), //Submit
              ],
            )
        ),
      ),
    );
  }

  Widget confirmBtn() {
    return ElevatedButton(onPressed: () async {
      Get.back();
      var mFlag = await controller.saveShopRent();
      if (mFlag == false) {
        Get.snackbar("Shop Payment","Successfully Added");
        await controller.getShopReceipt();
        Get.to(PrintReceipt(),
            transition: Transition.rightToLeft,
            duration: Duration(seconds: 1),
            arguments: [
              { 'print_string1': controller.getPrintString1()},
              { 'print_string2': controller.getPrintString2()},
              { 'print_string3': controller.getPrintString3()},
            ],
            preventDuplicates: true);
      } else {
        Get.back();
        Get.snackbar("Shop Payment","You can accept payment only once in any month");

        // Get.defaultDialog(
        //     title: "Error Saving Data",
        //     middleText: "Payment will be accepted only against regular bills",
        //     backgroundColor: Colors.teal,
        //     titleStyle: TextStyle(color: Colors.white),
        //     middleTextStyle: TextStyle(color: Colors.white),
        //     radius: 30
        // );
        // Get.back();
      }
    },
    child: Text("Confirm"));
  }

  Widget cancelBtn() {
    return ElevatedButton(onPressed: () {
      Get.back();
    }, child: Text("Cancel"));
  }

}
