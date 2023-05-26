import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final Widget? iconImage;
  final String? hintText;
  final String? Function(String?)? validatior;
  final bool obsecureText;
  final int? length;
  final  TextInputType? keyboardtype;
  var suffixIcons;
  final TextEditingController? controller;
   AuthTextField({Key? key, this.iconImage,this.suffixIcons,this.hintText, this.controller, required this.obsecureText, this.validatior, this.keyboardtype, this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 48,
                height: 48,
                child: iconImage,
              ),
            ),
            SizedBox(width: 18,),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                 height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset:  Offset(
                        1.0,
                        1.0,
                      ),
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                    ),
                  ]
                ),
                child: TextFormField(
                  validator: validatior,
                  obscureText: obsecureText,
                  obscuringCharacter: '*',
                  controller: controller,
                  maxLength: length,
                  keyboardType: keyboardtype,
                  decoration: InputDecoration(
                    counterText: "",
                      suffixIcon:suffixIcons,
                      contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      // errorBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //     width: 3,
                      //     color: Colors.
                      //   )
                     // ),
                      hintText: hintText
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
