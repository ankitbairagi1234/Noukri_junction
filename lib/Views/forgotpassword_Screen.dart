import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTextButton.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextFormField.dart';
import '../Utils/style.dart';
import 'signin_Screen.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  TextEditingController emailController = TextEditingController();

  forgetPassword()async{
    var headers = {
      'Cookie': 'ci_session=f452780e49700acbfd9fbb1b866c28144b92b1dd'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}forgot_password'));
    request.fields.addAll({
      'type': ' seeker',
      'email': emailController.text
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      print("final json response ${jsonResponse}");
      var snackBar = SnackBar(
        backgroundColor: primaryColor,
        content: Text('${jsonResponse['message']}',style: TextStyle(color: Colors.white),),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pop(context);
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        //centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: primaryColor, size: 26),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 250,
              height: 300,
              child: Image.asset('assets/AuthAssets/forgotpassword.png'),
            ),
            SizedBox(height: 25,),
            Text("${getTranslated(context, 'Forgot_pass')}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text('${getTranslated(context, 'Company Enter email associated with your account')}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: greyColor1,),textAlign: TextAlign.center,),
            CustomTextFormField(label: "${getTranslated(context, 'email')}",hint: "${getTranslated(context, 'Entre_Email')}",fieldcontroller: emailController,),
            SizedBox(height: 50,),
            CustomTextButton(buttonText: "${getTranslated(context, 'submit')}",onTap: (){
              forgetPassword();
            },)
          ],
        ),
      ),
    ));
  }
}
