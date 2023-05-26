import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Model/AllJobModel.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Services/tokenString.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/Seeker_JobDetails_Widgets/bottom_widget.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/Seeker_JobDetails_Widgets/middle_widget.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/Seeker_JobDetails_Widgets/top_widget.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTextButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/style.dart';
import 'seekerdrawer_Screen.dart';
import 'package:http/http.dart' as http;

class JobDetailsScreen1 extends StatefulWidget {
   var model;

  JobDetailsScreen1({ this.model});

  @override
  State<JobDetailsScreen1> createState() => _JobDetailsScreen1State();
}

class _JobDetailsScreen1State extends State<JobDetailsScreen1> {

  List<String> hiringList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  applyJob()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString(TokenString.userid);
    var headers = {
      'Cookie': 'ci_session=d94df475d407fbbdbf0991effdc7a97eb3c53099'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}apply_job_post'));
    request.fields.addAll({
      'post_id': '${widget.model!.id}',
      'user_id': '${userid}'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult =  await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResult);
      print("final json Response ${jsonResponse}");
      if(jsonResponse['status'] == 'true'){
        var snackBar = SnackBar(
          content: Text('${jsonResponse['message']}'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      Navigator.pop(context);
      setState(() {
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final val = widget.model!.job!.hiringProcess!.split(",");
    for(var i=0;i<val.length;i++){
      hiringList.add(val[i]);
    }
      print("sdfs ${widget.model!.job.specialization}");
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: (){
              Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
            ),
            elevation: 0,
            backgroundColor: primaryColor,
            title: Image.asset('assets/jobdekho_logo.png', scale: 3.5),
            centerTitle: true,
          ),
          body: Container(
              width: size.width,
              height: size.height * 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90))
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopWidget(
                        isBorder: false,
                   //   specialzation: "",
                      specialzation: "${widget.model!.job!.specialization}",
                        companyName: '${widget.model!.job!.companyName}',
                        button1Text: "${widget.model!.job!.max}",
                        button2Text: "${widget.model!.job.location}"),
                    MiddleWidget(
                        isBorder: false,
                        jobId: '${widget.model!.job!.id}',
                        jobType: "${widget.model!.job!.jobType}",
                        designation: "${widget.model!.job!.designation}",
                        qualification: "${widget.model!.job!.qualification}",
                        // specializaiton: "ActivX Jobs",
                        specialization: "ds",
                        lastdate: "${widget.model!.job!.endDate}"),
                    BottomWidget(
                      isBorder: false,
                      jobDescription:"${widget.model!.job!.description}",
                      roi1: hiringList,
                    ),
                    // CustomTextButton(buttonText: "Apply",onTap: (){
                    //   applyJob();
                    // },)
                  ],
                ),
              )
          ),
        ));
  }
}
