import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Services/tokenString.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/SeekerAppliedJob.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/CustomWidgets/customJobDetailsCard.dart';
import '../../Utils/style.dart';
import 'JobDetailScreen1.dart';
import 'jobdetails_Screen.dart';
import 'seekerdrawer_Screen.dart';
import 'package:http/http.dart' as http;

class AppliedJobScreen extends StatefulWidget {
  const AppliedJobScreen({Key? key}) : super(key: key);

  @override
  State<AppliedJobScreen> createState() => _AppliedJobScreenState();
}

class _AppliedJobScreenState extends State<AppliedJobScreen> {

    SeekerAppliedJob? seekerAppliedJob;
  getMyAppliedJob()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString(TokenString.userid);
    print("user id here ${userid}");
    var headers = {
      'Cookie': 'ci_session=d94df475d407fbbdbf0991effdc7a97eb3c53099'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}my_applied_jobs'));
    request.fields.addAll({
      'user_id': '${userid}'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse  = await response.stream.bytesToString();
      final jsonResponse = SeekerAppliedJob.fromJson(json.decode(finalResponse));
      setState(() {
        seekerAppliedJob = jsonResponse;
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
      return getMyAppliedJob();
    });
  }
    Future _refresh() async{
     return getMyAppliedJob();

    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
            title: Text('${getTranslated(context, 'appliedJob')}', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),
            centerTitle: true,
          ),
          body:  RefreshIndicator(
            onRefresh: _refresh,
            child: Container(
              // width: size.width,
               height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90))
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: seekerAppliedJob == null ? Center(child: CircularProgressIndicator(),) : seekerAppliedJob!.data!.length == 0 ? Center(child: Text("${getTranslated(context, 'noJobToSee')}"),) : ListView.builder(
                    itemCount: seekerAppliedJob!.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (c,i){
                      if(seekerAppliedJob!.data![i].job == null){
                        return SizedBox.shrink();
                      }
                      else{
                        return  JobDetailCard(
                          onCardTap: (){Get.to(JobDetailsScreen1(model: seekerAppliedJob!.data![i],));},
                          jobId: "${seekerAppliedJob!.data![i].job!.id}",
                          companyname: "${seekerAppliedJob!.data![i].job!.companyName}",
                          designation: "${seekerAppliedJob!.data![i].job!.designation}",
                          button1Text: "${seekerAppliedJob!.data![i].job!.noOfVaccancies}",
                          button2Text: '${seekerAppliedJob!.data![i].job!.location}',
                        );
                      }

              }),
            ),
          ),
        ));
  }
}

