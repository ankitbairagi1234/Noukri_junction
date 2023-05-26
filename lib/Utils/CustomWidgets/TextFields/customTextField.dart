import 'package:flutter/material.dart';

import '../../style.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
   bool? readOnly = false;
   CustomTextField({Key? key, required this.labelText, required this.hintText,this.readOnly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: greyColor1),),
          TextFormField(
            readOnly: readOnly!,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                borderSide:BorderSide(
                  color: primaryColor,
                  width: 2
                )
              )
            ),
          )
        ],
      ),

    );
  }
}
