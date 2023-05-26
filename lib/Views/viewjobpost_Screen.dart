import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Views/Recruiter/postJob_Screen.dart';

import '../Model/AllJobModel.dart';
import '../Utils/CustomWidgets/TextFields/customDetailTextField.dart';
import '../Utils/CustomWidgets/TextFields/customDropDownTextField.dart';
import '../Utils/CustomWidgets/TextFields/customTextField.dart';
import '../Utils/CustomWidgets/customCheckBox.dart';
import '../Utils/CustomWidgets/customTextButton.dart';
import '../Utils/style.dart';
import 'Recruiter/recruiterdrawer_Screen.dart';

class ViewJobPostScreen extends StatefulWidget {
   ViewJobPostScreen({Key? key, this.model}) : super(key: key);
    final Data? model;

  @override
  State<ViewJobPostScreen> createState() => _ViewJobPostScreenState();
}

class _ViewJobPostScreenState extends State<ViewJobPostScreen> {

TextEditingController description = TextEditingController();
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    description = TextEditingController(text: widget.model!.description);
  }
  List<String> hiringList = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final  hire = widget.model!.hiringProcess.toString();
    final split = hire.split(",");
    for(var i=0;i<split.length;i++){
      hiringList.add(split[i]);
      print("sssdsdsd ${hiringList}");
    }
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: primaryColor,
            leading: GestureDetector(
              onTap: (){
                Get.to(PostJobScreen());
              },
              child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
              //Icon(Icons.arrow_back_ios, color: whiteColor, size: 22),
            ),
            title:  Text('View Job', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),

          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
                color: Colors.white
            ),
            alignment: Alignment.center,
            width: size.width,
            height: size.height,
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15,),
                CustomTextField(labelText: "Job Type", hintText: "${widget.model!.jobType}",readOnly: true,),
                CustomTextField(labelText: "Designation", hintText: "${widget.model!.designation}",readOnly: true,),
                CustomTextField(labelText: "Qualification", hintText: "${widget.model!.qualification}",readOnly: true,),
                CustomTextField(labelText: "Location", hintText: "${widget.model!.location}",readOnly: true,),
                CustomTextField(labelText: "Passing Year", hintText: "${widget.model!.passingYear}",readOnly: true,),
                CustomTextField(labelText: "Experience", hintText: "${widget.model!.experience}",readOnly: true,),
               // CustomTextField(labelText: 'Salary Range',hintText: 'Salary Range',readOnly: true,),
                CustomTextField(labelText: 'Enter number of vacancies',hintText: '${widget.model!.noOfVaccancies}',readOnly: true,),
                CustomTextField(labelText: 'Job Role',hintText: '${widget.model!.jobRole}',readOnly: true,),
                CustomTextField(labelText: 'Specialization',hintText: '${widget.model!.specialization}',readOnly: true,),
                CustomTextField(labelText: 'Last Date of application',hintText: '${widget.model!.endDate}',readOnly: true,),
                SizedBox(height: 6,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Salary Range",style: TextStyle(color: greyColor1),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                         Expanded(
                           child: Container(
                             padding: EdgeInsets.only(left: 8),
                             alignment:Alignment.centerLeft,
                             height: 50,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(6),
                               border: Border.all(color: greyColor1)
                             ),
                             child:widget.model!.max == null ?  Text("Min Salary",style: TextStyle(color: greyColor1,fontSize: 14),) : Text("${widget.model!.min}",style: TextStyle(color: greyColor1,fontSize: 14)),
                           ),
                         ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 8),
                              alignment:Alignment.centerLeft,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: greyColor1)
                              ),
                              child: widget.model!.max == null ? Text("Max Salary",style: TextStyle(color: greyColor1,fontSize: 14),) : Text("${widget.model!.max}",style: TextStyle(fontSize: 14),),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10,bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){
                                // setState(() {
                                //   selectedIndex = 1;
                                // });
                              },
                              child: Container(
                                child:
                                Row(
                                  children: [
                                    Container(
                                      height:20,
                                      width: 20,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(color: widget.model!.salaryRange == "monthly" ? primaryColor : greyColor1,width: 2)
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: widget.model!.salaryRange == "monthly" ? primaryColor : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Text("Monthly",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                // setState(() {
                                //   selectedIndex = 2;
                                // });
                              },
                              child: Container(
                                child:
                                Row(
                                  children: [
                                    Container(
                                      height:20,
                                      width: 20,
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(color: widget.model!.salaryRange != 'monthly' ? primaryColor : greyColor1,width: 2)
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: widget.model!.salaryRange != "monthly" ? primaryColor : Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Text("Yearly",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:  EdgeInsets.only(left: 12,top: 10),
                    child: Text("Hiring Process", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: greyColor1),),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCheckBox(checkboxText:'Face to Face',boolValue: hiringList.contains('Face to Face') ? true : false,),
                        CustomCheckBox(checkboxText: 'HR Round',boolValue: hiringList.contains('HR Round') ? true : false,),
                      ],
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCheckBox(checkboxText: 'Written-Test',boolValue: hiringList.contains('Written-test') ? true : false),
                        CustomCheckBox(checkboxText: 'Group Discussion',boolValue: hiringList.contains('Group Discussion') ? true : false,),
                      ],
                    ),
                  ],
                ),
                CustomDetailTextField(labelText: "Job Description", maxLines: 4, labelColor: greyColor,readOnly: true,fieldController: description,),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ));
  }
}
