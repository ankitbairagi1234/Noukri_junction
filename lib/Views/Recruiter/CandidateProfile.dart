import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

import 'package:job_dekho_app/Utils/CustomWidgets/customButtonWithIcon.dart';

import 'package:toggle_switch/toggle_switch.dart';

import '../../Model/AddJobDataModel.dart';
import '../../Utils/style.dart';

class RecruiterProfileDetailScreen1 extends StatefulWidget {
  RecruiterProfileDetailScreen1({Key? key,this.model}) : super(key: key);
  var model;
  @override
  State<RecruiterProfileDetailScreen1> createState() => _RecruiterProfileDetailScreen1State();
}

class _RecruiterProfileDetailScreen1State extends State<RecruiterProfileDetailScreen1> {

  var _value;
  var _value1;

  // downloadFile(String url, String filename) async {
  //   print('${url}');
  //   print("working here or not");
  //   var status = await Permission.storage.status;
  //     print("status is here ${status} and ${status.isDenied}");
  //     FileDownloader.downloadFile(
  //         url: "${url}",
  //         name: "${filename}",
  //         onDownloadCompleted: (path) {
  //           print(path);
  //           String tempPath = path.toString().replaceAll(
  //               "Download", "JobDekho");
  //           final File file = File(tempPath);
  //           print("path here ${file}");
  //           var snackBar = SnackBar(
  //             backgroundColor: primaryColor,
  //             content: Text('Resume Saved in your gallery'),
  //           );
  //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //           //This will be the path of the downloaded file
  //         });
  //
  //
  //   // print("chekcing status here ${status}");
  //   // if(status.isGranted){
  //   //
  //   // }
  //   // else {
  //   //   await Permission.storage.request();
  //   // }
  // }
  downloadFile(String url, String filename) async {
    FileDownloader.downloadFile(
        url: "${url}",
        name: "${filename}",
        onDownloadCompleted: (path) {
          print(path);
          String tempPath = path.toString().replaceAll("Download", "DR Apps");
          final File file = File(tempPath);
          print("path here ${file}");
          var snackBar = SnackBar(
            backgroundColor: primaryColor,
            content: Row(
              children: [
                const Text('Resume Saved in your storage'),
                // TextButton(onPressed: (){}, child: Text("View"))
              ],
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //This will be the path of the downloaded file
        });
  }

  // downloadFile(String url, String filename) async {
  //   FileDownloader.downloadFile(
  //       url: "${url}",
  //       name: "${filename}",
  //       onDownloadCompleted: (path) {
  //         print(path);
  //         String tempPath = path.toString().replaceAll("Download", "DR Apps");
  //         final File file = File(tempPath);
  //         print("path here ${file}");
  //         var snackBar = SnackBar(
  //           backgroundColor: primaryColor,
  //           content: Row(
  //             children: [
  //               const Text('doctorapp Saved in your storage'),
  //               TextButton(onPressed: (){}, child: Text("View"))
  //             ],
  //           ),
  //         );
  //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //         //This will be the path of the downloaded file
  //       });
  // }


  String? gender;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        title:  Text('${getTranslated(context, 'peofile_details')}', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),
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
                child: widget.model.img != null || widget.model.img != "" ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network("${widget.model.img}",fit: BoxFit.fill,),) : Image.asset('assets/ProfileAssets/sampleprofile.png'),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${getTranslated(context, 'currentLookingForAJob')}", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: primaryColor),),
                ToggleSwitch(
                  minWidth: 60,
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
            Text("${getTranslated(context, 'personalDetails')}", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
            SizedBox(height: 20,),

            Container(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("${getTranslated(context, 'firstName')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: widget.model.name == null || widget.model.name == "" ? Text("First name",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),) : Text("${widget.model.name}"),
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
                    child: Text("${getTranslated(context, 'lastName')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child:widget.model.surname == null || widget.model.name == "" ? Text("Last name",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),) : Text("${widget.model.surname}"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("${getTranslated(context, "gender")}", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: greyColor1),),
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
                                border: Border.all(color: widget.model.gender == "male"  ? primaryColor : greyColor1,width: 2)
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: widget.model.gender == "male"  ? primaryColor : Colors.transparent,
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("${getTranslated(context, 'male')}",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)
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
                                border: Border.all(color: widget.model.gender == "Female"  ? primaryColor : greyColor1,width: 2)
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color:widget.model.gender == "Female"  ? primaryColor : Colors.transparent,
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text("${getTranslated(context, 'female')}",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)
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
                    child: Text("${getTranslated(context, 'Entre_Email')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.email}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'mobileNo')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.mno}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, "yearOfPassing")}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.qua}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, "yearOfPassing")}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.yp}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'currentAddress')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.currentAddress}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'preferredLocation')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.location}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'currentCtc')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.current}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'expectedCtc')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.expected}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, "jobtype")}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.jobType}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'designation')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.designation}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'job_role')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.jobRole}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'Skill')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.keyskills}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'percentage')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.cgpa}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'experience')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.exp}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'Specilization')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.specialization}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'noticePeriods')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.noticePeriod}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                    child: Text("${getTranslated(context, 'resume_')}",style: TextStyle(color: greyColor1,fontSize: 15,fontWeight: FontWeight.w600),),
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
                      child: Text("${widget.model.resume}",style: TextStyle(color: greyColor1,fontSize: 13,fontWeight: FontWeight.w600),),
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
                downloadFile("${widget.model.resume.toString()}", "resume.pdf");
              },),
            )
          ],
        ),
      ),
    ));
  }
}
