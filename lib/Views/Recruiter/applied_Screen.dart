import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Model/RecruiterAppliedListModel.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Services/tokenString.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customProfileCard.dart';
import 'package:job_dekho_app/Views/Recruiter/recruiterprofiledetails_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/style.dart';
import 'recruiterdrawer_Screen.dart';
import 'package:http/http.dart' as http;

class applied_Screen extends StatefulWidget {
  const applied_Screen({Key? key}) : super(key: key);

  @override
  State<applied_Screen> createState() => _applied_ScreenState();
}

class _applied_ScreenState extends State<applied_Screen> {

  RecruiterAppliedListModel? recruiterAppliedListModel;
  getAppliedJob()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString(TokenString.userid);
    var headers = {
      'Cookie': 'ci_session=218613165fc077462ad3e9c593f9cde5943a82a6'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}applied_lists'));
    request.fields.addAll({
      'user_id': "${userid}"
    });
    print("param here ${request.fields} and ${ApiPath.baseUrl}applied_lists");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = RecruiterAppliedListModel.fromJson(json.decode(finalResponse));
      setState(() {
        recruiterAppliedListModel = jsonResponse;
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
    Future.delayed(Duration(milliseconds: 500),(){
      return getAppliedJob();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.to(DrawerScreen());
          },
          child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text("${getTranslated(context, 'Applied')}"),
        centerTitle: true,
      ),
      body:  Container(
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: 18),
        height: size.height,
        decoration : BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(70))
        ),
        child:recruiterAppliedListModel == null ? Center(child: CircularProgressIndicator(),) : recruiterAppliedListModel!.data!.length == 0 ? Center(child:Text("${getTranslated(context, 'noDataToShow')}"),) : ListView.builder(
          shrinkWrap: true,
            itemCount: recruiterAppliedListModel!.data!.length,
            itemBuilder: (c,i){
          return  CustomProfileCard(
            jobId: "${recruiterAppliedListModel!.data![i].jobId}",name: "${recruiterAppliedListModel!.data![i].user!.name}" + " " +  " " + "${recruiterAppliedListModel!.data![i].user!.surname.toString()}", mobileNumber: "${recruiterAppliedListModel!.data![i].user!.mno}", email: '${recruiterAppliedListModel!.data![i].user!.email}',
            onTap: (){Get.to(RecruiterProfileDetailScreen(model: recruiterAppliedListModel!.data![i],));},
          );
        })
      )
    ));
  }
}
