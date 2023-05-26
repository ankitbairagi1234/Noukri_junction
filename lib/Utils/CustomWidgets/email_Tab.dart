import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/style.dart';
import 'package:job_dekho_app/Views/Recruiter/recruitermyprofile_Screen.dart';
import 'package:job_dekho_app/Views/accountcreated_Screen.dart';
import 'package:job_dekho_app/Views/forgotpassword_Screen.dart';
import 'package:job_dekho_app/Views/otp_Screen.dart';

import '../../Views/Job Seeker/seekerdrawer_Screen.dart';
import 'TextFields/authTextField.dart';
import 'customTextButton.dart';

class EmailTabs extends StatelessWidget {
  const EmailTabs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        AuthTextField(
          obsecureText: false,
          iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3),
          hintText: 'Enter Email',),
        AuthTextField(
          obsecureText: true,
          iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 1.3, color: primaryColor,),
          hintText: 'Enter Password',
        ),
        SizedBox(height: 10,),
        GestureDetector(
          onTap: (){
            Get.to(ForgotPasswordScreen());
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.centerRight,
                child: Text('Forgot Password?', style: TextStyle(color: greyColor1,fontWeight: FontWeight.bold,),)),
          ),
        ),
        SizedBox(height: 80,),
        CustomTextButton(buttonText: 'Sign In', onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SeekerDrawerScreen()));
        }),
      ],
    );
  }
}
