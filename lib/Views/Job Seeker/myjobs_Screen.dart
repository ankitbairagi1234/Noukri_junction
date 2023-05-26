import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Model/AllJobModel.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Services/push_notification_service.dart';
import 'package:job_dekho_app/Services/tokenString.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/FilterPage.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/jobdetails_Screen.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/seekerdrawer_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/AddJobDataModel.dart';
import '../../Model/SeekerProfileModel.dart';
import '../../Utils/CustomWidgets/customJobDetailsCard.dart';
import '../../Utils/iconUrl.dart';
import '../../Utils/style.dart';

class MyJobs_Screen extends StatefulWidget {
  const MyJobs_Screen({Key? key}) : super(key: key);

  @override
  State<MyJobs_Screen> createState() => _MyJobs_ScreenState();
}

class _MyJobs_ScreenState extends State<MyJobs_Screen> {


  Future _refresh() async{
  return getAllJobs();

  }

  AllJobModel? allJobModel;
  getAllJobs()async{
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    String? userid = prefs.getString(TokenString.userid);
    var headers = {
      'Cookie': 'ci_session=e07de35ed476bd0faf9c8e903187fab7a7d5bee0'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}job_lists'));
    request.fields.addAll({
      'logged_id': '$userid'
    });
    print("logged_id here ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = AllJobModel.fromJson(json.decode(finalResponse));
      setState(() {
        allJobModel = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  String? userName;
  String? userProfile;
  getSharedData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString(TokenString.userName);
  }

  SeekerProfileModel? seekerProfileModel;

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
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PushNotificationService pushNotificationService = new PushNotificationService(context: context);
    pushNotificationService.initialise();
    Future.delayed(Duration(milliseconds: 500),(){
      return getAllJobs();
    });
    Future.delayed(Duration(milliseconds: 500),(){
      return getSharedData();
    });
    Future.delayed(Duration(milliseconds: 500),(){
      return getProfileData();
    });
  }

  // openDialog(){
  //   return showDialog(context: context, builder: (context){
  //     return StatefulBuilder(builder: (context,setState){
  //       return AlertDialog(
  //         title: Text("Are you sure want to exit app ?",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
  //         content: Row(
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             InkWell(
  //               onTap: (){
  //                 //deleteApp();
  //                 Navigator.pop(context,true);
  //                 Navigator.pop(context,true);
  //               },
  //               child: Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 10),
  //                 alignment: Alignment.center,
  //                 height: 40,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(6),
  //                   color: Colors.green,
  //                 ),
  //                 child:  Text("Confirm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14),),
  //               ),
  //             ),
  //             SizedBox(width: 10,),
  //             InkWell(
  //               onTap: (){
  //                 Navigator.pop(context);
  //               },
  //               child: Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 10),
  //                 alignment: Alignment.center,
  //                 height: 40,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(6),
  //                   color: Colors.red,
  //                 ),
  //                 child:  Text("Cancel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14),),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     });
  //   });
  // }

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
            title: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Center(child: Text("${getTranslated(context, 'naukariJunction')}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100, color: Colors.white),))
                // Image.asset('assets/jobdekho_logo.png', scale: 3.5)
            ),
            centerTitle: true,
            actions: [
           //   Image.asset(searchIcon, scale: 1.8,),
              InkWell(
                  onTap:()async{
                  AllJobModel result =  await Navigator.push(context, MaterialPageRoute(builder: (context) => FilterPgae()));
                  setState(() {
                    allJobModel = result;
                  });
                  },
                  child: Image.asset(filterIcon, scale: 1.8,)),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: _refresh,
            child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(90))
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                   seekerProfileModel == null ? SizedBox.shrink() : Row(
                      children: [
                       seekerProfileModel!.data!.img == null ? Image.asset(sampleProfileImage, scale: 3,) : CircleAvatar(
                         radius: 30,
                         backgroundImage: NetworkImage("${seekerProfileModel!.data!.img}"),
                       ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${getTranslated(context, 'welcomeBack')}"),
                            Text(userName ==  null || userName == "" ? "" : "${userName}".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor, fontSize: 22),)
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: allJobModel == null ? Center(child: CircularProgressIndicator(),) :  allJobModel!.data!.length == 0 ? Center(child: Text("No data found"),) : ListView.builder(
                          itemCount: allJobModel!.data!.length,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (c,i){
                            return JobDetailCard(jobId: allJobModel!.data![i].id.toString(), companyname: allJobModel!.data![i].companyName.toString(), designation: allJobModel!.data![i].designation.toString(), button1Text: "${allJobModel!.data![i].noOfVaccancies}", button2Text: "${allJobModel!.data![i].location}",onCardTap: (){Get.to(JobDetailsScreen(model: allJobModel!.data![i],));},);
                          }),
                    ),
                  ],
                )
            ),
          )
      )),
    );
  }
}
