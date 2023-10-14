import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/app/modules/shop_payment/views/shop_pay_view.dart';

import '../../../routes/app_pages.dart';
import '../controllers/shop_payment_controller.dart';

class ShopPaymentView extends GetView<ShopPaymentController> {
  const ShopPaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigoAccent[400],
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Container(
          height: 38,
          child: TextField(
            onChanged: ((value) => controller.filterSearch(value)),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade500,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none
                ),
                hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade500
                ),
                hintText: "Search vendor"
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Container(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Pick a Locality', style: TextStyle(color: Colors.white),),
                          ),
                          color: Colors.blueAccent,
                        ),
                        content: setupAlertDialogContainer(context),
                      );
                    });
              },
              icon: Icon(Icons.filter_alt_outlined, color: Colors.white,)
          ),
          // IconButton(onPressed: () => Get.toNamed(Routes.ADD_DAILY_TOLL), icon: Icon(Icons.add, color: Colors.blueAccent,))
        ],
      ),
      body: Obx(() {
        if (controller.isDataProcessing.value == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.lstShopsFiltered.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          // onTap: () => Get.snackbar("Testing",
                          //     controller.lstShopsFiltered[index]['id'].toString()),
                          onTap: () async {
                            await controller.filterByShopID(controller.lstShopsFiltered[index]["id"]);
                            // controller.shopID= controller.lstShopsFiltered[index]["id"],
                            // Get.to(PrintReceipt())
                            Get.to(ShopPayView(),
                                transition: Transition.rightToLeft,
                                duration: Duration(seconds: 1),
                                arguments: [
                                  {'TollID':'1'},
                                ],
                                preventDuplicates: true);


                            // Get.to(PrintReceipt(),
                            //   transition: Transition.rightToLeft,
                            //   duration: Duration(seconds: 1),
                            //   arguments: [
                            //     {'vendor_id':'2'},
                            //     {'tran_id':'45'},
                            //     {'from':'01/01/2022'},
                            //     {'to':'01/05/2022'},
                            //     {'vendor_name': 'Test Kumar Singh'},
                            //     {'market_name': 'Daily Market'},
                            //     {'area_name': 'Bistupur'},
                            //     {'rate': '3.50'},
                            //     {'amount': '624'}
                            //   ],
                            //   preventDuplicates: true)
                            // var data = Get.arguments; in the destination
                          },
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            // height: double.infinity,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(1.0)),
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
                            child: Card(
                              margin: EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 1), borderRadius: BorderRadius.circular(5)),
                                    title: SizedBox(
                                        height: 20.0,
                                        child:Text(controller.lstShopsFiltered.value[index]['Allottee'] == null ? '' : controller.lstShopsFiltered[index]['Allottee'], style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),)),
                                    subtitle:
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.lstShopsFiltered.value[index]['ShopNo'] == null ? 'Shop No: ' : 'Shop No: ' + controller.lstShopsFiltered[index]['ShopNo']),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(controller.lstShopsFiltered.value[index]['LastPaymentDate'] == null ? 'Last Paid On: ' : 'Last Paid On: ' + controller.lstShopsFiltered.value[index]['LastPaymentDate'].toString().padRight(10,'.').substring(0,10), style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.bold),),
                                            Text(controller.lstShopsFiltered.value[index]['LastPaymentAmount'].toString().length == 0 ? '' : 'Rs. ' + controller.lstShopsFiltered[index]['LastPaymentAmount'].toString(), style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(controller.lstShopsFiltered.value[index]['Circle'] == null ? ''  : '' +  controller.lstShopsFiltered[index]['Circle'], style: TextStyle(fontSize: 12,),),
                                            Text(controller.lstShopsFiltered.value[index]['Market'] == null ? '' : controller.lstShopsFiltered[index]['Market'], style: TextStyle(color: Colors.deepPurple, fontSize: 14, fontWeight: FontWeight.bold),),
                                          ],
                                        ),
                                        Text('Rate: ' + controller.lstShopsFiltered.value[index]['Rate'].toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Widget setupAlertDialogContainer(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // color: Colors.grey,
          padding: EdgeInsets.all(1.0),
          height: 300.0,
          width: 300.0,
          child: ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: controller.lstLocations.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    controller.getShops(controller.lstLocations[index]['Circle'], controller.lstLocations[index]['Market']);
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    // height: double.infinity,
                    // width: double.infinity,
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
                    child: Card(
                      // margin: EdgeInsets.all(5.0),
                      child: Text(controller.lstLocations[index]
                      ['CircleMarket'] ==
                          null
                          ? ''
                          : controller.lstLocations[index]
                      ['CircleMarket']),
                    ),
                  ),
                );
              }),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },child: Text("Cancel"),),
        )
      ],
    );
  }
}
