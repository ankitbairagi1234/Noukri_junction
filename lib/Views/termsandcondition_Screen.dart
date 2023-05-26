import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Views/Recruiter/recruiterdrawer_Screen.dart';

import '../Utils/style.dart';
import 'Job Seeker/seekerdrawer_Screen.dart';
import 'package:http/http.dart' as http;

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionScreen> createState() => _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {

    var TermConditionData;

  getTermCondition()async{
    var headers = {
      'Cookie': 'ci_session=9ff3faec3b11769c4d8f70378f2b79c31810097e'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}allpage'));
    request.fields.addAll({
      'type': 'Terms & Condition'
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
              title:  Text('${getTranslated(context, 'Trm_condition')}', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
                  color: Colors.white
              ),
              width: size.width,
              height: size.height,
              child: TermConditionData == null || TermConditionData == "" ? Center(child: CircularProgressIndicator(),) : ListView(

                children: [
                  Html(data: TermConditionData),
                ],
              ),
            )
        ));
  }
}
