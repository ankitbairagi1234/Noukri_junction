import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTile.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/logowithtextTile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Services/api_path.dart';
import '../Utils/style.dart';
import 'Job Seeker/seekerdrawer_Screen.dart';
import 'Recruiter/recruiterdrawer_Screen.dart';
import 'package:http/http.dart' as http;

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  var TermConditionData;

  getTermCondition()async{
    print("working upto here");
    var headers = {
      'Cookie': 'ci_session=9ff3faec3b11769c4d8f70378f2b79c31810097e'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}allpage'));
    request.fields.addAll({
      'type': ""
    });
    print("sdsds ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("status code here ${response.statusCode}");
    if (response.statusCode == 200) {
      print("wokring this also");
      var finalResponse  = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
        print("okokoko ${jsonResponse}");
      setState(() {
        TermConditionData = jsonResponse;
      });
   //   print("checking reesult here ${TermConditionData} and ${TermConditionData['data']['cotnact']} and ${TermConditionData['data'].contact} and ${TermConditionData.data.contact}");
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

  openwhatsapp(String number) async {
    var whatsapp = "${number}";
    // var whatsapp = "+919644595859";
    var whatsappURl_android = "whatsapp://send?phone=" + whatsapp +
        "&text=Hello, I am messaging from Feed Mart App, I am interested in your products, Can we have chat? ";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("Whatsapp does not exist in this device")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("Whatsapp does not exist in this device")));
      }
    }
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
            title:  Text('${getTranslated(context, 'contactUs')}', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          body: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
            ),
            child: TermConditionData == null || TermConditionData == "" ? Center(child: CircularProgressIndicator(),)  : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Container(
                      height: 150,
                      width: 180,
                      child: Image.asset("assets/ContactUsAssets/contactusIcon.png",fit: BoxFit.fill,color: primaryColor,)),
                  SizedBox(height: 30,),
                  Text("${getTranslated(context, 'increaseOfAnyQueriesOrAssistanceKindlyContactWithUs')}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),textAlign: TextAlign.center,),
                  SizedBox(height: 30,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      InkWell(
                          onTap:()async{
                            var url = "tel:${TermConditionData['data']['contact']}}";
                            if (await canLaunch(url)) {
                            await launch(url);
                            } else {
                            throw 'Could not launch $url';
                            }
                          },
                          child: LogoWithText(labelText: "${TermConditionData['data']['contact']}", imageIcon: Image.asset('assets/ContactUsAssets/call.png', scale: 1.2,))),

                      InkWell(
                          onTap: ()async{
                            openwhatsapp("${TermConditionData['data']['whatsapp']}");
                          },
                          child: LogoWithText(labelText: "${TermConditionData['data']['whatsapp']}", imageIcon: Image.asset('assets/ContactUsAssets/whatsapp.png', scale: 1.2,),)),

                      InkWell(
                          onTap: ()async{
                            String email = Uri.encodeComponent("${TermConditionData['data']['email']}");
                            Uri mail = Uri.parse("mailto:$email");
                            // const url = 'mailto: ${widget.email}';
                            if(await canLaunch(mail.toString())){
                              await launch(mail.toString());
                            }else {
                              throw 'Could not launch $mail';
                            }
                          },
                          child: LogoWithText(labelText: "${TermConditionData['data']['email']}", imageIcon: Image.asset('assets/ContactUsAssets/email.png', scale: 1.2,))),

                       InkWell(
                           onTap: () => launch('${TermConditionData['data']['instagram']}'),

                           child: LogoWithText(labelText: "${TermConditionData['data']['instagram']}", imageIcon: Image.asset('assets/ContactUsAssets/instagram.png', scale: 1.2,))),
                       InkWell(
                           onTap: () => launch('${TermConditionData['data']['facebook']}'),
                           child: LogoWithText(labelText: "${TermConditionData['data']['facebook']}", imageIcon: Image.asset('assets/ContactUsAssets/facebook.png', scale: 1.2,)))
                    ],
                  ),)
                ],

              ),
            ),
          )
    ));
  }
}
