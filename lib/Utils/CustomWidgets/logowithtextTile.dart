import 'package:flutter/material.dart';

class LogoWithText extends StatelessWidget {
  final Widget imageIcon;
  final String labelText;
  const LogoWithText({Key? key, required this.imageIcon, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          imageIcon,
          SizedBox(width: 8,),
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width/1.3,
                child: Text(labelText, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, ))),
          )
        ],
      ),
    );
  }
}
