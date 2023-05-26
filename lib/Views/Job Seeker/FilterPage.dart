import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_dekho_app/Model/SearchCandidateModel.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Services/tokenString.dart';
import 'package:job_dekho_app/Utils/style.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/seekerdrawer_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:job_dekho_app/Views/Recruiter/searchcandidate_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/AddJobDataModel.dart';
import '../../Model/AllJobModel.dart';

class FilterPgae extends StatefulWidget {
  const FilterPgae({Key? key}) : super(key: key);

  @override
  State<FilterPgae> createState() => _FilterPgaeState();
}

class _FilterPgaeState extends State<FilterPgae> {

  int currentIndex = 1;
  int jobTypeIndex = 0;

  List JobTypeList = [];
  List locationList = [];
  List designationList = [];
  List qualificationList = [];
  List experienceist = [];
  List jobRoleList = [];
  List skillList = [];
  List exptectedList = [];
  List noticePeriodList = [];
  List specializationList = [];

    TextEditingController locationController = TextEditingController();
    TextEditingController skillController = TextEditingController();
    TextEditingController expectedCTCController = TextEditingController();
    TextEditingController noticePeriodController=  TextEditingController();

    var designation;
    var qualification;
    var experience;
    var jobRole;


  AddJobDataModel? addJobDataModel;
  addJobDataFunction()async{
    var headers = {
      'Cookie': 'ci_session=b54ea4dc21bb9562023ebd8c74e28340f129a573'
    };
    var request = http.Request('GET', Uri.parse('${ApiPath.baseUrl}job_post_lists'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = AddJobDataModel.fromJson(json.decode(finalResponse));
      setState(() {
        addJobDataModel = jsonResponse;
      });
      print("final data here ${addJobDataModel!.data!.jobRoles![0].name}");
    }
    else {
      print(response.reasonPhrase);
    }
  }

  String? userType;
  getSharedData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userType = prefs.getString(TokenString.userType);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){
      return getSharedData();
    });
    Future.delayed(Duration(seconds: 1),(){
      return addJobDataFunction();
    });

  }

  SearchCandidateModel? searchCandidateModel;

  var newJobType,newLocation,newDesignation,newQualification,newExperience,newSkill,newJobRole,newExptectedCTC,newNoticePeriod,newSpecialization;

  searchCandidate()async{

    newJobType = JobTypeList.join(",");
    newLocation = locationList.join(",");
    newDesignation = designationList.join(",");
    newQualification = qualificationList.join(",");
    newExperience = experienceist.join(",");
    newSkill = skillList.join(",");
    newJobRole = jobRoleList.join(",");
    newExptectedCTC = exptectedList.join(",");
    newNoticePeriod = noticePeriodList.join(",");
    newSpecialization = specializationList.join(",");

    var headers = {
      'Cookie': 'ci_session=26cd91f2343081c76d73d176a32b875d72c65b57'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}search_candidate'));
    request.fields.addAll({
      'job_type': newJobType.toString(),
      'location':newLocation.toString(),
      'designation': newDesignation.toString(),
      'qualification': newQualification.toString(),
      'experience': newExperience.toString(),
      'specialization': newSpecialization.toString(),
      'skill': newSkill.toString(),
      'job_role': newJobRole.toString(),
      'expected_ctc': newExptectedCTC.toString(),
      'notice_period': newNoticePeriod.toString()
    });
    print("paramter are here ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = SearchCandidateModel.fromJson(json.decode(finalResponse));
      print("final response here ${jsonResponse}");
      setState(() {
        searchCandidateModel = jsonResponse;
      });
      print("final length here ${searchCandidateModel!.data!.length}");
      Navigator.push(context,MaterialPageRoute(builder: (context) => SearchCandidateScreen(model: searchCandidateModel)));
    }
    else {
      print(response.reasonPhrase);
    }

  }

  AllJobModel? allJobModel;
  searchJob()async{
    newJobType = JobTypeList.join(",");
    newLocation = locationList.join(",");
    newDesignation = designationList.join(",");
    newQualification = qualificationList.join(",");
    newExperience = experienceist.join(",");
    newSkill = skillList.join(",");
    newJobRole = jobRoleList.join(",");
    newExptectedCTC = exptectedList.join(",");
    newNoticePeriod = noticePeriodList.join(",");
    newSpecialization = specializationList.join(",");
    var headers = {
      'Cookie': 'ci_session=9a100fa4c08088df707964d2dd73b4284498ceee'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}job_lists'));
    request.fields.addAll({
      'job_type': newJobType.toString(),
      'location':newLocation.toString(),
      'designation': newDesignation.toString(),
      'qualification': newQualification.toString(),
      'experience': newExperience.toString(),
      'specialization':newSpecialization.toString(),
    });
    print("params here ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = AllJobModel.fromJson(json.decode(finalResponse));
      setState(() {
        allJobModel = jsonResponse;
      });
      Navigator.pop(context,allJobModel);
    }
    else {
      print(response.reasonPhrase);
    }

  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child:


   userType == null || userType == ""  ? Container(
       color: Colors.white,
       child: Center(child: CircularProgressIndicator(),)) : Scaffold(
      backgroundColor: primaryColor,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
              // Get.to(DrawerScreen());
            },
            child: userType == 'seeker' ?  Icon(Icons.arrow_back_ios, color: whiteColor, size: 20) : Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
          ),
          elevation: 0,
          backgroundColor: primaryColor,
          title: userType == "seeker" ? Text("Filter") : Text("${getTranslated(context, "Search_Candidate")}"),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(onPressed: (){
                print("working hre");
                if(userType == "seeker"){
                  print("print 1");
                  searchJob();
                }else{
                  print("print 2");
                  searchCandidate();
                }

              }, icon: Icon(Icons.check,color: Colors.white,))
            )
          ],
        ),
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(90))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width/2.5,
              color: primaryColor.withOpacity(0.2),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10),
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          color:  currentIndex == 1 ? primaryColor : Colors.transparent,
                        height: 45,
                        child: Text("${getTranslated(context, 'Job_type')}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: currentIndex == 1 ? Colors.white: Colors.black),)),
                  ),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color:  currentIndex == 2 ? primaryColor : Colors.transparent,
                      height: 45,
                      child: Text("${getTranslated(context, 'location')}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: currentIndex == 2 ? Colors.white: Colors.black),),
                    ),
                  ),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color:  currentIndex == 3 ? primaryColor : Colors.transparent,
                      height: 45,
                      child: Text("${getTranslated(context, 'Designation')}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: currentIndex == 3 ? Colors.white: Colors.black),),
                    ),
                  ),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        currentIndex =  4;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color:  currentIndex == 4 ? primaryColor : Colors.transparent,
                      height: 45,
                      child: Text("${getTranslated(context, 'qualification')}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: currentIndex == 4 ? Colors.white: Colors.black),),
                    ),
                  ),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: (){
                     setState(() {
                       currentIndex = 5;
                     });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color:  currentIndex == 5 ? primaryColor : Colors.transparent,
                      height: 45,
                      child: Text("${getTranslated(context, 'experience')}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: currentIndex == 5 ? Colors.white: Colors.black),),
                    ),
                  ),
                  SizedBox(height: 5,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        currentIndex = 6;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color: currentIndex == 6 ? primaryColor : Colors.transparent,
                      height: 45,
                      child: Text("${getTranslated(context, 'Specilization')}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: currentIndex == 6 ? Colors.white: Colors.black),),
                    ),
                  ),
                  SizedBox(height: 5,),
                userType == "seeker" ?  SizedBox.shrink() :  InkWell(
                    onTap: (){
                      setState(() {
                        currentIndex = 7;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color: currentIndex == 7 ? primaryColor : Colors.transparent,
                      height: 45,
                      child: Text("${getTranslated(context, 'Skill')}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: currentIndex == 7 ? Colors.white: Colors.black),),
                    ),
                  ),
                  SizedBox(height: 5,),
                  userType == "seeker" ?  SizedBox.shrink() :  InkWell(
                    onTap: (){
                      setState(() {
                        currentIndex = 8;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color: currentIndex == 8 ? primaryColor : Colors.transparent,
                      height: 45,
                      child: Text("${getTranslated(context, 'job_role')}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: currentIndex == 8 ? Colors.white: Colors.black),),
                    ),
                  ),
                  SizedBox(height: 5,),
                  userType == "seeker" ?  SizedBox.shrink() :    InkWell(
                    onTap: (){
                      setState(() {
                        currentIndex = 9;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color: currentIndex == 9 ? primaryColor : Colors.transparent,
                      height: 45,
                      child: Text("${getTranslated(context, 'expectedCtc')}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: currentIndex == 9 ? Colors.white: Colors.black),),
                    ),
                  ),
                  SizedBox(height: 5,),
                  userType == "seeker" ?  SizedBox.shrink() :    InkWell(
                    onTap: (){
                      setState(() {
                        currentIndex = 10;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      color: currentIndex == 10 ? primaryColor : Colors.transparent,
                      height: 45,
                      child: Text("${getTranslated(context, 'noticePeriods')}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color: currentIndex == 10 ? Colors.white: Colors.black),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              width: MediaQuery.of(context).size.width/1.7,
              height: MediaQuery.of(context).size.height,
              child:

             currentIndex == 1 ?
             Container(
               child: addJobDataModel == null ? Center(child: Text("No data to show"),) : addJobDataModel!.data!.jobTypes!.length == 0 ? Center(child: Text("No Job Type is available"),) : ListView.builder(
                   shrinkWrap: true,
                   itemCount: addJobDataModel!.data!.jobTypes!.length,
                   itemBuilder: (c,i){
                     return InkWell(
                       onTap: (){
                         print("working function");
                         if(JobTypeList.contains('${addJobDataModel!.data!.jobTypes![i].name}')){
                           setState(() {
                             JobTypeList.remove('${addJobDataModel!.data!.jobTypes![i].name}');
                           });
                           print("remove function");
                         }
                         else{
                           setState(() {
                             JobTypeList.add('${addJobDataModel!.data!.jobTypes![i].name}');
                           });
                           print("add function");
                         }
                       },
                       child: Container(
                         margin: EdgeInsets.only(bottom: 8),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height:20,
                               width: 20,
                               decoration: BoxDecoration(
                                   border: Border.all(color: primaryColor,width: 2)
                               ),
                               child: JobTypeList.contains('${addJobDataModel!.data!.jobTypes![i].name}') ? Icon(Icons.check,size: 15,) : SizedBox.shrink(),
                             ),
                             SizedBox(width: 5,),
                             Container(

                                 width: MediaQuery.of(context).size.width/3,
                                 child: Text("${addJobDataModel!.data!.jobTypes![i].name}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,))
                           ],
                         ),
                       ),
                     );
                   }),
             ) :  currentIndex == 2 ?
            Container(
              child: addJobDataModel == null ? Center(child: Text("No data to show"),) : addJobDataModel!.data!.locations!.length == 0 ? Center(child: Text("No Location is available"),) : ListView.builder(
                shrinkWrap: true,
                  itemCount: addJobDataModel!.data!.locations!.length,
                  itemBuilder: (c,i){
                return InkWell(
                  onTap: (){
                    print("working function");
                    if(locationList.contains('${addJobDataModel!.data!.locations![i].name}')){
                      setState(() {
                        locationList.remove('${addJobDataModel!.data!.locations![i].name}');
                      });
                      print("remove function");
                    }
                    else{
                      setState(() {
                        locationList.add('${addJobDataModel!.data!.locations![i].name}');
                      });
                      print("add function");
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height:20,
                          width: 20,
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor,width: 2)
                          ),
                          child: locationList.contains('${addJobDataModel!.data!.locations![i].name}') ? Icon(Icons.check,size: 15,) : SizedBox.shrink(),
                        ),
                        SizedBox(width: 5,),
                        Container(

                            width: MediaQuery.of(context).size.width/3,
                            child: Text("${addJobDataModel!.data!.locations![i].name}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,))
                      ],
                    ),
                  ),
                );
              }),
            )
                 : currentIndex == 3 ?
             Container(
               child: addJobDataModel == null ? Center(child: Text("No data to show"),) : addJobDataModel!.data!.designations!.length == 0 ? Center(child: Text("No designation is available"),) : ListView.builder(
                   shrinkWrap: true,
                   itemCount: addJobDataModel!.data!.designations!.length,
                   itemBuilder: (c,i){
                     return InkWell(
                       onTap: (){
                         print("working function");
                         if(designationList.contains('${addJobDataModel!.data!.designations![i].name}')){
                           setState(() {
                             designationList.remove('${addJobDataModel!.data!.designations![i].name}');
                           });
                           print("remove function");
                         }
                         else{
                           setState(() {
                             designationList.add('${addJobDataModel!.data!.designations![i].name}');
                           });
                           print("add function");
                         }
                       },
                       child: Container(
                         margin: EdgeInsets.only(bottom: 8),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height:20,
                               width: 20,
                               decoration: BoxDecoration(
                                   border: Border.all(color: primaryColor,width: 2)
                               ),
                               child: designationList.contains('${addJobDataModel!.data!.designations![i].name}') ? Icon(Icons.check,size: 15,) : SizedBox.shrink(),
                             ),
                             SizedBox(width: 5,),
                             Container(

                                 width: MediaQuery.of(context).size.width/3,
                                 child: Text("${addJobDataModel!.data!.designations![i].name}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,))
                           ],
                         ),
                       ),
                     );
                   }),
             ) : currentIndex == 4 ?
             Container(
               child: addJobDataModel == null ? Center(child: Text("No data to show"),) : addJobDataModel!.data!.qualifications!.length == 0 ? Center(child: Text("No qualification is available"),) : ListView.builder(
                   shrinkWrap: true,
                   itemCount: addJobDataModel!.data!.qualifications!.length,
                   itemBuilder: (c,i){
                     return InkWell(
                       onTap: (){
                         print("working function");
                         if(qualificationList.contains('${addJobDataModel!.data!.qualifications![i].name}')){
                           setState(() {
                             qualificationList.remove('${addJobDataModel!.data!.qualifications![i].name}');
                           });
                           print("remove function");
                         }
                         else{
                           setState(() {
                             qualificationList.add('${addJobDataModel!.data!.qualifications![i].name}');
                           });
                           print("add function");
                         }
                       },
                       child: Container(
                         margin: EdgeInsets.only(bottom: 8),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height:20,
                               width: 20,
                               decoration: BoxDecoration(
                                   border: Border.all(color: primaryColor,width: 2)
                               ),
                               child: qualificationList.contains('${addJobDataModel!.data!.qualifications![i].name}') ? Icon(Icons.check,size: 15,) : SizedBox.shrink(),
                             ),
                             SizedBox(width: 5,),
                             Container(

                                 width: MediaQuery.of(context).size.width/3,
                                 child: Text("${addJobDataModel!.data!.qualifications![i].name}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,))
                           ],
                         ),
                       ),
                     );
                   }),
             ) : currentIndex == 5 ?
             Container(
               child: addJobDataModel == null ? Center(child: Text("No data to show"),) : addJobDataModel!.data!.experiences!.length == 0 ? Center(child: Text("No experience is available"),) : ListView.builder(
                   shrinkWrap: true,
                   itemCount: addJobDataModel!.data!.experiences!.length,
                   itemBuilder: (c,i){
                     return InkWell(
                       onTap: (){
                         print("working function");
                         if(experienceist.contains('${addJobDataModel!.data!.experiences![i].name}')){
                           setState(() {
                             experienceist.remove('${addJobDataModel!.data!.experiences![i].name}');
                           });
                           print("remove function");
                         }
                         else{
                           setState(() {
                             experienceist.add('${addJobDataModel!.data!.experiences![i].name}');
                           });
                           print("add function");
                         }
                       },
                       child: Container(
                         margin: EdgeInsets.only(bottom: 8),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height:20,
                               width: 20,
                               decoration: BoxDecoration(
                                   border: Border.all(color: primaryColor,width: 2)
                               ),
                               child: experienceist.contains('${addJobDataModel!.data!.experiences![i].name}') ? Icon(Icons.check,size: 15,) : SizedBox.shrink(),
                             ),
                             SizedBox(width: 5,),
                             Container(

                                 width: MediaQuery.of(context).size.width/3,
                                 child: Text("${addJobDataModel!.data!.experiences![i].name}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,))
                           ],
                         ),
                       ),
                     );
                   }),
             ) : currentIndex == 6 ?
             Container(
               child: addJobDataModel == null ? Center(child: Text("No data to show"),) : addJobDataModel!.data!.specializations!.length == 0 ? Center(child: Text("No specialization is available"),) : ListView.builder(
                   shrinkWrap: true,
                   itemCount: addJobDataModel!.data!.specializations!.length,
                   itemBuilder: (c,i){
                     return InkWell(
                       onTap: (){
                         print("working function");
                         if(specializationList.contains('${addJobDataModel!.data!.specializations![i].name}')){
                           setState(() {
                             specializationList.remove('${addJobDataModel!.data!.specializations![i].name}');
                           });
                           print("remove function");
                         }
                         else{
                           setState(() {
                             specializationList.add('${addJobDataModel!.data!.specializations![i].name}');
                           });
                           print("add function");
                         }
                       },
                       child: Container(
                         margin: EdgeInsets.only(bottom: 8),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height:20,
                               width: 20,
                               decoration: BoxDecoration(
                                   border: Border.all(color: primaryColor,width: 2)
                               ),
                               child: specializationList.contains('${addJobDataModel!.data!.specializations![i].name}') ? Icon(Icons.check,size: 15,) : SizedBox.shrink(),
                             ),
                             SizedBox(width: 5,),
                             Expanded(
                               child: Container(
                                   // width: MediaQuery.of(context).size.width/2.5,
                                   child: Text("${addJobDataModel!.data!.specializations![i].name}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,)),
                             )
                           ],
                         ),
                       ),
                     );
                   }),
             ) : currentIndex == 7 ?

                 ///
             Container(
               child: addJobDataModel == null ? Center(child: Text("No data to show"),) : addJobDataModel!.data!.skills!.length == 0 ? Center(child: Text("No skills is available"),) : ListView.builder(
                   shrinkWrap: true,
                   itemCount: addJobDataModel!.data!.skills!.length,
                   itemBuilder: (c,i){
                     return InkWell(
                       onTap: (){
                         print("working function");
                         if(skillList.contains('${addJobDataModel!.data!.skills![i].name}')){
                           setState(() {
                             skillList.remove('${addJobDataModel!.data!.skills![i].name}');
                           });
                           print("remove function");
                         }
                         else{
                           setState(() {
                             skillList.add('${addJobDataModel!.data!.skills![i].name}');
                           });
                           print("add function");
                         }
                       },
                       child: Container(
                         margin: EdgeInsets.only(bottom: 8),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height:20,
                               width: 20,
                               decoration: BoxDecoration(
                                   border: Border.all(color: primaryColor,width: 2)
                               ),
                               child: skillList.contains('${addJobDataModel!.data!.skills![i].name}') ? Icon(Icons.check,size: 15,) : SizedBox.shrink(),
                             ),
                             SizedBox(width: 5,),
                             Container(
                                 width: MediaQuery.of(context).size.width/3,
                                 child: Text("${addJobDataModel!.data!.skills![i].name}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,))
                           ],
                         ),
                       ),
                     );
                   }),
             ) : currentIndex == 8 ?
             Container(
               child: addJobDataModel == null ? Center(child: Text("No data to show"),) : addJobDataModel!.data!.jobRoles!.length == 0 ? Center(child: Text("No Job Role is available"),) : ListView.builder(
                   shrinkWrap: true,
                   itemCount: addJobDataModel!.data!.jobRoles!.length,
                   itemBuilder: (c,i){
                     return InkWell(
                       onTap: (){
                         print("working function");
                         if(jobRoleList.contains('${addJobDataModel!.data!.jobRoles![i].name}')){
                           setState(() {
                             jobRoleList.remove('${addJobDataModel!.data!.jobRoles![i].name}');
                           });
                           print("remove function");
                         }
                         else{
                           setState(() {
                             jobRoleList.add('${addJobDataModel!.data!.jobRoles![i].name}');
                           });
                           print("add function");
                         }
                       },
                       child: Container(
                         margin: EdgeInsets.only(bottom: 8),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height:20,
                               width: 20,
                               decoration: BoxDecoration(
                                   border: Border.all(color: primaryColor,width: 2)
                               ),
                               child: jobRoleList.contains('${addJobDataModel!.data!.jobRoles![i].name}') ? Icon(Icons.check,size: 15,) : SizedBox.shrink(),
                             ),
                             SizedBox(width: 5,),
                             Container(

                                 width: MediaQuery.of(context).size.width/3,
                                 child: Text("${addJobDataModel!.data!.jobRoles![i].name}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,))
                           ],
                         ),
                       ),
                     );
                   }),
             ) : currentIndex == 9 ?
             Container(
               child: addJobDataModel == null ? Center(child: Text("No data to show"),) : addJobDataModel!.data!.expectations!.length == 0 ? Center(child: Text("No exptection is available"),) : ListView.builder(
                   shrinkWrap: true,
                   itemCount: addJobDataModel!.data!.expectations!.length,
                   itemBuilder: (c,i){
                     return InkWell(
                       onTap: (){
                         print("working function");
                         if(exptectedList.contains('${addJobDataModel!.data!.expectations![i].name}')){
                           setState(() {
                             exptectedList.remove('${addJobDataModel!.data!.expectations![i].name}');
                           });
                           print("remove function");
                         }
                         else{
                           setState(() {
                             exptectedList.add('${addJobDataModel!.data!.expectations![i].name}');
                           });
                           print("add function");
                         }
                       },
                       child: Container(
                         margin: EdgeInsets.only(bottom: 8),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height:20,
                               width: 20,
                               decoration: BoxDecoration(
                                   border: Border.all(color: primaryColor,width: 2)
                               ),
                               child: exptectedList.contains('${addJobDataModel!.data!.expectations![i].name}') ? Icon(Icons.check,size: 15,) : SizedBox.shrink(),
                             ),
                             SizedBox(width: 5,),
                             Container(
                                 width: MediaQuery.of(context).size.width/3,
                                 child: Text("${addJobDataModel!.data!.expectations![i].name}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,))
                           ],
                         ),
                       ),
                     );
                   }),
             ) :
             Container(
               child: addJobDataModel == null ? Center(child: Text("No data to show"),) : addJobDataModel!.data!.noticePeriod!.length == 0 ? Center(child: Text("No notice period is available"),) : ListView.builder(
                   shrinkWrap: true,
                   itemCount: addJobDataModel!.data!.noticePeriod!.length,
                   itemBuilder: (c,i){
                     return InkWell(
                       onTap: (){
                         print("working function");
                         if(noticePeriodList.contains('${addJobDataModel!.data!.noticePeriod![i].name}')){
                           setState(() {
                             noticePeriodList.remove('${addJobDataModel!.data!.noticePeriod![i].name}');
                           });
                           print("remove function");
                         }
                         else{
                           setState(() {
                             noticePeriodList.add('${addJobDataModel!.data!.noticePeriod![i].name}');
                           });
                           print("add function");
                         }
                       },
                       child: Container(
                         margin: EdgeInsets.only(bottom: 8),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Container(
                               height:20,
                               width: 20,
                               decoration: BoxDecoration(
                                   border: Border.all(color: primaryColor,width: 2)
                               ),
                               child: noticePeriodList.contains('${addJobDataModel!.data!.noticePeriod![i].name}') ? Icon(Icons.check,size: 15,) : SizedBox.shrink(),
                             ),
                             SizedBox(width: 5,),
                             Container(
                                 width: MediaQuery.of(context).size.width/3,
                                 child: Text("${addJobDataModel!.data!.noticePeriod![i].name}",style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,))
                           ],
                         ),
                       ),
                     );
                   }),
             )
            )
          ],
        ),
      ),
    ),

    );
  }
}
