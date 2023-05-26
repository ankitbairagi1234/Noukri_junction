import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Views/signin_Screen.dart';
import '../style.dart';
import 'TextFields/authTextField.dart';
import 'customTextButton.dart';

class JobSeekerTab extends StatefulWidget {
  const JobSeekerTab({Key? key}) : super(key: key);

  @override
  State<JobSeekerTab> createState() => _JobSeekerTabState();
}

class _JobSeekerTabState extends State<JobSeekerTab> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController jemailController = TextEditingController();
  TextEditingController jmobileController = TextEditingController();
  TextEditingController jpasswordController = TextEditingController();
  TextEditingController jcpasswordController = TextEditingController();
  TextEditingController jfirstNameController = TextEditingController();
  TextEditingController jlastNameController = TextEditingController();

  Future<void>jobseekersignup() async{

    try{
      var response = await post(
        Uri.parse(ApiPath.sign_up),
        body: {
          'type' : 'seeker',
          'email' : '${jemailController.text.toString()}',
          'name' : '${jfirstNameController.text.toString()} ${jlastNameController}',
          'mno' : '${jmobileController.text.toString()}',
          'ps' : '${jpasswordController.text.toString()}'
        }
      );

      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        Get.dialog(Text('Account Created'));
        print('Account Created');
      } else{
        print('failed');
      }

    }catch(e){
      print(e.toString());
    }
  }

  void _validate(){
    _formkey.currentState!.validate();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: ListView(
          children: [
            AuthTextField(
              validatior: (value){
                if(value!.isEmpty){
                  return "Enter Some Text";
                  print("Email");
                }
                return null;
              },
              obsecureText: false,
              iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),
              hintText: "Email",
              keyboardtype: TextInputType.emailAddress,
              controller: jemailController,),
            AuthTextField(
              validatior: (value){
                if(value == null || value.isEmpty){
                  return '${getTranslated(context, 'Enter_Some_Text')}';
                }
              },
              obsecureText: false,
              iconImage: Image.asset('assets/AuthAssets/Icon awesome-user.png', scale: 1.3, color: primaryColor,),
              hintText: "First Name",
              controller: jfirstNameController,),
            AuthTextField(
              validatior: (value){
                if(value == null || value.isEmpty){
                  return '${getTranslated(context, 'Enter_Some_Text')}';
                }
              },
              obsecureText: false,
              iconImage: Image.asset('assets/AuthAssets/Icon awesome-user.png', scale: 1.3, color: primaryColor,),
              hintText: "Last Name",
              controller: jlastNameController,),
            AuthTextField(
              validatior: (value){
                if(value == null || value.isEmpty){
                  return '${getTranslated(context, 'Enter_Some_Text')}';
                }
              },
              obsecureText: false,
              iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-call.png', scale: 1.3, color: primaryColor,),
              hintText: "Mobile No.",
              keyboardtype: TextInputType.number,
              length: 10,
              controller: jmobileController,),
            AuthTextField(
              validatior: (value){
                if(value == null || value.isEmpty){
                  return '${getTranslated(context, 'Enter_Some_Text')}';
                }
              },
              obsecureText: true,
              iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 1.3, color: primaryColor,),
              hintText: "Password",
              controller: jpasswordController,),
            AuthTextField(
              validatior: (value){
                if(value == null || value.isEmpty){
                  return '${getTranslated(context, 'Enter_Some_Text')}';
                }
              },
              obsecureText: true,
              iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 1.3, color: primaryColor,),
              hintText: "Confirm Password", controller: jcpasswordController,),
            SizedBox(height: 30,),
            CustomTextButton(
              buttonText: 'Submit',
              onTap: (){
                _formkey.currentState!.validate();
                //jobseekersignup();
              },),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("I already have an account!", style: TextStyle(color: greyColor,fontWeight: FontWeight.bold),),
                GestureDetector(onTap: (){Get.to(SignInScreen());},child: Text("Sign In", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),))
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
