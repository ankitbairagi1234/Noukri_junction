import 'package:flutter/material.dart';

import '../iconUrl.dart';
import '../style.dart';

class JobDetailCard extends StatelessWidget {
  final String jobId;
  final String companyname;
  final String designation;
  final String button1Text;
  final String button2Text;

  final VoidCallback? onCardTap;

  const JobDetailCard({Key? key, required this.jobId, required this.companyname, required this.designation, required this.button1Text, required this.button2Text, this.onCardTap,}) : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(20),
          child: Container(
              width: 360,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),

              decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: whiteColor)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Job ID : " + "#" + jobId,style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14,color: whiteColor),),
                  Text("Company Name:".toUpperCase(),style: TextStyle(fontWeight:FontWeight.w600, fontSize: 14,color: whiteColor),),
                  Text(companyname.toUpperCase(),style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14,color: whiteColor),),
                  Text(designation,style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold, fontSize: 14,),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(10),
                        child:Container(
                          padding: EdgeInsets.symmetric(horizontal: 3),
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
                                SizedBox(width: 4,),
                                Text(button1Text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor),),
                              ],
                            )
                        ),
                      ),
                      Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(10),
                        child:Container(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                            width: 140,
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
                                SizedBox(width: 3,),
                                Container(

                                    // width: 95,
                                    child: button2Text == null || button2Text == "null"  ? Text("") : Text(button2Text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor,),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                              ],
                            )
                        ),
                      ),
                    ],
                  )

                ],
              )
          ),
        ),
      ),
    );
  }}