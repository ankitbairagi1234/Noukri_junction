import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_dekho_app/Model/AllRecruiterModel.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/searchRecruiters.dart';
import 'package:job_dekho_app/Views/Recruiter/recruiterprofiledetails_Screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Utils/CustomWidgets/customButton.dart';
import '../../Utils/CustomWidgets/customJobDetailsCard.dart';
import '../../Utils/iconUrl.dart';
import '../../Utils/style.dart';
import 'jobdetails_Screen.dart';
import 'seekerdrawer_Screen.dart';
import 'company_details.dart';
import 'package:http/http.dart' as http;

class AllRecruiters extends StatefulWidget {
  const AllRecruiters({Key? key}) : super(key: key);

  @override
  State<AllRecruiters> createState() => _AllRecruitersState();
}

class _AllRecruitersState extends State<AllRecruiters> {

  AllRecruiterModel? allRecruiterModel;
  getAllRecruiterList()async{
    var headers = {
      'Cookie': 'ci_session=b2c63ad9a1350c2ef462afeb0661e0ab3249d138'
    };
    var request = http.Request('GET', Uri.parse('${ApiPath.baseUrl}all_recruiters'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse =  await response.stream.bytesToString();
      final jsonResponse = AllRecruiterModel.fromJson(json.decode(finalResponse));
      setState(() {
        allRecruiterModel = jsonResponse;
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
      return getAllRecruiterList();
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
              Get.to(SeekerDrawerScreen());
            },
            child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
          ),
          title: Text('${getTranslated(context, 'allRecruiters')}'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          actions: [
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchAllRecruiter()));
                },
                child: Image.asset(searchIcon, scale: 1.8,)),
          ],
        ),
        body: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(90))
            ),
            padding: EdgeInsets.only(left: 16,right: 16,top: 25,bottom: 10),
            child:  allRecruiterModel == null ? Center(child: CircularProgressIndicator(),) : allRecruiterModel!.data!.length == 0 ? Center(child: Text("No recruiter found"),) : ListView.builder(
              shrinkWrap: true,
                itemCount: allRecruiterModel!.data!.length,
                itemBuilder: (c,i){
              return Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          color: blue,
                          border: Border.all(color: whiteColor),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 22,
                                  child: allRecruiterModel!.data![i].img == null ? Image.asset('assets/recruiters.png', scale: 2,) : ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network("${allRecruiterModel!.data![i].img}",fit: BoxFit.fill,),),
                                ),
                                SizedBox(width: 05,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Organization ID #${allRecruiterModel!.data![i].id}", style: TextStyle(fontWeight: FontWeight.bold,color: whiteColor),),
                                    Container(
                                        width: MediaQuery.of(context).size.width/1.6,
                                        child: Text("Consultancy Name: ${allRecruiterModel!.data![i].company!.toUpperCase()}", style: TextStyle(fontWeight: FontWeight.bold,color: whiteColor),maxLines: 2,)),
                                    Container(
                                        width: MediaQuery.of(context).size.width/1.6,
                                        child: Text("Company HR: ${allRecruiterModel!.data![i].name}", style: TextStyle(fontWeight: FontWeight.bold,color: whiteColor),maxLines: 2,)),

                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Image.asset('assets/AuthAssets/callicon.png', color: whiteColor, scale: 1.5,),
                                        SizedBox(width: 15,),
                                        Text("${allRecruiterModel!.data![i].mno}", style: TextStyle(color: whiteColor),),
                                      ],
                                    ),
                                    SizedBox(height: 05,),
                                    Row(
                                      children: [
                                        Image.asset('assets/AuthAssets/emailicon.png', color: whiteColor, scale: 1.5,),
                                        SizedBox(width: 15,),
                                        Container(
                                            width: MediaQuery.of(context).size.width/1.7,
                                            child: Text("${allRecruiterModel!.data![i].email}", style: TextStyle(color: whiteColor),maxLines: 2,)),
                                      ],
                                    ), SizedBox(height: 05,),
                                    Row(
                                      children: [
                                        Image.asset('assets/AuthAssets/locationicon.png', color: whiteColor, scale: 1.5,),
                                        SizedBox(width: 15,),
                                        Container(
                                            width: MediaQuery.of(context).size.width/1.7,
                                            child: Text("${allRecruiterModel!.data![i].address}", style: TextStyle(color: whiteColor),maxLines: 2,)),
                                      ],
                                    ),


                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomButton(buttonText: "Details", onTap: (){Get.to(CompanyDetails(id: allRecruiterModel!.data![i].id,));}),
                                CustomButton(buttonText: "Call HR", onTap: ()async{
                                  var url = "tel:${allRecruiterModel!.data![i].mno}";
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }),
                              ],
                            )
                          ]
                      )
                  ),
                ),
              );
            })
        )
    ));
  }
}
