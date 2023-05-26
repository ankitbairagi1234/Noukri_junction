import 'dart:async';
import 'package:flutter/material.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/myjobs_Screen.dart';
import 'package:job_dekho_app/Views/Recruiter/postJob_Screen.dart';
import 'package:job_dekho_app/Views/signin_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/tokenString.dart';
import 'Job Seeker/seekerdrawer_Screen.dart';
import 'Recruiter/recruiterdrawer_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? uid;
  String? type;
    void checkingLogin() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        uid = prefs.getString(TokenString.userid);
        type = prefs.getString(TokenString.userType);
      });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 1),(){
      return checkingLogin();
    });
    Future.delayed(Duration(seconds:3),(){
      print("uid here ${uid}");
      if(uid == null || uid == ""){

       // return SeekerDrawerScreen();
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));

      }
      else{
        if(type == "seeker") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyJobs_Screen()));
        }
        else{
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PostJobScreen()));
        }
        //return SignInScreen();
      }
    });
    //Timer(Duration(seconds: 4), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('assets/splash screen.png'),
            )
          )
        ),
      ),
    );
  }
}
