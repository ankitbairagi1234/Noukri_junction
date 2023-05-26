import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Model/NotificationModel.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Services/tokenString.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customNotificaitonTile.dart';
import 'package:job_dekho_app/Views/Recruiter/recruiterdrawer_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/style.dart';
import 'Job Seeker/seekerdrawer_Screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  NotificationModel? notificationModel;

  getNotification()async{
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    String? userId =  prefs.getString(TokenString.userid);
    String? userType = prefs.getString(TokenString.userType);
    var headers = {
      'Cookie': 'ci_session=02b83a34e1d77ffc1cbb416ed25f3358f458f8bc'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}getNotification'));
    request.fields.addAll({
      'id': '${userId.toString()}',
      'type': '${userType.toString()}'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = NotificationModel.fromJson(json.decode(finalResponse));
      setState(() {
        notificationModel = jsonResponse;
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
      return getNotification();
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
              title:  Text('${getTranslated(context, 'notification')}', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),
            ),
          body: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
                color: Colors.white
            ),

            width: size.width,
            height: size.height,
            child: notificationModel == null ? Center(child: CircularProgressIndicator()) : notificationModel!.data!.length == 0 ? Center(child: Text("${getTranslated(context, 'noNotificationToShow')}"),) : ListView.builder(
              padding: EdgeInsets.only(
                top: 35,bottom: 10
              ),
              shrinkWrap: true,
                itemCount: notificationModel!.data!.length,
                itemBuilder: (c,i){
              return   Padding(
                padding: EdgeInsets.only(bottom: 10),
                child:  CustomNotificaitonTile(username: "${notificationModel!.data![i].title}", time: '${notificationModel!.data![i].date1}',msg: "${notificationModel!.data![i].message}",)
              );
            })
          )
        ));
  }
}
