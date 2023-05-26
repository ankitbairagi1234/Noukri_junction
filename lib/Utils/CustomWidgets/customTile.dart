import 'package:flutter/material.dart';


class CustomTile extends StatelessWidget {
  final String labelText;
  final Widget imageIcon;
  const CustomTile({Key? key, required this.labelText, required this.imageIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
       Container(
         height: 20,
         width: 20,
         child:imageIcon,
       ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              
                width: MediaQuery.of(context).size.width/1.55,
                child: Text(labelText, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ),)),
          )
        ],
      ),
    );
  }
}
