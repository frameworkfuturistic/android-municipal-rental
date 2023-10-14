import 'package:flutter/material.dart';

class DateInputField extends StatefulWidget {
  // const DateInputField({Key? key}) : super(key: key);

  final DateTime firstDate ;
  final DateTime lastDate ;
  DateTime? selectedDate ;
  final String askHeader;

  DateInputField({Key? key,
    required this.firstDate,
    required this.lastDate,
    required this.selectedDate,
    required this.askHeader
  }) : super(key: key);

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {


  @override
  Widget build(BuildContext context) {

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: this.widget.selectedDate??DateTime.now(),
          firstDate: this.widget.firstDate,
          lastDate: this.widget.lastDate,
      );
      if (picked != null && picked != this.widget.selectedDate) {
        setState(() {
          this.widget.selectedDate = picked;
        });
      }
    }

    return Container(
      margin: EdgeInsets.only(top: 8.0),
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton.icon(
              onPressed: (){_selectDate(context);},
              icon: Icon(Icons.timeline),
              label: Text(this.widget.askHeader)
          ),
          Text("${this.widget.selectedDate?.toLocal()}".split(' ')[0]),
        ],
      ),
    );
  }
}
