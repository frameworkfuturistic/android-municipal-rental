import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../widgets/date_widget.dart';
import '../../../widgets/number_input_widget.dart';
import '../../../widgets/string_input_widget.dart';
import '../controllers/add_daily_toll_controller.dart';

class AddDailyTollView extends GetView<AddDailyTollController> {
  const AddDailyTollView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DAILY TOLL COLLECTION'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.shopFormKey,
        autovalidateMode: AutovalidateMode.always,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("From"),
                    DateTimeField(
                      format: DateFormat("dd-MM-yyyy"),
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                      },
                    ),
                    Text("To"),
                    DateTimeField(
                      format: DateFormat("dd-MM-yyyy"),
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                      },
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("From"),
                //     DateTimeField(
                //       format: DateFormat("dd-MM-yyyy"),
                //       onShowPicker: (context, currentValue) {
                //         return showDatePicker(
                //             context: context,
                //             firstDate: DateTime(1900),
                //             initialDate: currentValue ?? DateTime.now(),
                //             lastDate: DateTime(2100));
                //       },
                //     ),
                //     DateInputField(
                //       firstDate:DateTime.now().add(Duration(days: -365)),
                //       lastDate:DateTime.now().add(Duration(days: 365)),
                //       selectedDate: DateTime.now(),
                //       askHeader: "To",
                //     ),
                //   ],
                // ),
                StringInputField(
                  title: "Vendor Name",
                  hint: "",
                  // callbackValue: controller.licenseeName,
                  controller: controller.sairatController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 25,
                ), // LicenseeName
                StringInputField(
                  title: "Vendor Father",
                  hint: "",
                  // callbackValue: controller.licenseeFather,
                  controller: controller.fatherController,
                  allowEmpty: true,
                  // minLength: 1,
                  // maxLength: 20,
                ), // LicenseeFather
                StringInputField(
                  title: "Market Name",
                  hint: "",
                  // callbackValue: controller.address,
                  controller: controller.marketNameController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 50,
                ), // Address
                StringInputField(
                  title: "Locality",
                  hint: "",
                  // callbackValue: controller.locality,
                  controller: controller.localityController,
                  allowEmpty: false,
                  minLength: 1,
                  maxLength: 50,
                ), // Locality
                StringInputField(
                  title: "Shop Name",
                  hint: " ",
                  // callbackValue: controller.shopName,
                  controller: controller.shopNameController,
                  allowEmpty: true,
                  minLength: 2,
                  maxLength: 50,
                ), // Shop No
                NumberInputField(
                  title: "Rate",
                  hint: "",
                  // callbackValue: controller.email,
                  controller: controller.rateController,
                  allowEmpty: false,
                  minLength: 2,
                  maxLength: 8,
                ), // Mobile
                StringInputField(
                  title: "Amount",
                  hint: "",
                  // callbackValue: controller.gst,
                  controller: controller.amountController,
                  allowEmpty: true,
                  // minLength: 5,
                  maxLength: 15,
                ), // GST
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                      elevation: 5.0,
                      minWidth: 200.0,
                      height: 35,
                      color: Color(0xFF801E48),
                      child: new Text('Save',
                          style: new TextStyle(
                              fontSize: 16.0, color: Colors.white)),
                      onPressed: () => controller.validateForm(),
                    ),
                  ),
                ) //Save Button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
