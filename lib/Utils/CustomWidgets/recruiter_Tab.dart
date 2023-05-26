import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Views/signin_Screen.dart';
import '../../Services/api_path.dart';
import 'package:http/http.dart';
import '../style.dart';
import 'TextFields/authTextField.dart';
import 'customTextButton.dart';

class RecruiterTab extends StatefulWidget {
  const RecruiterTab({Key? key}) : super(key: key);

  @override
  State<RecruiterTab> createState() => _RecruiterTabState();
}

class _RecruiterTabState extends State<RecruiterTab> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController remailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();

  bool isSeeker = false;
  Future<void>recruitersignup() async{
    var recruiterData = {
      'type' : 'recruiter',
      'email' : '${remailController.text.toString()}',
      'name' : '${fullNameController.text.toString()}',
      'mno' : '${mobileController.text.toString()}',
      'ps' : '${passwordController.text.toString()}'
    };
    var seekerData = {
      'type' : 'recruiter',
      'email' : '${remailController.text.toString()}',
      'name' : '${fullNameController.text.toString()}',
      'mno' : '${mobileController.text.toString()}',
      'ps' : '${passwordController.text.toString()}'
    };
    try{
      var response = await post(
          Uri.parse(ApiPath.sign_up),
          body: isSeeker ? seekerData : recruiterData
      );

      if(response.statusCode == 200){
        Get.dialog(Text('Account Created'));
        print('User LogedIn');
      } else{
        print('failed');
      }

    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formkey,
        child: ListView(
          children: [
            AuthTextField(
              obsecureText: false,
              keyboardtype: TextInputType.emailAddress,
              iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Email", controller: remailController,),
            AuthTextField(
              obsecureText: false,
              iconImage: Image.asset('assets/AuthAssets/Icon awesome-user.png', scale: 1.3, color: primaryColor,),hintText: "Full Name",controller: fullNameController,),
            AuthTextField(
              obsecureText: false,iconImage: Image.asset('assets/AuthAssets/Icon awesome-user.png', scale: 1.3, color: primaryColor,),hintText: "Company Name", controller: companyNameController ,),
            AuthTextField(
              obsecureText: false,
              keyboardtype: TextInputType.number,
              iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-call.png', scale: 1.3, color: primaryColor,),hintText: "Mobile No.",),
            AuthTextField(
              obsecureText: true,
              iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 1.3, color: primaryColor,),hintText: "Password",),
            AuthTextField(
              obsecureText: true,
              iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 1.3, color: primaryColor,),hintText: "Confirm Password",),
            SizedBox(height: 30,),
            CustomTextButton(buttonText: 'Submit', onTap: (){
              recruitersignup();},),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("I already have an account! ", style: TextStyle(color: greyColor,fontWeight: FontWeight.bold),),
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
