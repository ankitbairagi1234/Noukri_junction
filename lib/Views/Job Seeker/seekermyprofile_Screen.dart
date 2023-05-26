// import 'dart:convert';
// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:job_dekho_app/Model/AddJobDataModel.dart';
// import 'package:job_dekho_app/Model/SeekerProfileModel.dart';
// import 'package:job_dekho_app/Services/api_path.dart';
// import 'package:job_dekho_app/Services/tokenString.dart';
// import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextFormField.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:toggle_switch/toggle_switch.dart';
// import 'package:http/http.dart' as http;
// import '../../Utils/CustomWidgets/customTextButton.dart';
// import '../../Utils/style.dart';
// import 'seekerdrawer_Screen.dart';
//
// class SeekerProfileDetailScreen extends StatefulWidget {
//   const SeekerProfileDetailScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SeekerProfileDetailScreen> createState() => _SeekerProfileDetailScreenState();
// }
//
// class _SeekerProfileDetailScreenState extends State<SeekerProfileDetailScreen> {
//   var gender;
//   var selectedPreferedLocation;
//   var specialization;
//   var selectedExperience;
//   var selectedRole;
//   var selectedCurrentRole;
//   var selectedDesignation;
//   var selectedJobType;
//   var selectedQualification;
//   var resume;
//   var status;
//   var profileImage;
//   var noticePeriods;
//
//   var yearOfPassing,currentCTC,expected;
//
//   String genders = "";
//
//   SeekerProfileModel? seekerProfileModel;
//
//   String? resumeData;
//   getProfileData()async{
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userid = prefs.getString(TokenString.userid);
//     var headers = {
//       'Cookie': 'ci_session=21ebc11f1bb101ac0f04e6fa13ac04dc55609d2e'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}seeker_info'));
//     request.fields.addAll({
//       'seeker_email': '$userid'
//     });
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       var finalResponse = await response.stream.bytesToString();
//       final jsonResponse = SeekerProfileModel.fromJson(json.decode(finalResponse));
//       print("thisisurl___________________ ${imageFile}");
//       setState(() {
//         seekerProfileModel = jsonResponse;
//         firstNameController = TextEditingController(text: seekerProfileModel!.data!.name);
//         lastNameController = TextEditingController(text: seekerProfileModel!.data!.surname);
//         emailController = TextEditingController(text: seekerProfileModel!.data!.email);
//         mobileController = TextEditingController(text: seekerProfileModel!.data!.mno);
//        // yearOfPassingController = TextEditingController(text: seekerProfileModel!.data!.yp);
//        //  yearOfPassing =  seekerProfileModel!.data!.yp  == ""|| seekerProfileModel!.data!.yp == null  ? null : seekerProfileModel!.data!.yp.toString();
//         ageController =  seekerProfileModel!.data!.age == "1" ? TextEditingController(text: "") : TextEditingController(text: seekerProfileModel!.data!.age);
//         currentAddressController = TextEditingController(text: seekerProfileModel!.data!.currentAddress);
//         keySkillController = TextEditingController(text: seekerProfileModel!.data!.keyskills);
//         percentageController = TextEditingController(text: seekerProfileModel!.data!.cgpa);
//         //currentCTCController = TextEditingController(text: seekerProfileModel!.data!.current);
//       //  expectedCtcController = TextEditingController(text: seekerProfileModel!.data!.expected);
//       //   currentCTC = seekerProfileModel!.data!.current == "" || seekerProfileModel!.data!.current == null  ? null : seekerProfileModel!.data!.current;
//       //   expected = seekerProfileModel!.data!.expected == "" || seekerProfileModel!.data!.current == null ? null : seekerProfileModel!.data!.expected;
//        // noticePeriodController = TextEditingController(text: seekerProfileModel!.data!.noticePeriod);
//        // noticePeriods = seekerProfileModel!.data!.noticePeriod == "" || seekerProfileModel!.data!.noticePeriod == "0" || seekerProfileModel!.data!.noticePeriod == null ? null : seekerProfileModel!.data!.noticePeriod.toString();
//         Future.delayed(Duration(seconds: 1),(){
//           if(seekerProfileModel!.data!.isProfileUpdated == "0"){
//                       print("again check here");
//                       intialFunction();
//           }
//           else{
//             intialFunction();
//           }
//         });
//       });
//       print("select qualification here ${selectedQualification}");
//
//
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController yearOfPassingController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController currentAddressController = TextEditingController();
//   TextEditingController keySkillController = TextEditingController();
//   TextEditingController percentageController = TextEditingController();
//   TextEditingController currentCTCController  = TextEditingController();
//   TextEditingController expectedCtcController = TextEditingController();
//   TextEditingController noticePeriodController =  TextEditingController();
//     intialFunction()async{
//       print("working this api here");
//   setState(() {
//   //selectedPreferedLocation = seekerProfileModel!.data!.location == "0" || seekerProfileModel!.data!.location == null ? null : seekerProfileModel!.data!.location ;
//   // specialization = seekerProfileModel!.data!.specialization == "0" || seekerProfileModel!.data!.specialization == "" || seekerProfileModel!.data!.specialization == null  ? null : seekerProfileModel!.data!.specialization.toString();
//   // selectedExperience = seekerProfileModel!.data!.exp == "0" || seekerProfileModel!.data!.exp == null ? null : seekerProfileModel!.data!.exp.toString();
//   // selectedRole = seekerProfileModel!.data!.jobRole == "0" || seekerProfileModel!.data!.jobRole == null || seekerProfileModel!.data!.jobRole == "" ? null : seekerProfileModel!.data!.jobRole.toString() ;
//   // selectedDesignation = seekerProfileModel!.data!.designation == "0" || seekerProfileModel!.data!.designation == null || seekerProfileModel!.data!.designation == "" ? null :seekerProfileModel!.data!.designation.toString() ;
//   // selectedJobType = seekerProfileModel!.data!.jobType == "0" || seekerProfileModel!.data!.jobType == null || seekerProfileModel!.data!.jobType == " " ? null : seekerProfileModel!.data!.jobType.toString() ;
//   // selectedQualification = seekerProfileModel!.data!.qua == "0" || seekerProfileModel!.data!.qua == null || seekerProfileModel!.data!.qua == "null" ? null : seekerProfileModel!.data!.qua.toString();
//   gender = seekerProfileModel!.data!.gender == "0" || seekerProfileModel!.data!.gender == null  ?  "" : seekerProfileModel!.data!.gender.toString();
//  // filesPath = seekerProfileModel!.data!.resume == "0" || seekerProfileModel!.data!.resume == null  ? "" : seekerProfileModel!.data!.resume;
//   resumeData =  seekerProfileModel!.data!.resume == "0" || seekerProfileModel!.data!.resume == null  ? "" : seekerProfileModel!.data!.resume;
//   status = seekerProfileModel!.data!.status == "0" || seekerProfileModel!.data!.status == null  ? "" : seekerProfileModel!.data!.status;
//   profileImage = seekerProfileModel!.data!.img == "0" || seekerProfileModel!.data!.img == null ? "" : seekerProfileModel!.data!.img;
//   });
//
//   print("resume data here ${resumeData}");
//     }
//
//   var filesPath;
//   String? fileName;
//
//   void _pickFile() async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: false);
//     if (result == null) return;
//     setState(() {
//       filesPath = result.files.first.path ?? "";
//       fileName = result.files.first.name;
//       // reportList.add(result.files.first.path.toString());
//       resumeData = null;
//     });
//     var snackBar = SnackBar(
//       backgroundColor: primaryColor,
//       content: Text('Profile upload successfully'),
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//
//   AddJobDataModel? addJobDataModel;
//   addJobDataFunction()async{
//     var headers = {
//       'Cookie': 'ci_session=b54ea4dc21bb9562023ebd8c74e28340f129a573'
//     };
//     var request = http.Request('GET', Uri.parse('${ApiPath.baseUrl}job_post_lists'));
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       var finalResponse = await response.stream.bytesToString();
//       final jsonResponse = AddJobDataModel.fromJson(json.decode(finalResponse));
//       setState(() {
//         addJobDataModel = jsonResponse;
//       });
//       addJobDataModel?.data?.locations?.forEach((element) {
//
//         print("name is here______________ ${element.name}");
//       });
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(Duration(milliseconds: 1000),(){
//       return getProfileData();
//     });
//     Future.delayed(Duration(milliseconds: 100),(){
//       return addJobDataFunction();
//     });
//   }
//
//   final ImagePicker _picker = ImagePicker();
//   File? imageFile;
//
//   _getFromGallery() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//     );
//     if (pickedFile != null) {
//      setState(() {
//        imageFile = File(pickedFile.path);
//      });
//      Navigator.pop(context);
//     }
//   }
//   _getFromCamera() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.camera,
//     );
//     if (pickedFile != null) {
//     setState(() {
//       imageFile = File(pickedFile.path);
//     });
//     Navigator.pop(context);
//     }
//   }
//
//
//   updateSeekerProfile()async{
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userid = prefs.getString(TokenString.userid);
//     var headers = {
//       'Cookie': 'ci_session=8d12b1698ae8ebfc1747a8f74b92e35634f3150c'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}update_seeker_profile'));
//     request.fields.addAll({
//       'first_name': firstNameController.text,
//       'last_name': lastNameController.text,
//       'email': emailController.text,
//       'gender': gender.toString(),
//       'qualification': selectedQualification.toString(),
//       'year_of_passing': yearOfPassing.toString(),
//       'current_address': currentAddressController.text,
//       'preferred_location': selectedPreferedLocation.id,
//       'current_ctc': currentCTC.toString(),
//       'expected_ctc': expected.toString(),
//       'job_type': selectedJobType.toString(),
//       'designation': selectedDesignation.toString(),
//       'job_role': selectedRole.toString(),
//       'key_skills': keySkillController.text,
//       'percentage_cgpa': percentageController.text,
//       'work_experience': selectedExperience.toString(),
//       'specialization': specialization.toString(),
//       'notice_period': noticePeriods.toString(),
//       'age': ageController.text,
//       'id': userid.toString(),
//       'status': status.toString(),
//     });
//
//    filesPath == null ? null : request.files.add(await http.MultipartFile.fromPath('resume', filesPath.toString()));
//    imageFile == null ? null : request.files.add(await http.MultipartFile.fromPath('image', imageFile!.path.toString()));
//     print("params here ${request.fields}");
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       var finalResult =  await response.stream.bytesToString();
//       final jsonResponse = json.decode(finalResult);
//         print("final json response  ${jsonResponse}");
//         if(jsonResponse['status'] == 'true'){
//           var snackBar = SnackBar(
//             backgroundColor: primaryColor,
//             content: Text('${jsonResponse['message']}',style: TextStyle(color: Colors.white),),
//           );
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SeekerDrawerScreen()));
//         }
//       setState(() {
//       });
//     }
//     else {
//       var snackBar = SnackBar(
//         backgroundColor: primaryColor,
//         content: Text('All Field Are required',style: TextStyle(color: Colors.white),),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//
//
//       print(response.reasonPhrase);
//     }
//   }
//
//   Future<bool> showExitPopup() async {
//     return await showDialog( //show confirm dialogue
//       //the return value will be from "Yes" or "No" options
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Exit App'),
//         content: Text('Do you want to exit an App?'),
//         actions:[
//           ElevatedButton(
//             onPressed: () => Navigator.of(context).pop(false),
//             //return false when click on "NO"
//             child:Text('No'),
//           ),
//
//           ElevatedButton(
//             onPressed: (){
//               exit(0);
//               // Navigator.pop(context,true);
//               // Navigator.pop(context,true);
//             },
//             //return true when click on "Yes"
//             child:Text('yes'),
//           ),
//         ],
//       ),
//     )??false; //if showDialouge had returned null, then return false
//   }
//
//   @override
//   Widget build(BuildContext context){
//     final size = MediaQuery.of(context).size;
//     return WillPopScope(
//       onWillPop: showExitPopup,
//       child: SafeArea(child: Scaffold(
//         backgroundColor: primaryColor,
//         appBar: AppBar(
//           leading: GestureDetector(
//             onTap: (){
//               Get.to(SeekerDrawerScreen());
//             },
//             child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
//           ),
//           elevation: 0,
//           backgroundColor: primaryColor,
//           title: Text(
//               '${getTranslated(context, 'My_profile')}'),
//           centerTitle: true,
//         ),
//         // backgroundColor: primaryColor,
//         body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(topRight: Radius.circular(90),),
//             color: profileBg,
//           ),
//           alignment: Alignment.center,
//           width: size.width,
//           height: size.height / 0.35,
//           child: SingleChildScrollView(
//             child: seekerProfileModel == null  || addJobDataModel == null  ? Center(child: CircularProgressIndicator(),) : Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: (){
//                     showModalBottomSheet(
//                         context: context,
//                         builder: (context){
//                           return Container(
//                             height: 250,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(" Job Portal: Take Image From", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
//                                 ListTile(leading: Image.asset('assets/ProfileAssets/cameraicon.png', scale: 1.5,),
//                                   title: Text('Camera', style: TextStyle(fontWeight: FontWeight.bold)),
//                                   onTap: (){
//                                   _getFromCamera();
//                                   },
//                                 ),
//                                 ListTile(leading: Image.asset('assets/ProfileAssets/galleryicon.png', scale: 1.5,),
//                                   title: Text('Gallery', style: TextStyle(fontWeight: FontWeight.bold)),
//                                   onTap: (){
//                                   _getFromGallery();
//                                   },
//                                 ),
//                                 ListTile(leading: Image.asset('assets/ProfileAssets/cancelicon.png', scale: 1.5,),
//                                   title: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold)),
//                                   onTap: (){
//                                   Navigator.pop(context);
//                                   },
//                                 )
//                               ],
//                             ),
//                           );
//                         });
//                   },
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: Stack(
//                       children: [
//                       profileImage == null || profileImage == "" || imageFile != null ?  Container(
//                           width: 150,
//                           height: 150,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: whiteColor
//                           ),
//                           child:imageFile != null ? ClipRRect(
//                               borderRadius: BorderRadius.circular(100),
//                               child:Image.file(imageFile!,fit: BoxFit.cover,)) : Image.asset('assets/ProfileAssets/sampleprofile.png'),
//                         ) :
//                       Container(
//                         width: 150,
//                         height: 150,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: whiteColor
//                         ),
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(100),
//                             child:Image.network("${profileImage}",fit: BoxFit.fill,),
//                       ),
//                       ),
//                         Positioned(
//                           bottom: 20,
//                           right: 10,
//                           child: Container(
//                             width: 30,
//                             height: 30,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 shape: BoxShape.circle
//                             ),
//                             child: Image.asset('assets/ProfileAssets/camera_Icon.png', scale: 1.8,),
//                           ),),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("${getTranslated(context, 'currentLookingForAJob')}", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: primaryColor),),
//                     ToggleSwitch(
//                       minWidth: 50,
//                       minHeight: 30,
//                       cornerRadius: 20.0,
//                       activeBgColors: [[primaryColor], [primaryColor]],
//                       activeFgColor: Colors.white,
//                       inactiveBgColor: Colors.grey,
//                       inactiveFgColor: Colors.white,
//                       initialLabelIndex:status == "Active" ? 1 : 0,
//                       totalSwitches: 2,
//                       labels: ['${getTranslated(context, 'no')}', '${getTranslated(context, 'yes')}'],
//                       radiusStyle: true,
//                       onToggle: (index) {
//                         print('switched to: $index');
//                         if(index == 0){
//                             status = "Inactive";
//                         }
//                         else{
//                             status = "Active";
//                         }
//                         setState(() {
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10,),
//                 Text("${getTranslated(context, 'personalDetails')}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
//                 SizedBox(height: 10,),
//                 CustomTextFormField(label: "${getTranslated(context, 'firstName')}", labelColor: greyColor2,fieldcontroller: firstNameController,),
//                 CustomTextFormField(label: "${getTranslated(context, 'lastName')}", labelColor: greyColor2,fieldcontroller: lastNameController,),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: Text("${getTranslated(context, 'gender')}", style: TextStyle(fontSize: 16, color: Colors.grey),),
//                 ),
//                 Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Radio(
//                       activeColor: primaryColor,
//                       // title: Text("Male"),
//                       value: "male",
//                       groupValue: gender,
//                       onChanged: (value){
//                         setState(() {
//                           gender = value.toString();
//                         });
//                       },
//                     ),
//                     Text("'${getTranslated(context, 'male')}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
//                     Radio(
//                       activeColor: primaryColor,
//                       // title: Text("Female"),
//                       value: "female",
//                       groupValue: gender,
//                       onChanged: (value){
//                         setState(() {
//                           gender = value.toString();
//                         }
//                         );
//                       },
//                     ),
//                     Text("${getTranslated(context, 'female')}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
//                   ],
//                 ),
//                 CustomTextFormField(label: "${getTranslated(context, 'email')}", labelColor: greyColor2,fieldcontroller: emailController,),
//                 CustomTextFormField(label: "${getTranslated(context, 'mobile')}", labelColor: greyColor2,fieldcontroller: mobileController,keyboardType: TextInputType.number,),
//                 //CustomDropDownTextField(labelText: "Qualification*", buttonHintText: "Qualification",droplist: addJobDataModel!.data!.qualifications,selectedValue: selectedQualification,),
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: EdgeInsets.only(left: 15),
//                   child: Text("${getTranslated(context, 'qualification')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
//                 ),
//                  addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
//                    padding: EdgeInsets.only(left: 15,right: 15),
//                    child: DropdownButton<Qualifications>(
//                     // Initial Value
//                     value: selectedQualification,
//                     isExpanded: true,
//                 hint: Text("${getTranslated(context, 'selectQualification')}"),
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     // Array list of items
//                     items: addJobDataModel!.data!.qualifications!.map((Qualifications items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items.name ?? ""),
//                       );
//                     }).toList(),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: (  newValue) {
//                       setState(() {
//                         selectedQualification = newValue!;
//                       });
//                     },
//                 ),
//                  ),
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: EdgeInsets.only(left: 15),
//                   child: Text("${getTranslated(context,'yearOfPassing')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
//                 ),
//                 addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
//                   padding: EdgeInsets.only(left: 15,right: 15),
//                   child: DropdownButton<num>(
//                     // Initial Value
//                     value: yearOfPassing,
//                     isExpanded: true,
//                     hint: Text("${getTranslated(context, 'yearOfPassing')}"),
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     // Array list of items
//                     items: addJobDataModel!.data!.years!.map((num items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items.toString()),
//                       );
//                     }).toList(),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: (  newValue) {
//                       setState(() {
//                         yearOfPassing = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//                CustomTextFormField(label: "Year of Passing*", labelColor: greyColor2,fieldcontroller: yearOfPassingController,keyboardType: TextInputType.number,),
//                 CustomTextFormField(label: "${getTranslated(context, 'age')}", labelColor: greyColor2,fieldcontroller: ageController,keyboardType: TextInputType.number,),
//                 CustomTextFormField(label: "${getTranslated(context, 'currentAddress')}", labelColor: greyColor2,fieldcontroller:currentAddressController,),
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 15),
//                   child: Text("${getTranslated(context, 'preferredLocation')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
//                 ),
//                 addJobDataModel?.data?.locations?.isEmpty ?? false ? Center(child: CircularProgressIndicator(),) :  Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 15),
//                   child: DropdownButton<Locations>(
//                     // Initial Value
//                     value: selectedPreferedLocation,
//                     isExpanded: true,
//                     hint: Text("${getTranslated(context, 'selectPreferredLocation')}"),
//                     // Down Arrow Icon
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     // Array list of items
//                     items: addJobDataModel?.data?.locations!.map((Locations? items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items?.name ?? ''),
//                       );
//                     }).toList(),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: ( newValue) {
//                       setState(() {
//                         selectedPreferedLocation = newValue;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 5,),
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: EdgeInsets.only(left: 15),
//                   child: Text("${getTranslated(context, 'currentCtc')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
//                 ),
//                 addJobDataModel?.data?.currentCtc?.isEmpty ?? false ?Center(child: CircularProgressIndicator(),) :  Padding(
//                   padding: EdgeInsets.only(left: 15,right: 15),
//                   child: DropdownButton<CurrentCtc>(
//                     // Initial Value
//                     value: currentCTC,
//                     isExpanded: true,
//                     hint: Text("${getTranslated(context, 'currentCtc')}"),
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     // Array list of items
//                     items: addJobDataModel?.data!.currentCtc!.map((CurrentCtc items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items.name ?? ''),
//                       );
//                     }).toList(),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: (  newValue) {
//                       setState(() {
//                         currentCTC = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: EdgeInsets.only(left: 15),
//                   child: Text("${getTranslated(context, 'expectedCtc')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
//                 ),
//                 addJobDataModel?.data!.expectations?.isEmpty ?? false ? Center(child: CircularProgressIndicator(),) :  Padding(
//                   padding: EdgeInsets.only(left: 15,right: 15),
//                   child: DropdownButton<Expectations>(
//                     // Initial Value
//                     value: expected,
//                     isExpanded: true,
//                     hint: Text("${getTranslated(context, 'expectedCtc')}"),
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     // Array list of items
//                     items: addJobDataModel?.data!.expectations!.map((Expectations items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items.name ?? ""),
//                       );
//                     }).toList(),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: (  newValue) {
//                       setState(() {
//                         expected = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//                // CustomTextFormField(label: "Current CTC*", labelColor: greyColor2,fieldcontroller: currentCTCController,),
//                // CustomTextFormField(label: "Expected CTC*", labelColor: greyColor2,fieldcontroller:expectedCtcController,),
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text("${getTranslated(context, 'jobtype')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
//                 ),
//                 addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: DropdownButton<JobTypes>(
//                     // Initial Value
//                     value: selectedJobType,
//                     // Down Arrow Icon
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     isExpanded: true,
//                     hint: Text("${getTranslated(context, 'selectJobType')}"),
//                     // Array list of items
//                     items: addJobDataModel!.data!.jobTypes!.map((JobTypes items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items.name ?? ""),
//                       );
//                     }).toList(),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: (  newValue) {
//                       setState(() {
//                         selectedJobType = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text("${getTranslated(context, 'selectDesignation')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
//                 ),
//                 addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: DropdownButton<Designations>(
//                     // Initial Value
//                     value: selectedDesignation,
//                     isExpanded: true,
//                     hint: Text("${getTranslated(context, 'selectDesignation')}"),
//                     // Down Arrow Icon
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     // Array list of items
//                     items: addJobDataModel!.data!.designations!.map((Designations items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items.name ?? ""),
//                       );
//                     }).toList(),
//
//                     onChanged: (  newValue) {
//                       setState(() {
//                         selectedDesignation = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text("${getTranslated(context, 'jobrole')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
//                 ),
//                 addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: DropdownButton<JobRoles>(
//                     // Initial Value
//                     value: selectedRole,
//                     // Down Arrow Icon
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     isExpanded: true,
//                     hint: Text("${getTranslated(context, 'selectJobRole')}"),
//                     // Array list of items
//                     items: addJobDataModel!.data!.jobRoles!.map((JobRoles items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items.name ?? ""),
//                       );
//                     }).toList(),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: (  newValue) {
//                       setState(() {
//                         selectedRole = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//                 CustomTextFormField(label: "${getTranslated(context, 'keySkills')}", labelColor: greyColor2,fieldcontroller: keySkillController,),
//                 CustomTextFormField(label: "${getTranslated(context, 'percentage')}", labelColor: greyColor2,fieldcontroller: percentageController,),
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Text("${getTranslated(context, 'yearOfExperience')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
//                 ),
//                 addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: DropdownButton<Experiences>(
//                     // Initial Value
//                     value: selectedExperience,
//                     // Down Arrow Icon
//                     isExpanded: true,
//                     hint: Text("${getTranslated(context, 'selectExperience')}"),
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     // Array list of items
//                     items: addJobDataModel!.data!.experiences!.map((Experiences items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items.name ?? ""),
//                       );
//                     }).toList(),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: (  newValue) {
//                       setState(() {
//                         selectedExperience = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//
//                 SizedBox(height: 10,),
//                 Padding(
//                   padding: EdgeInsets.only(left: 15),
//                   child: Text("${getTranslated(context, 'specialization')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
//                 ),
//                 addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
//                   padding: EdgeInsets.only(left: 15,right: 15),
//                   child: DropdownButton<Specializations>(
//                     // Initial Value
//                     value: specialization,
//                     isExpanded: true,
//                     hint: Text("${getTranslated(context, 'specialization')}"),
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     // Array list of items
//                     items: addJobDataModel!.data!.specializations!.map((Specializations items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items.name ?? ""),
//                       );
//                     }).toList(),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: (  newValue) {
//                       setState(() {
//                         specialization = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 Padding(
//                   padding: EdgeInsets.only(left: 15),
//                   child: Text("${getTranslated(context, 'noticePeriods')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
//                 ),
//                 addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
//                   padding: EdgeInsets.only(left: 15,right: 15),
//                   child: DropdownButton<NoticePeriod>(
//                     // Initial Value
//                     value: noticePeriods,
//                     isExpanded: true,
//                     hint: Text("${getTranslated(context, 'noticePeriods')}"),
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     // Array list of items
//                     items: addJobDataModel!.data!.noticePeriod!.map((NoticePeriod items) {
//                       return DropdownMenuItem(
//                         value: items,
//                         child: Text(items.name ?? ""),
//                       );
//                     }).toList(),
//                     // After selecting the desired option,it will
//                     // change button value to selected value
//                     onChanged: (  newValue) {
//                       setState(() {
//                         noticePeriods = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//                  Text("${getTranslated(context, 'uploadResume')}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
//                 InkWell(
//                   onTap: (){
//                       _pickFile();
//                     // FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
//                     //
//                     // if (result != null) {
//                     //  setState(() {
//                     //     resume = File(result.files.single.path.toString());
//                     //  });
//                     // } else {
//                     //   // User canceled the picker
//                     // }
//                   },
//                   child: Card(
//                     elevation: 3,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)
//                     ),
//                     child: Container(
//                       height: 60,
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       alignment: Alignment.centerLeft,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10)
//                       ),
//                       // child: resumeData ==  null  || resumeData == "" ? filesPath == null || filesPath == "" ? Text('Upload resume',style: TextStyle(color: greyColor1,fontSize: 14,fontWeight: FontWeight.w500),) :
//                       // Text("${resumeData}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10),)
//                       //     : Text("${resumeData}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10),),
//                    child: resumeData == null || resumeData == "" ? filesPath == null ?  Text("${getTranslated(context, 'uploadResume')}") : Text("${filesPath}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10),)  : Text("${resumeData}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10),),
//
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 Align(
//                   alignment: Alignment.center,
//                   child: CustomTextButton(buttonText: "${getTranslated(context, 'update')}",
//                     onTap: (){
//                       updateSeekerProfile();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }


import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_dekho_app/Model/AddJobDataModel.dart';
import 'package:job_dekho_app/Model/SeekerProfileModel.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Services/tokenString.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextFormField.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:http/http.dart' as http;
import '../../Utils/CustomWidgets/customTextButton.dart';
import '../../Utils/style.dart';
import 'seekerdrawer_Screen.dart';

class SeekerProfileDetailScreen extends StatefulWidget {
  const SeekerProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<SeekerProfileDetailScreen> createState() => _SeekerProfileDetailScreenState();
}

class _SeekerProfileDetailScreenState extends State<SeekerProfileDetailScreen> {
  var gender;
  var selectedPreferedLocation;
  var specialization;
  var selectedExperience;
  var selectedRole;
  var selectedCurrentRole;
  var selectedDesignation;
  var selectedJobType;
  var selectedQualification;
  var resume;
  var status;
  var profileImage;
  var noticePeriods;

  var yearOfPassing,currentCTC,expected;

  String genders = "";

  SeekerProfileModel? seekerProfileModel;

  String? resumeData;
  getProfileData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString(TokenString.userid);
    var headers = {
      'Cookie': 'ci_session=21ebc11f1bb101ac0f04e6fa13ac04dc55609d2e'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}seeker_info'));
    request.fields.addAll({
      'seeker_email': '$userid'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = SeekerProfileModel.fromJson(json.decode(finalResponse));
      setState(() {
        seekerProfileModel = jsonResponse;
        firstNameController = TextEditingController(text: seekerProfileModel!.data!.name);
        lastNameController = TextEditingController(text: seekerProfileModel!.data!.surname);
        emailController = TextEditingController(text: seekerProfileModel!.data!.email);
        mobileController = TextEditingController(text: seekerProfileModel!.data!.mno);
        // yearOfPassingController = TextEditingController(text: seekerProfileModel!.data!.yp);
        yearOfPassing =  seekerProfileModel!.data!.yp  == ""|| seekerProfileModel!.data!.yp == null  ? null : seekerProfileModel!.data!.yp.toString();
        ageController =  seekerProfileModel!.data!.age == "1" ? TextEditingController(text: "") : TextEditingController(text: seekerProfileModel!.data!.age);
        currentAddressController = TextEditingController(text: seekerProfileModel!.data!.currentAddress);
        keySkillController = TextEditingController(text: seekerProfileModel!.data!.keyskills);
        percentageController = TextEditingController(text: seekerProfileModel!.data!.cgpa);
        //currentCTCController = TextEditingController(text: seekerProfileModel!.data!.current);
        //  expectedCtcController = TextEditingController(text: seekerProfileModel!.data!.expected);
        currentCTC = seekerProfileModel!.data!.current == "" || seekerProfileModel!.data!.current == null  ? null : seekerProfileModel!.data!.current;
        expected = seekerProfileModel!.data!.expected == "" || seekerProfileModel!.data!.current == null ? null : seekerProfileModel!.data!.expected;
        // noticePeriodController = TextEditingController(text: seekerProfileModel!.data!.noticePeriod);
        noticePeriods = seekerProfileModel!.data!.noticePeriod == "" || seekerProfileModel!.data!.noticePeriod == "0" || seekerProfileModel!.data!.noticePeriod == null ? null : seekerProfileModel!.data!.noticePeriod.toString();

        Future.delayed(Duration(seconds: 1),(){
          if(seekerProfileModel!.data!.isProfileUpdated == "0"){
            print("again check here");
            intialFunction();
          }
          else{
            intialFunction();
          }
        });
      });
      print("select qualification here ${selectedQualification}");
    }
    else {
      print(response.reasonPhrase);
    }
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController yearOfPassingController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController currentAddressController = TextEditingController();
  TextEditingController keySkillController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController currentCTCController  = TextEditingController();
  TextEditingController expectedCtcController = TextEditingController();
  TextEditingController noticePeriodController =  TextEditingController();

  intialFunction()async{
    print("working this api here");
    setState(() {
      selectedPreferedLocation = seekerProfileModel!.data!.location == "0" || seekerProfileModel!.data!.location == null ? null : seekerProfileModel!.data!.location.toString() ;
      specialization = seekerProfileModel!.data!.specialization == "0" || seekerProfileModel!.data!.specialization == "" || seekerProfileModel!.data!.specialization == null  ? null : seekerProfileModel!.data!.specialization.toString();
      selectedExperience = seekerProfileModel!.data!.exp == "0" || seekerProfileModel!.data!.exp == null ? null : seekerProfileModel!.data!.exp.toString();
      selectedRole = seekerProfileModel!.data!.jobRole == "0" || seekerProfileModel!.data!.jobRole == null || seekerProfileModel!.data!.jobRole == "" ? null : seekerProfileModel!.data!.jobRole.toString() ;
      selectedDesignation = seekerProfileModel!.data!.designation == "0" || seekerProfileModel!.data!.designation == null || seekerProfileModel!.data!.designation == "" ? null :seekerProfileModel!.data!.designation.toString() ;
      selectedJobType = seekerProfileModel!.data!.jobType == "0" || seekerProfileModel!.data!.jobType == null || seekerProfileModel!.data!.jobType == " " ? null : seekerProfileModel!.data!.jobType.toString() ;
      selectedQualification = seekerProfileModel!.data!.qua == "0" || seekerProfileModel!.data!.qua == null || seekerProfileModel!.data!.qua == "null" ? null : seekerProfileModel!.data!.qua.toString();
      gender = seekerProfileModel!.data!.gender == "0" || seekerProfileModel!.data!.gender == null  ?  "" : seekerProfileModel!.data!.gender.toString();
      // filesPath = seekerProfileModel!.data!.resume == "0" || seekerProfileModel!.data!.resume == null  ? "" : seekerProfileModel!.data!.resume;
      resumeData =  seekerProfileModel!.data!.resume == "0" || seekerProfileModel!.data!.resume == null  ? "" : seekerProfileModel!.data!.resume;
      status = seekerProfileModel!.data!.status == "0" || seekerProfileModel!.data!.status == null  ? "" : seekerProfileModel!.data!.status;
      profileImage = seekerProfileModel!.data!.img == "0" || seekerProfileModel!.data!.img == null ? "" : seekerProfileModel!.data!.img;
    });

    print("resume data here ${resumeData}");
  }

  var filesPath;
  String? fileName;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    setState(() {
      filesPath = result.files.first.path ?? "";
      fileName = result.files.first.name;
      // reportList.add(result.files.first.path.toString());
      resumeData = null;
    });
    var snackBar = SnackBar(
      backgroundColor: primaryColor,
      content: Text('Profile upload successfully'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  AddJobDataModel? addJobDataModel;
  addJobDataFunction()async{
    var headers = {
      'Cookie': 'ci_session=b54ea4dc21bb9562023ebd8c74e28340f129a573'
    };
    var request = http.Request('GET', Uri.parse('${ApiPath.baseUrl}job_post_lists'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = AddJobDataModel.fromJson(json.decode(finalResponse));
      setState(() {
        addJobDataModel = jsonResponse;
      });
      print("final data here ${addJobDataModel!.data!.jobRoles![0].name}");
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 1000),(){
      return getProfileData();
    });
    Future.delayed(Duration(milliseconds: 100),(){
      return addJobDataFunction();
    });
  }

  final ImagePicker _picker = ImagePicker();
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


  updateSeekerProfile()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString(TokenString.userid);
    var headers = {
      'Cookie': 'ci_session=8d12b1698ae8ebfc1747a8f74b92e35634f3150c'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}update_seeker_profile'));
    request.fields.addAll({
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'gender': gender.toString(),
      'qualification': selectedQualification.toString(),
      'year_of_passing': yearOfPassing.toString(),
      'current_address': currentAddressController.text,
      'preferred_location': selectedPreferedLocation.toString(),
      'current_ctc': currentCTC.toString(),
      'expected_ctc': expected.toString(),
      'job_type': selectedJobType.toString(),
      'designation': selectedDesignation.toString(),
      'job_role': selectedRole.toString(),
      'key_skills': keySkillController.text,
      'percentage_cgpa': percentageController.text,
      'work_experience': selectedExperience.toString(),
      'specialization': specialization.toString(),
      'notice_period': noticePeriods.toString(),
      'age': ageController.text,
      'id': userid.toString(),
      'status': status.toString(),
    });

    filesPath == null ? null : request.files.add(await http.MultipartFile.fromPath('resume', filesPath.toString()));
    imageFile == null ? null : request.files.add(await http.MultipartFile.fromPath('image', imageFile!.path.toString()));
    print("params here ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult =  await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResult);
      print("final json response  ${jsonResponse}");
      if(jsonResponse['status'] == 'true'){
        var snackBar = SnackBar(
          backgroundColor: primaryColor,
          content: Text('${jsonResponse['message']}',style: TextStyle(color: Colors.white),),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SeekerDrawerScreen()));
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
  Widget build(BuildContext context){
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: SafeArea(child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.to(SeekerDrawerScreen());
            },
            child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
          ),
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text('My Profile'),
          centerTitle: true,
        ),
        // backgroundColor: primaryColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(90),),
            color: profileBg,
          ),
          alignment: Alignment.center,
          width: size.width,
          height: size.height / 0.35,
          child: SingleChildScrollView(
            child: seekerProfileModel == null  || addJobDataModel == null  ? Center(child: CircularProgressIndicator(),) : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (context){
                          return Container(
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(" Job Portal: Take Image From", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
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
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${getTranslated(context, 'currentLookingForAJob')}", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: primaryColor),),
                    ToggleSwitch(
                      minWidth: 50,
                      minHeight: 30,
                      cornerRadius: 20.0,
                      activeBgColors: [[primaryColor], [primaryColor]],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.grey,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex:status == "Active" ? 1 : 0,
                      totalSwitches: 2,
                      labels: ['${getTranslated(context, 'no')}', '${getTranslated(context, 'yes')}'],
                      radiusStyle: true,
                      onToggle: (index) {
                        print('switched to: $index');
                        if(index == 0){
                          status = "Inactive";
                        }
                        else{
                          status = "Active";
                        }
                        setState(() {
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text("${getTranslated(context, 'personalDetails')}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
                SizedBox(height: 10,),
                CustomTextFormField(label: "${getTranslated(context, 'firstName')}*", labelColor: greyColor2,fieldcontroller: firstNameController,),
                CustomTextFormField(label: "${getTranslated(context, 'lastName')}*", labelColor: greyColor2,fieldcontroller: lastNameController,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("${getTranslated(context, 'gender')}", style: TextStyle(fontSize: 16, color: Colors.grey),),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Radio(
                      activeColor: primaryColor,
                      // title: Text("Male"),
                      value: "male",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    Text("${getTranslated(context, 'male')}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
                    Radio(
                      activeColor: primaryColor,
                      // title: Text("Female"),
                      value: "female",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        }
                        );
                      },
                    ),
                    Text("${getTranslated(context, 'female')}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
                  ],
                ),
                CustomTextFormField(label: "${getTranslated(context, 'email')}*", labelColor: greyColor2,fieldcontroller: emailController,),
                CustomTextFormField(label: "${getTranslated(context, 'mobile')}*", labelColor: greyColor2,fieldcontroller: mobileController,keyboardType: TextInputType.number,),
                //CustomDropDownTextField(labelText: "Qualification*", buttonHintText: "Qualification",droplist: addJobDataModel!.data!.qualifications,selectedValue: selectedQualification,),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("${getTranslated(context, 'qualification')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
                ),
                addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: DropdownButton(
                    // Initial Value
                    value: selectedQualification,
                    isExpanded: true,
                    hint: Text("${getTranslated(context, 'selectQualification')}"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: addJobDataModel!.data!.qualifications!.map((items) {
                      return DropdownMenuItem(
                        value: items.name.toString(),
                        child: Text(items.name.toString()),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (  newValue) {
                      setState(() {
                        selectedQualification = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("${getTranslated(context, 'yearOfExperience')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
                ),
                addJobDataModel == null ? Center(child: CircularProgressIndicator(),) : Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: DropdownButton(
                    // Initial Value
                    value: yearOfPassing,
                    isExpanded: true,
                    hint: Text("Year of passing"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: addJobDataModel!.data!.years!.map((items) {
                      return DropdownMenuItem(
                        value: items.toString(),
                        child: Text(items.toString()),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (  newValue) {
                      setState(() {
                        yearOfPassing = newValue!;
                      });
                    },
                  ),
                ),
                //  CustomTextFormField(label: "Year of Passing*", labelColor: greyColor2,fieldcontroller: yearOfPassingController,keyboardType: TextInputType.number,),
                CustomTextFormField(label: "${getTranslated(context, 'age')}*", labelColor: greyColor2,fieldcontroller: ageController,keyboardType: TextInputType.number,),
                CustomTextFormField(label: "${getTranslated(context, 'currentAddress')}*", labelColor: greyColor2,fieldcontroller:currentAddressController,),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("${getTranslated(context, 'preferredLocation')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
                ),
                addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                    // Initial Value
                    value: selectedPreferedLocation,
                    isExpanded: true,
                    hint: Text("${getTranslated(context, 'preferredLocation')}"),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: addJobDataModel!.data!.locations!.map((items) {
                      return DropdownMenuItem(
                        value: items.name.toString(),
                        child: Text(items.name.toString()),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (  newValue) {
                      setState(() {
                        selectedPreferedLocation = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 5,),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("${getTranslated(context, 'currentCtc')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
                ),
                addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: DropdownButton(
                    // Initial Value
                    value: currentCTC,
                    isExpanded: true,
                    hint: Text("${getTranslated(context, 'currentCtc')}"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: addJobDataModel!.data!.currentCtc!.map((items) {
                      return DropdownMenuItem(
                        value: items.name.toString(),
                        child: Text(items.name.toString()),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (  newValue) {
                      setState(() {
                        currentCTC = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("${getTranslated(context, 'expectedCtc')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
                ),
                addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: DropdownButton(
                    // Initial Value
                    value: expected,
                    isExpanded: true,
                    hint: Text("${getTranslated(context, 'expectedCtc')}"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: addJobDataModel!.data!.expectations!.map((items) {
                      return DropdownMenuItem(
                        value: items.name.toString(),
                        child: Text(items.name.toString()),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (  newValue) {
                      setState(() {
                        expected = newValue!;
                      });
                    },
                  ),
                ),
                // CustomTextFormField(label: "Current CTC*", labelColor: greyColor2,fieldcontroller: currentCTCController,),
                // CustomTextFormField(label: "Expected CTC*", labelColor: greyColor2,fieldcontroller:expectedCtcController,),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("${getTranslated(context, 'jobtype')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
                ),
                addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                    // Initial Value
                    value: selectedJobType,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    isExpanded: true,
                    hint: Text("${getTranslated(context, 'selectJobType')}"),
                    // Array list of items
                    items: addJobDataModel!.data!.jobTypes!.map((items) {
                      return DropdownMenuItem(
                        value: items.name.toString(),
                        child: Text(items.name.toString()),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (  newValue) {
                      setState(() {
                        selectedJobType = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("${getTranslated(context, 'selectDesignation')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
                ),
                addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                    // Initial Value
                    value: selectedDesignation,
                    isExpanded: true,
                    hint: Text("${getTranslated(context, 'selectDesignation')}"),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: addJobDataModel!.data!.designations!.map((items) {
                      return DropdownMenuItem(
                        value: items.name.toString(),
                        child: Text(items.name.toString()),
                      );
                    }).toList(),

                    onChanged: (  newValue) {
                      setState(() {
                        selectedDesignation = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("${getTranslated(context, 'jobrole')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
                ),
                addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                    // Initial Value
                    value: selectedRole,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    isExpanded: true,
                    hint: Text("${getTranslated(context, 'selectJobRole')}"),
                    // Array list of items
                    items: addJobDataModel!.data!.jobRoles!.map((items) {
                      return DropdownMenuItem(
                        value: items.name.toString(),
                        child: Text(items.name.toString()),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (  newValue) {
                      setState(() {
                        selectedRole = newValue!;
                      });
                    },
                  ),
                ),
                CustomTextFormField(label: "${getTranslated(context, 'keySkills')}*", labelColor: greyColor2,fieldcontroller: keySkillController,),
                CustomTextFormField(label: "${getTranslated(context, 'percentage')}", labelColor: greyColor2,fieldcontroller: percentageController,),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text("${getTranslated(context, 'yearOfExperience')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
                ),
                addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                    // Initial Value
                    value: selectedExperience,
                    // Down Arrow Icon
                    isExpanded: true,
                    hint: Text("${getTranslated(context, 'selectExperience')}"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: addJobDataModel!.data!.experiences!.map((items) {
                      return DropdownMenuItem(
                        value: items.name.toString(),
                        child: Text(items.name.toString()),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (  newValue) {
                      setState(() {
                        selectedExperience = newValue!;
                      });
                    },
                  ),
                ),

                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("${getTranslated(context, 'Specilization')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
                ),
                addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: DropdownButton(
                    // Initial Value
                    value: specialization,
                    isExpanded: true,
                    hint: Text("${getTranslated(context, 'Specilization')}"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: addJobDataModel!.data!.specializations!.map((items) {
                      return DropdownMenuItem(
                        value: items.name.toString(),
                        child: Text(items.name.toString()),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (  newValue) {
                      setState(() {
                        specialization = newValue!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("${getTranslated(context, 'noticePeriods')}", style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
                ),
                addJobDataModel == null ? Center(child: CircularProgressIndicator(),) :  Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: DropdownButton(
                    // Initial Value
                    value: noticePeriods,
                    isExpanded: true,
                    hint: Text("${getTranslated(context, 'noticePeriods')}"),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: addJobDataModel!.data!.noticePeriod!.map((items) {
                      return DropdownMenuItem(
                        value: items.name.toString(),
                        child: Text(items.name.toString()),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (  newValue) {
                      setState(() {
                        noticePeriods = newValue!;
                      });
                    },
                  ),
                ),
                const Text("Upload Resume (DOCX/PDF)", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                InkWell(
                  onTap: (){
                    _pickFile();
                    // FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
                    //
                    // if (result != null) {
                    //  setState(() {
                    //     resume = File(result.files.single.path.toString());
                    //  });
                    // } else {
                    //   // User canceled the picker
                    // }
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      // child: resumeData ==  null  || resumeData == "" ? filesPath == null || filesPath == "" ? Text('Upload resume',style: TextStyle(color: greyColor1,fontSize: 14,fontWeight: FontWeight.w500),) :
                      // Text("${resumeData}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10),)
                      //     : Text("${resumeData}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10),),
                      child: resumeData == null || resumeData == "" ? filesPath == null ?  Text("Upload Resume") : Text("${filesPath}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10),)  : Text("${resumeData}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 10),),

                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: CustomTextButton(buttonText: "${getTranslated(context, 'update')}",
                    onTap: (){
                      updateSeekerProfile();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
