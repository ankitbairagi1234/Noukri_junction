import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customDropDownTextField.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextFormField.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customButtonWithIcon.dart';
import 'package:job_dekho_app/Views/Recruiter/searchcandidate_Screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../Model/AddJobDataModel.dart';
import '../../Utils/style.dart';

class RecruiterProfileDetailScreen extends StatefulWidget {
   RecruiterProfileDetailScreen({Key? key,this.model}) : super(key: key);
     var model;
  @override
  State<RecruiterProfileDetailScreen> createState() => _RecruiterProfileDetailScreenState();
}

class _RecruiterProfileDetailScreenState extends State<RecruiterProfileDetailScreen> {

  var _value;
  var _value1;



  downloadFile(String url, String filename) async {
    print('${url}');
    print("working here or not");
    var status = await Permission.storage.request();
    print("chekcing status here");
    if(status.isGranted){
      FileDownloader.downloadFile(
          url: "${url}",
          name: "${filename}",
          onDownloadCompleted: (path) {
            print(path);
            String tempPath = path.toString().replaceAll(
                "Download", "JobDekho");
            final File file = File(tempPath);
            print("path here ${file}");
            var snackBar = SnackBar(
              backgroundColor: primaryColor,
              content: Text('Resume Saved in your gallery'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //This will be the path of the downloaded file
          });
    }
    else {
      await Permission.storage.request();
    }
  }

  Future<String> createFolderInAppDocDir(String folderNames) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.accessMediaLocation,
     // Permission.manageExternalStorage,
      Permission.storage,
    ].request();
   // var manage = await Permission.manageExternalStorage.status;
    var media = await Permission.accessMediaLocation.status;
    if(media==PermissionStatus.granted){

    print(statuses[Permission.location]);
    //Get this App Document Directory

    // final Directory? _appDocDir = await getTemporaryDirectory();
    // //App Document Directory + folder name
    // final Directory _appDocDirFolder =
    // Directory('${_appDocDir!.path}/$folderName/');
    //
    // if (await _appDocDirFolder.exists()) {
    //   //if folder already exists return path
    //   print("checking directory path ${_appDocDirFolder.path} and ${_appDocDirFolder}");
    //   return _appDocDirFolder.path;
    // } else {
    //   //if folder not exists create folder and then return its path
    //   final Directory _appDocDirNewFolder =
    //   await _appDocDirFolder.create(recursive: true);
    //   print("checking directory path 1111 ${_appDocDirFolder.path} and ${_appDocDirFolder}");
    //   return _appDocDirNewFolder.path;
    // }
    final folderName = folderNames;
    final path= Directory("storage/emulated/0/$folderName");
    final path1 =  await getExternalStorageDirectory();
    print("ssdsds ${path1}");
    print("11111111111 ${path}");
    var status = await Permission.storage.status;
    print("mmmmmmmmmmm ${status} and ${status.isGranted}");
    if (!status.isGranted) {
      print("chacking status ${status.isGranted}");
      await Permission.storage.request();
    }
    print(" path here ${path} and ${await path.exists()}");
    if ((await path.exists())) {
      // final taskId = await FlutterDownloader.enqueue(
      //   url: '${widget.model.user.resume}/report.pdf',
      //   headers: {}, // optional: header send with url (auth token etc)
      //   savedDir: '$path',
      //   showNotification: true, // show download progress in status bar (for Android)
      //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
      // );
      // print("okokko ${taskId}");
      print("here path is ${path}");
     // var dir = await DownloadsPathProvider.
      print("ooooooooo and $path/$folderNames");
      // await Dio().download(
      //     widget.model.user.resume.toString(),
      //     '$path/$folderNames/',
      //     onReceiveProgress: (received, total) {
      //       print("kkkkkkkk ${received} and $path/$folderNames");
      //       if (total != -1) {
      //        // print((received / total * 100).toStringAsFixed(0) + "%");
      //       }
      //     });
      return path.path;
    } else {
      print("here path is 1 ${path}");
      path.create();
      return path.path;
    }}else{
      print("permission denied");
    }
    return "";
  }

String newValue = "";

  String? gender;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(" path here now ${widget.model.user.resume}");
    var vs = widget.model.user.resume.toString().split("https://developmentalphawizz.com/job_portal/uploads/resume/");

    return SafeArea(child: Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
        ),
        title:  Text('Profile Details', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
            color: profileBg
        ),
        alignment: Alignment.center,
        width: size.width,
        height: size.height / 0.35,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child:  Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor
                ),
                child: widget.model.user.img != null || widget.model.user.img != "" ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network("${widget.model.user.img}",fit: BoxFit.fill,),) : Image.asset('assets/ProfileAssets/sampleprofile.png'),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Currently looking for a Job", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: primaryColor),),
                ToggleSwitch(
                  minWidth: 50,
                  minHeight: 26,
                  cornerRadius: 20.0,
                  activeBgColors: [[primaryColor], [primaryColor]],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: ['No', 'Yes'],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text("Personal Details", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
            SizedBox(height: 20,),

            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("First Name*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: widget.model.user.name == null || widget.model.user.name == "" ? Text("First name",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),) : Text("${widget.model.user.name}"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Last Name*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child:widget.model.user.surname == null || widget.model.user.name == "" ? Text("Last name",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),) : Text("${widget.model.user.surname}"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Gender*", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: greyColor1),),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      // setState(() {
                      //   selectedIndex = 1;
                      // });
                    },
                    child: Container(
                      child:
                      Row(
                        children: [
                          Container(
                            height:20,
                            width: 20,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: widget.model.user.gender == "male"  ? primaryColor : greyColor1,width: 2)
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: widget.model.user.gender == "male"  ? primaryColor : Colors.transparent,
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("Male",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      // setState(() {
                      //   selectedIndex = 2;
                      // });
                    },
                    child: Container(
                      child:
                      Row(
                        children: [
                          Container(
                            height:20,
                            width: 20,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: widget.model.user.gender == "female"  ? primaryColor : greyColor1,width: 2)
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:widget.model.user.gender == "female"  ? primaryColor : Colors.transparent,
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("Female",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Enter Email*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.email}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Mobile No.*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.mno}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Qualification*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.qua}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Year of Passing*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.yp}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Current Address*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.currentAddress}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Preferred Location*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.location}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Current CTC*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.current}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Expected CTC*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.expected}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Job Type*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.jobType}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Designation*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.designation}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Job Role*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.jobRole}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Key Skills*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.keyskills}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Percentage/CGPA*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.cgpa}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Age*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.age}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Specialization*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.specialization}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Work Experience*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.exp}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Notice Period*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.noticePeriod}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Resume*",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 5,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.model.user.resume}",style: TextStyle(color: greyColor1,fontSize: 13,fontWeight: FontWeight.w600),),
                    ),
                  ),
                ],
              ),
            ),
            // CustomTextFormField(label: "First Name*", labelColor: greyColor2,),
            // CustomTextFormField(label: "Last Name*", labelColor: greyColor2,),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text("   Gender*", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: greyColor1),),
            // ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Row(
            //       children: [
            //         Radio(
            //           activeColor: primaryColor,
            //           // title: Text("Male"),
            //           value: "male",
            //           groupValue: gender,
            //           onChanged: (value){
            //             setState(() {
            //               gender = value.toString();
            //             });
            //           },
            //         ),
            //         Text("Male", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),)
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         Radio(
            //           activeColor: primaryColor,
            //           // title: Text("Female"),
            //           value: "female",
            //           groupValue: gender,
            //           onChanged: (value){
            //             setState(() {
            //               gender = value.toString();
            //             }
            //             );
            //           },
            //         ),
            //         Text("Female", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
            //       ],
            //     )
            //   ],
            // ),

            // no use
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Row(
            //       children: [
            //         Radio(value: 0, groupValue: _value, onChanged: (value){}),
            //         Text('Male', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold ),),
            //       ],
            //     ),
            //     Row(
            //       children: [
            //         Radio(value: 1, groupValue: _value1, onChanged: (value1){}),
            //         Text('Female', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold ),),
            //       ],
            //     )
            //   ],
            // ),


            // CustomTextFormField(label: "Email*", labelColor: greyColor2,),
            // CustomTextFormField(label: "Mobile*", labelColor: greyColor2,),
            // CustomDropDownTextField(labelText: "Qualification*", buttonHintText: "Qualification",),
            // CustomTextFormField(label: "Year of Passing*", labelColor: greyColor2,),
            // CustomTextFormField(label: "Age*", labelColor: greyColor2,),
            // CustomTextFormField(label: "Current Address*", labelColor: greyColor2,),
            // CustomDropDownTextField(labelText: "Preferred Location", buttonHintText: "Location"),
            // CustomDropDownTextField(labelText: "Current CTC*", buttonHintText: "Current CTC"),
            // CustomDropDownTextField(labelText: "Expected CTC*", buttonHintText: "Expected CTC"),
            // CustomDropDownTextField(labelText: "Job Type*", buttonHintText: "Job Type"),
            // CustomDropDownTextField(labelText: "Designation*", buttonHintText: "Designation CTC"),
            // CustomDropDownTextField(labelText: "Current Job Role*", buttonHintText: "Job Role"),
            // CustomDropDownTextField(labelText: "Job Role*", buttonHintText: "Job Role"),
            // CustomTextFormField(label: "Key Skills*", labelColor: greyColor2,),
            // CustomTextFormField(label: "Percentage/CGPA*", labelColor: greyColor2,),
            // CustomDropDownTextField(labelText: "Work Experience*", buttonHintText: "Work Experience"),
            // CustomDropDownTextField(labelText: "Specialization*", buttonHintText: "Specilization"),
            // CustomDropDownTextField(labelText: "Notice Period*", buttonHintText: "Select"),
            // Text("Resume (DOCX/PDF)", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
            SizedBox(height: 20,),
            Align(
              child: CustomButtonWithIcon(buttonText: "Download", buttonIcon: Image.asset('assets/ContactUsAssets/downloadIcon.png', color: primaryColor, scale: 1.4,),onTap: (){
                // createFolderInAppDocDir('JobDekho');
                print("okokokok");
                downloadFile("${widget.model.user.resume.toString()}", "Resume");
              },),
            )
          ],
        ),
      ),
    ));
  }
}
