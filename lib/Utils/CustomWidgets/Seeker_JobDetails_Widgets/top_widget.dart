import 'package:flutter/material.dart';

import '../../iconUrl.dart';
import '../../style.dart';

class TopWidget extends StatelessWidget {
  final String companyName;
  final String button1Text;
  final String button2Text;
  final String specialzation;
  final bool? isBorder;
   TopWidget({Key, key, required this.companyName, required this.button1Text, required this.button2Text,required this.specialzation,required this.isBorder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15,right: 15,top: 12,bottom: 12),
      child: Material(
        color: Colors.white,
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          width: 360,
          height: 130,
          decoration: BoxDecoration(
           border: isBorder == true ? Border.all(color: primaryColor) : Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${specialzation}", style: TextStyle(fontSize: 14, color: primaryColor,fontWeight: FontWeight.bold),),
              Text(companyName.toUpperCase().toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child:Container(
                        width: 85,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(vacancyIcon, scale: 1.5,),
                            SizedBox(width: 6,),
                            Text(button1Text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor),),
                          ],
                        )
                    ),
                  ),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child:Container(
                        width: 140,
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(locationIcon,scale: 1.5,),
                            SizedBox(width: 7,),
                            Container(

                                child: button2Text == null || button2Text == "null" ? Text("No Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor)) : Text(button2Text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                          ],
                        )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
