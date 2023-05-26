import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_dekho_app/Services/tokenString.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTextButton.dart';
import 'package:job_dekho_app/Utils/style.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/seekerdrawer_Screen.dart';
import 'package:job_dekho_app/Views/Recruiter/recruiterdrawer_Screen.dart';
import 'package:job_dekho_app/Views/accountcreated_Screen.dart';
import 'package:job_dekho_app/Views/Recruiter/recruitermyprofile_Screen.dart';
import 'package:job_dekho_app/Views/signin_Screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/api_path.dart';

class OTPScreen extends StatefulWidget {
   String? code,mobile,type;
  OTPScreen({this.type,this.mobile,this.code});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {


  OtpFieldController controller  =  OtpFieldController();
  FocusNode focusNode = FocusNode();
  String? enteredOtp;
  var focusedBorderColor = primaryColor;
   var fillColor =  greyColor1;
   var borderColor = greyColor2;

var newOtp;

   resendOtp()async{
     SharedPreferences prefs  = await SharedPreferences.getInstance();
     String? type = prefs.getString(TokenString.userType);
     print("kkkkk ${type}");
     var headers = {
       'Cookie': 'ci_session=25ff5e4d1c8952f258520edbe7b2b7ec8703cfa9'
     };
     var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}resent_otp/${type}'));
     request.fields.addAll({
       'mobile': '${widget.mobile}'
     });
     request.headers.addAll(headers);
     http.StreamedResponse response = await request.send();
     if (response.statusCode == 200) {
       var finalResponse =  await response.stream.bytesToString();
       final jsonResponse = json.decode(finalResponse);
       print("final json response ${jsonResponse}");
       setState(() {
         newOtp = jsonResponse['otp'];
         print("new otp ${newOtp}");
         widget.code = newOtp;
       });
       print("sdsdsdsds ${widget.code}");
       var snackBar = SnackBar(
         content: Text('${jsonResponse['message']}'),
       );
       ScaffoldMessenger.of(context).showSnackBar(snackBar);
     }
     else {
       print(response.reasonPhrase);
     }

   }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: (){
                Get.to(SignInScreen());
              },
              child: Icon(Icons.arrow_back_ios, color: primaryColor, size: 26),
            ),
            title:  Text('Verification', style: TextStyle(color: primaryColor, fontSize: 21, fontWeight: FontWeight.bold),),
          ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.center,
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text("Code has sent to", style: TextStyle(fontSize: 22, color: primaryColor),),
                SizedBox(height: 5,),
                Text("${widget.mobile}", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),),
                SizedBox(height: 10,),
                Text("${widget.code}"),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.all(10),
                  child:OTPTextField(

                    controller: controller,
                    length: 4,
                    keyboardType: TextInputType.number,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceEvenly,
                    fieldWidth: 50,
                    contentPadding: EdgeInsets.all(11),
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15,
                    otpFieldStyle: OtpFieldStyle(
                        backgroundColor: Color(0xffFFFFFF),
                        disabledBorderColor: Colors.white
                    ),
                    style: TextStyle(fontSize: 17, height: 2.2),
                    onChanged: (pin) {
                      print("checking pin here ${pin}");
                    },
                    onCompleted: (pin) {
                      if (pin.isNotEmpty && pin.length == 4) {
                        setState(() {
                          enteredOtp = pin;
                        });
                      } else {

                      }
                    },
                  )
                  // child: PinCodeTextField(
                  //   controller: controller,
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   appContext: (context),
                  //   onChanged: (value){
                  //
                  //   },
                  //   onSubmitted: ,
                  //   length: 4,
                  //   pinTheme: PinTheme(
                  //       shape: PinCodeFieldShape.box,
                  //       borderRadius: BorderRadius.circular(10),
                  //       activeColor: primaryColor,
                  //       fieldWidth: 48,
                  //       fieldHeight: 48,
                  //       selectedColor:  greyColor,
                  //       borderWidth: 2,
                  //       inactiveColor: Colors.grey
                  //   ),
                  // ),
                ),
                SizedBox(height: 30,child: Text("Haven't received the verification code?", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),),
                InkWell(
                    onTap: (){
                      resendOtp();
                    },
                    child: Text("Resend", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                SizedBox(height: 50 ,),
                CustomTextButton(buttonText: "Verify Authentication Code", onTap: (){
                  if(enteredOtp == widget.code){
                    Fluttertoast.showToast(msg: "Otp verified successfully");
                    if(widget.type == "recruiter"){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerScreen()));
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SeekerDrawerScreen()));
                    }
                  }
                  else{
                    Fluttertoast.showToast(msg: "Please enter valid otp");
                  }
                },),
              ],
            ),
          ),
        )
    ));
  }
}

