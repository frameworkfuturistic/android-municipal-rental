import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/functions.dart';
import '../common/theme_helper.dart';

class LocationInputField extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
  final bool isLatitude;

  LocationInputField({Key? key,
    required this.title,
    required this.controller,
    required this.isLatitude,
  }) : super(key: key);

  @override
  State<LocationInputField> createState() => _LocationInputFieldState();
}

class _LocationInputFieldState extends State<LocationInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
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
                    readOnly: true,
                    autofocus: false,
                    cursorColor: Colors.grey,
                    controller: widget.controller,
                    style: subTitleStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
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
                Container(
                  child: IconButton(
                    icon: Icon(Icons.pin_drop_outlined),
                    onPressed: () async {
                      // LocationData locData = CommonUtils.getCurrentLocation() as LocationData;
                      var x = await CommonUtils.getCurrentLongitude(isLatitude: widget.isLatitude);
                      widget.controller!.text = x!;
                    },
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
