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

class JobDetailsScreen2 extends StatefulWidget {
  var model;

  JobDetailsScreen2({ this.model});

  @override
  State<JobDetailsScreen2> createState() => _JobDetailsScreen2State();
}

class _JobDetailsScreen2State extends State<JobDetailsScreen2> {

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

    print("checking final data here ${widget.model}");
    final size = MediaQuery.of(context).size;
    final val = widget.model.hiringProcess!.split(",");
    for(var i=0;i<val.length;i++){
      hiringList.add(val[i]);
    }

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
                      isBorder: true,
                      specialzation: '${widget.model.specialization}' ,
                        companyName: '${widget.model.companyName}',
                        button1Text: "${widget.model.max}",
                        button2Text: "${widget.model.location}"),
                    MiddleWidget(
                      isBorder: true,
                        jobId: '${widget.model.id}',
                        jobType: "${widget.model.jobType}",
                        designation: "${widget.model.designation}",
                        qualification: "${widget.model.qualification}",
                        // specializaiton: "ActivX Jobs",
                        specialization: "${widget.model.specialization}",
                        lastdate: "${widget.model.endDate}"),
                    BottomWidget(
                      isBorder: true,
                      jobDescription:"${widget.model.description}",
                      roi1: hiringList,
                    ),
                widget.model.isApplied == true ? CustomTextButton(buttonText: "${getTranslated(context, 'applied')}",onTap: (){
                  var snackBar = SnackBar(
                    backgroundColor: primaryColor,
                    content: Text('${getTranslated(context, 'Already_apply')}'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },)  :
               CustomTextButton(buttonText: "${getTranslated(context, 'apply')}",onTap: (){
                      applyJob();
                    },)
                  ],
                ),
              )
          ),
        ));
  }
}
