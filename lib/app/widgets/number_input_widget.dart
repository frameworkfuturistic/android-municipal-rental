import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/theme_helper.dart';

// typedef gblFunction = String? Function(String);

class NumberInputField extends StatelessWidget {
  final int? minLength;
  final int? maxLength;
  final bool allowEmpty;
  final String title;
  final String hint;
  final TextEditingController? controller;
  // var callbackValue;
  // final gblFunction validatorFunction;

  // final String? Function(String?) validatorFunction;
  // final VoidCallback(String) validatorFunction;

  NumberInputField({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.allowEmpty = false,
    this.minLength,
    this.maxLength,
    // required this.validatorFunction,
    // required this.callbackValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(top: 8.0),
            height: 52,
            // color: Colors.grey,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey,
                    width: 1.0
                ),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    autofocus: false,
                    cursorColor: Colors.grey,
                    controller: controller,
                    // onSaved: (value){
                    //   callbackValue = value!;
                    // },
                    validator: (value){
                      if(allowEmpty == true){
                        return null;
                      }
                      if (minLength != null){
                        if(value!.length < minLength!){
                          return "*";
                        }
                      }
                      if (maxLength != null){
                        if(value!.length > maxLength!){
                          return "*";
                        }
                      }
                      return null;
                      // validatorFunction(value!);
                    },
                    style: subTitleStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: subTitleStyle,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 0,
                            )
                        )
                    ),
                  ),

                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
