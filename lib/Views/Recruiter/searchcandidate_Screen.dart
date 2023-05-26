import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/candidateDetailCard.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customButton.dart';
import 'package:job_dekho_app/Views/Recruiter/CandidateProfile.dart';
import 'package:job_dekho_app/Views/Recruiter/recruiterdrawer_Screen.dart';
import 'package:job_dekho_app/Views/Recruiter/recruiterprofiledetails_Screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Model/SearchCandidateModel.dart';
import '../../Utils/style.dart';
class SearchCandidateScreen extends StatelessWidget {

  final SearchCandidateModel? model;
  SearchCandidateScreen({this.model});

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
                  Get.to(DrawerScreen());
                },
                child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
              ),
              title:  Text('${getTranslated(context, 'Search_Candidate')}', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            body: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
                  color: Colors.white
              ),
              // alignment: Alignment.center,
              width: size.width,
              height: size.height,
              child: model == null ? Center(child: CircularProgressIndicator(),) : model!.data!.length == 0 ? Center(child: Text("No candidate found"),) :  ListView.builder(
                padding: EdgeInsets.only(top: 20),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: model!.data!.length,
                  itemBuilder: (c,i){
                return  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                        width: 360,
                        height: 200,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 32,
                                    child: model!.data![i].img ==  null || model!.data![i].img == "" ? Image.asset('assets/candidateImage.png', scale: 2,) : ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image.network("${model!.data![i].img}",fit: BoxFit.fill,)),
                                  ),
                                  SizedBox(width: 05,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Seeker ID: #${model!.data![i].id}", style: TextStyle(fontWeight: FontWeight.bold,color: whiteColor),),
                                      Text("Seeker Name: " +  "${model!.data![i].name}".toUpperCase() + " " + "${model!.data![i].surname}".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold,color: whiteColor),),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Image.asset('assets/AuthAssets/callicon.png', color: primaryColor, scale: 1.5,),
                                          SizedBox(width: 15,),
                                          Text("${model!.data![i].mno}", style: TextStyle(color: whiteColor),),
                                        ],
                                      ),
                                      SizedBox(height: 05,),
                                      Row(
                                        children: [
                                          Image.asset('assets/AuthAssets/emailicon.png', color: primaryColor, scale: 1.5,),
                                          SizedBox(width: 15,),
                                          Text("${model!.data![i].email}", style: TextStyle(color: whiteColor),),
                                        ],
                                      ),


                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomButton(buttonText: "Details", onTap: (){Get.to(RecruiterProfileDetailScreen1(model: model!.data![i],));}),
                                  CustomButton(buttonText: "Call", onTap: ()async{
                                      var url = "tel:${model!.data![i].mno}";
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
