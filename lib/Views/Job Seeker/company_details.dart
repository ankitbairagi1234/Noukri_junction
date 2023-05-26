import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_dekho_app/Model/RecruiterDetailModel.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Services/tokenString.dart';
import 'package:job_dekho_app/Utils/iconUrl.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/JobDetailScreen1.dart';
import 'package:job_dekho_app/Views/Recruiter/recruiterdrawer_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/CustomWidgets/customJobDetailsCard.dart';
import '../../Utils/style.dart';
import 'jobDetailScreen2.dart';
import 'jobdetails_Screen.dart';

class CompanyDetails extends StatefulWidget {
  final String? id;
  CompanyDetails({this.id});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {

  RecruiterDetailModel? recruiterDetailModel;

  getRecruiterDetail()async{
    print("sdsds ${widget.id}");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var headers = {
      'Cookie': 'ci_session=098ac49b7659ec1528e9017f60d95cd19ea6776d'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}all_recruiters/${widget.id}'));
    String? userid = prefs.getString(TokenString.userid);
    request.fields.addAll({
      'logged_id': '$userid'
    });
    print("oooooooooo ${userid} ${ApiPath.baseUrl}all_recruiters/${widget.id}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse =  await response.stream.bytesToString();
      final jsonResponse = RecruiterDetailModel.fromJson(json.decode(finalResponse));
      print("sdsdfs ${jsonResponse.data}");
      setState(() {
        recruiterDetailModel = jsonResponse;
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
      return getRecruiterDetail();
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
              ),
              title:  Text('${getTranslated(context, 'Company_details')}', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            body:  Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
                  color: backgroundColor
              ),
              alignment: Alignment.center,
              width: size.width,
              height: size.height,
              child:recruiterDetailModel == null ? Center(child: CircularProgressIndicator(),) : recruiterDetailModel!.data!.length == 0 ? Center(child: Text("No Recruiter to see"),) : ListView.builder(
                shrinkWrap: true,
                  itemCount: recruiterDetailModel!.data!.length,
                  itemBuilder: (c,i){
                return Column(
                  children: [
                    SizedBox(height: 50,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: 227,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Card(
                            elevation: 4,
                            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Container(
                                height: 150,
                                padding: EdgeInsets.only(left: 10,right: 10,top: 35,bottom: 10),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(width: 05,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 20,),
                                              Text("${recruiterDetailModel!.data![0].company!.toUpperCase()}", style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor),),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  Image.asset(vacancyIcon, color: primaryColor, scale: 1.5,),
                                                  SizedBox(width: 15,),
                                                  Text("${getTranslated(context, 'Active_Post')}", style: TextStyle(color: greyColor2),),
                                                ],
                                              ),
                                              SizedBox(height: 05,),
                                              Row(
                                                children: [
                                                  Image.asset('assets/companydetails1.png', color: primaryColor, scale: 1.5,),
                                                  SizedBox(width: 15,),
                                                  Container(
                                                      width: MediaQuery.of(context).size.width/1.5,
                                                      child: Text("${recruiterDetailModel!.data![0].website}", style: TextStyle(color: greyColor2),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ]
                                )
                            ),
                          ),
                          Positioned(
                            bottom: 140,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: CircleAvatar(
                                radius: 40,
                                child: recruiterDetailModel!.data![0].img == null || recruiterDetailModel!.data![0].img == "" ? Image.asset('assets/companydetailslogo.png', scale: 2,) : ClipRRect(borderRadius: BorderRadius.circular(100),child: Image.network("${recruiterDetailModel!.data![0].img}",fit: BoxFit.fill,),) ,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Card(
                        elevation: 4,
                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Container(
                            width:MediaQuery.of(context).size.width,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 05,),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10,bottom: 10,left: 8,right: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${getTranslated(context, 'Company_Description')}", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: primaryColor),),
                                            SizedBox(height: 10,),
                                            Container(

                                              width: MediaQuery.of(context).size.width/1.2,
                                              child: Text("${recruiterDetailModel!.data![0].des}",style: TextStyle(color: greyColor2,fontSize: 13),maxLines: 4,overflow: TextOverflow.ellipsis,),),

                                            SizedBox(height: 5,),
                                            Text("Email: ${recruiterDetailModel!.data![0].email}",style: TextStyle(fontWeight: FontWeight.w600),),
                                            SizedBox(height: 5,),
                                            Text("Number: ${recruiterDetailModel!.data![0].mno}",style: TextStyle(fontWeight: FontWeight.w600),)

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                ]
                            )
                        ),

                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding:  EdgeInsets.only(top: 10,bottom: 10,left: 16,right: 16),
                      child: Container(

                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Image.asset("assets/companydetails2.png",)),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: recruiterDetailModel!.data![0].job!.length,
                        itemBuilder: (c,i){
                      return  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => JobDetailsScreen2(model: recruiterDetailModel!.data![0].job![i])));
                            },
                            child: Container(
                                width: 360,
                                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Job ID : " + "#"+ recruiterDetailModel!.data![0].job![i].id.toString(),style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                                    Text("Company Name:".toUpperCase(),style: TextStyle(fontWeight:FontWeight.w600, fontSize: 14),),
                                    Text("${recruiterDetailModel!.data![0].job![i].companyName}".toUpperCase(),style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                                    SizedBox(height: 5,),
                                    Text("${recruiterDetailModel!.data![0].job![i].designation}",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold, fontSize: 14),),
                                    SizedBox(height: 10,),
                                   Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            child:Image.asset(ruppeeIcon,fit: BoxFit.fill,),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Container(

                                                width: MediaQuery.of(context).size.width/1.55,
                                                child: Text("${recruiterDetailModel!.data![0].job![i].min} - ${recruiterDetailModel!.data![0].job![i].max} Per ${recruiterDetailModel!.data![0].job![i].salaryRange}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ),)),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            child:Image.asset(experienceIcon),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: Container(

                                                width: MediaQuery.of(context).size.width/1.55,
                                                child: Text(" ${recruiterDetailModel!.data![0].job![i].experience} years of experience required", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ),)),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Material(
                                          elevation: 3,
                                          borderRadius: BorderRadius.circular(10),
                                          child:Container(
                                              padding: EdgeInsets.symmetric(horizontal: 3),
                                              width: 85,
                                              height: 35,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: primaryColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(vacancyIcon, scale: 1.5,),
                                                  SizedBox(width: 4,),
                                                  Text("${recruiterDetailModel!.data![0].job![i].noOfVaccancies}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor),),
                                                ],
                                              )
                                          ),
                                        ),
                                        Material(
                                          elevation: 2,
                                          borderRadius: BorderRadius.circular(10),
                                          child:Container(
                                              padding: EdgeInsets.symmetric(horizontal: 3),
                                              width: 140,
                                              height: 35,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: primaryColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(locationIcon,scale: 1.5,),
                                                  SizedBox(width: 6,),
                                                  Container(
                                                    // width: 95,
                                                      child: recruiterDetailModel!.data![0].job![i].location == null || recruiterDetailModel!.data![0].job![i].location == "null"  ? Text("") : Text(recruiterDetailModel!.data![0].job![i].location.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor,),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                                                ],
                                              )
                                          ),
                                        ),
                                      ],
                                    )

                                  ],
                                )
                            ),
                          ),
                        ),
                      );
                    //     JobDetailCard(
                    //   onCardTap: (){Get.to(JobDetailsScreen2(model: recruiterDetailModel!.data![0].job![i],));},
                    // jobId: "${recruiterDetailModel!.data![0].job![i].id}",
                    // companyname: "${recruiterDetailModel!.data![0].job![i].companyName}",
                    // designation: "${recruiterDetailModel!.data![0].job![i].designation}",
                    // button1Text:" 115",
                    // button2Text: '${recruiterDetailModel!.data![0].job![i].location}',);
                    })
                  ],
                );
              })
            )
        ));
  }
}
