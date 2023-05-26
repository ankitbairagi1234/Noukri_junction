import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:job_dekho_app/Model/AllJobModel.dart';
import '../Services/api_path.dart';
import '../Utils/style.dart';
import 'Job Seeker/seekerdrawer_Screen.dart';
import 'Recruiter/recruiterdrawer_Screen.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

  var TermConditionData;

  getTermCondition()async{
    var headers = {
      'Cookie': 'ci_session=9ff3faec3b11769c4d8f70378f2b79c31810097e'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}allpage'));
    request.fields.addAll({
      'type': 'Privacy Policy'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse  = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      setState(() {
        TermConditionData = jsonResponse['data']['body'];
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

    Future.delayed(Duration(milliseconds: 200),(){
      return getTermCondition();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
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
                //Icon(Icons.arrow_back_ios, color: whiteColor, size: 22),
              ),
              title:  Text('${getTranslated(context, 'Privacy_policy')}', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),

            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
                  color: Colors.white
              ),
              width: size.width,
              height: size.height,
              child: TermConditionData == null  || TermConditionData == "" ? Center(child: CircularProgressIndicator(),) : ListView(
                children: [
                 // Text("${TermConditionData}", style:  TextStyle(fontSize: 14,),),
                  Html(data: TermConditionData),
                ],
              ),
            )
        ));
  }
}
