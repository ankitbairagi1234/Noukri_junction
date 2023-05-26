import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/style.dart';

class CustomCheckBox extends StatefulWidget {
  final String checkboxText;
   bool? boolValue;
   CustomCheckBox({Key? key, required this.checkboxText,  this.boolValue}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

  @override
  Widget build(BuildContext context) {
    String checkedboxText;
    return Container(
      child: Row(
        children: <Widget>[

          /* Checkbox Widget */
          Checkbox(
            side: BorderSide(
              color: primaryColor,
              width: 2,
            ),
            value: widget.boolValue,
            onChanged: (value) {
              setState(() {
                widget.boolValue = value!;
              });
            },
          ),
          SizedBox(
            width: 5,
          ), //SizedBox
          Text(
            '${widget.checkboxText}',
            style: TextStyle(fontSize: 14.0),
          ), //Text//Checkbox
        ], //<Widget>[]
      ),
      // Row(
      //   children: [
      //     Checkbox(
      //       shape: RoundedRectangleBorder(
      //         side: BorderSide(
      //           color: primaryColor
      //         )
      //       ),
      //         fillColor: MaterialStateProperty.all(Colors.transparent),
      //       side: BorderSide(
      //         color: Colors.red,
      //         width: 1.5
      //       ),
      //         checkColor: primaryColor,
      //           value: widget.boolValue, onChanged: (value){}),
      //     Text(widget.checkboxText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),)
      //   ],
      // ),
    );
  }
}
