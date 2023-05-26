import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/seekerdrawer_Screen.dart';

import '../../Utils/style.dart';


class SupportHelpScreen extends StatelessWidget {
  const SupportHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: primaryColor,
              leading: GestureDetector(
                onTap: (){
                  Get.to(SeekerDrawerScreen());
                },
                child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
                //Icon(Icons.arrow_back_ios, color: whiteColor, size: 22),
              ),
              title:  Text('Support & Help', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),

            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
                  color: Colors.white
              ),
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Support & Help', style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 20,),),
                  Text("This Part of App is Currently under Maintanance", style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 15,),),

                ],
              ),
            )
        ));;
  }
}
