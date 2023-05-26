import 'package:flutter/material.dart';

import '../../style.dart';

class PasswordTextField extends StatelessWidget {
  final String label;
  final TextEditingController? fieldController;
  final Color? labelColor;
  final bool? visibleSHow;
  final bool? isObscured;
  var suffixIcons;
   PasswordTextField({Key? key,  required this.label,this.isObscured ,this.suffixIcons,this.visibleSHow ,this.labelColor, this.fieldController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: labelColor,fontSize: 15, fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(15),
              child: TextFormField(
                obscureText: isObscured!,
                controller: fieldController,
                obscuringCharacter: "*",
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: suffixIcons,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none
                    //borderSide: BorderSide(width: 3,color: Colors.black)
                  ) ,
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),borderSide: BorderSide(
                      width: 2,
                      color: primaryColor
                  )
                  ) ,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


