import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_dekho_app/Model/RecruiterProfileModel.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Services/tokenString.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customDetailTextField.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTextButton.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextFormField.dart';
import 'package:job_dekho_app/Utils/style.dart';
import 'package:job_dekho_app/Views/Recruiter/recruiterdrawer_Screen.dart';
import 'package:job_dekho_app/Views/updatejobpost_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class RecruiterMyProfileScreen extends StatefulWidget {
  const RecruiterMyProfileScreen({Key? key}) : super(key: key);

  @override
  State<RecruiterMyProfileScreen> createState() => _RecruiterMyProfileScreenState();
}

class _RecruiterMyProfileScreenState extends State<RecruiterMyProfileScreen> {

  RecruiterProfileModel? recruiterProfileModel;

  TextEditingController companyController = TextEditingController();
  TextEditingController namecController  =TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var type;
  var profileImage;
  int? currentIndex;
  String? profileType;
  File? imageFile;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }


  getProfiledData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString(TokenString.userid);
    var headers = {
      'Cookie': 'ci_session=af7c02e772664abfa7caad1f5b272362e2f3c492'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}recruiter_profile'));
    request.fields.addAll({
      'id': '${userid}'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = RecruiterProfileModel.fromJson(json.decode(finalResponse));
      print("final json response ${jsonResponse}");
      setState(() {
        recruiterProfileModel = jsonResponse;
      });
      companyController = TextEditingController(text: recruiterProfileModel!.data!.company);
      namecController =  TextEditingController(text: recruiterProfileModel!.data!.name);
      emailController  = TextEditingController(text: recruiterProfileModel!.data!.email);
      mobileController = TextEditingController(text: recruiterProfileModel!.data!.mno);
      locationController = TextEditingController(text: recruiterProfileModel!.data!.location);
      addressController = TextEditingController(text: recruiterProfileModel!.data!.address);
      websiteController = TextEditingController(text: recruiterProfileModel!.data!.website);
      descriptionController = TextEditingController(text: recruiterProfileModel!.data!.des);
      currentIndex = recruiterProfileModel!.data!.orgType == "Employer" ? 1 : 2;
      profileImage = recruiterProfileModel!.data!.img;
      print("sdsdsdsdsdsdsds ${profileType}");
      print("_____________________ ${profileImage}");
    }
    else {
      print(response.reasonPhrase);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){
      return getProfiledData();
    });
  }

updateRecruiterProfile()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userid = prefs.getString(TokenString.userid);
  var headers = {
    'Cookie': 'ci_session=9e7383cfbd30f39cb03bb5cb74d86b1c033539dc'
  };
  var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}update_recruiter_profile'));
  request.fields.addAll({
    'id': '${userid}',
    'full_name': namecController.text,
    'email': emailController.text,
    'mobile': mobileController.text,
    'org_type': currentIndex == 2 ?'Consultant' : "Employer",
    'current_address': addressController.text,
    'preferred_location': locationController.text,
    'website': websiteController.text,
    'company_name': companyController.text,
    'description': descriptionController.text
  });
imageFile == null ? null : request.files.add(await http.MultipartFile.fromPath('image', imageFile!.path.toString()));
print("paramter here ${request.fields}");
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    var finalResponse = await response.stream.bytesToString();
    final jsonResponse = json.decode(finalResponse);
    print("final json responose here ${jsonResponse}");

    print("_____________________profileUpdatedddddddddddddddddd ${profileImage}");

    if(jsonResponse['status'] == "true"){
      var snackBar = SnackBar(
        backgroundColor: primaryColor,
        content: Text('${jsonResponse['message']}'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Navigator.pop(context);e
      Navigator.push(context,MaterialPageRoute(builder: (context) => DrawerScreen()));
    }
    setState(() {

    });
  }
  else {
    print(response.reasonPhrase);
  }

}


  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit an App?'),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('No'),
          ),

          ElevatedButton(
            onPressed: (){
              exit(0);
              // Navigator.pop(context,true);
              // Navigator.pop(context,true);
            },
            //return true when click on "Yes"
            child:Text('Yes'),
          ),
        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: (){
                  Get.to(DrawerScreen());
                },
                child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
              ),
              elevation: 0,
              backgroundColor: primaryColor,
              title: Text('${getTranslated(context, 'My_profile')}'),
              centerTitle: true,
            ),
            backgroundColor: primaryColor,
            body: Container(
              width: size.width,
              height: size.height / 0.61,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: profileBg,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
              ),
              child: recruiterProfileModel == null ? Center(child: CircularProgressIndicator(),) : ListView(
                children: [
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("  Job Portal: Take Image From", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                  ListTile(leading: Image.asset('assets/ProfileAssets/cameraicon.png', scale: 1.5,),
                                    title: Text('Camera', style: TextStyle(fontWeight: FontWeight.bold)),
                                    onTap: (){
                                    _getFromCamera();
                                    },
                                  ),
                                  ListTile(leading: Image.asset('assets/ProfileAssets/galleryicon.png', scale: 1.5,),
                                    title: Text('Gallery', style: TextStyle(fontWeight: FontWeight.bold)),
                                    onTap: (){
                                    _getFromGallery();
                                    },
                                  ),
                                  ListTile(leading: Image.asset('assets/ProfileAssets/cancelicon.png', scale: 1.5,),
                                    title: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold)),
                                    onTap: (){
                                    Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          profileImage == null || profileImage == "" || imageFile != null ?  Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor
                            ),
                            child:imageFile != null ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child:Image.file(imageFile!,fit: BoxFit.cover,)) : Image.asset('assets/ProfileAssets/sampleprofile.png'),
                          ) :
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: whiteColor
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:Image.network("${profileImage}",fit: BoxFit.fill,),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                              ),
                              child: Image.asset('assets/ProfileAssets/camera_Icon.png', scale: 1.8,),
                            ),),
                        ],
                      ),
                    ),
                  ),
                  Text('${getTranslated(context, 'I')}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: greyColor1),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     InkWell(
                       onTap: (){
                         setState(() {
                           currentIndex = 1;
                         });
                       },
                       child: Row(
                         children: [
                         Container(
                           height: 20,
                           width: 20,
                           padding: EdgeInsets.all(3),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(100),
                             border: Border.all(color: currentIndex == 1 ? primaryColor : greyColor1,width: 2)
                           ),
                           child: Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(100),
                               color: currentIndex == 1 ? primaryColor : greyColor1
                             ),
                           ),
                         ),
                           SizedBox(width: 8,),
                           Text("${getTranslated(context, 'employer')}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: currentIndex == 1 ? primaryColor : greyColor1,)),
                         ],
                       ),
                     ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: currentIndex == 2 ? primaryColor : greyColor1,width: 2)
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: currentIndex == 2 ? primaryColor : greyColor1,
                                ),
                              ),
                            ),
                            SizedBox(width: 8,),
                            Text("${getTranslated(context, 'consultant')}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: currentIndex == 2 ? primaryColor : greyColor1),),
                          ],
                        ),
                      )
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Radio(value: 0, groupValue: _value, onChanged: (value){}),
                  //         Text('An Employer', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold ),),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Radio(value: 1, groupValue: _value1, onChanged: (value1){}),
                  //         Text('A Consultant', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold ),),
                  //       ],
                  //     )
                  //   ],
                  // ),
                  CustomTextFormField(label: '${getTranslated(context, "Company Name")}', labelColor: greyColor,fieldcontroller: companyController,),
                  CustomTextFormField(label: '${getTranslated(context, 'name')}', labelColor: greyColor,fieldcontroller: namecController,),
                  CustomTextFormField(label: '${getTranslated(context, 'email')}', labelColor: greyColor,fieldcontroller: emailController,),
                  CustomTextFormField(label: '${getTranslated(context, 'mobile')}', labelColor: greyColor,fieldcontroller: mobileController,),
                  CustomTextFormField(label: '${getTranslated(context, 'location')}', labelColor: greyColor,fieldcontroller: locationController,),
                  CustomTextFormField(label: '${getTranslated(context, 'address')}', labelColor: greyColor,fieldcontroller: addressController,),
                  CustomTextFormField(label: '${getTranslated(context, 'Website_add')}', labelColor: greyColor,fieldcontroller: websiteController,),
                  CustomTextFormField(label: '${getTranslated(context, 'Short_dec')}', labelColor: greyColor,maxLine: 3,fieldcontroller: descriptionController,),
                 // CustomDetailTextField(labelText: "Write A Short Desciption Of Your\nCompany Which Will Show In Your Profile*", maxLines: 4, labelColor: greyColor,),
                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.center,
                    child: CustomTextButton(buttonText: "${getTranslated(context, 'update')}", onTap: (){
                      updateRecruiterProfile();
                    },),
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            ),
      )),
    );
  }
}
