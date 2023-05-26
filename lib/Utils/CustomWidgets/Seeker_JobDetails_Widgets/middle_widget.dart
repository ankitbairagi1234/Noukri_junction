import 'package:flutter/material.dart';

import '../../style.dart';

class MiddleWidget extends StatelessWidget {
  final String jobId;
  final String jobType;
  final String designation;
  final String qualification;
  final String specialization;
  final String lastdate;
  final bool? isBorder;
   MiddleWidget({Key? key, required this.jobId, required this.jobType, required this.specialization,required this.designation, required this.qualification, required this.lastdate,required this.isBorder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        color: Colors.white,
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          width: 360,
          decoration: BoxDecoration(
            border: isBorder == true ? Border.all(color: primaryColor) : Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Job Post", style: TextStyle(fontSize: 14, color: primaryColor,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Job ID', style: TextStyle(fontWeight: FontWeight.w500),),
                  Text("#" + jobId, style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Job Type', style: TextStyle(fontWeight:FontWeight.w500),),
                  Text(jobType, style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Designation', style: TextStyle(fontWeight: FontWeight.w500),),
                  Text(designation, style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Qualification', style: TextStyle(fontWeight: FontWeight.w500),),
                  Text(qualification, style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Specialization', style: TextStyle(fontWeight: FontWeight.w500),),
                  Container(
                    alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width/2.5,
                      child: Text(specialization.toString(), style: TextStyle(fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                ],
              ),
              SizedBox(height: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Last Date of Application', style: TextStyle(fontWeight:FontWeight.w500),),
                  Text(lastdate, style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text('Job Id', style: TextStyle(fontWeight: FontWeight.bold),),
              //         Text('Job Type', style: TextStyle(fontWeight: FontWeight.bold),),
              //         Text('Designation', style: TextStyle(fontWeight: FontWeight.bold),),
              //         Text('Qualification', style: TextStyle(fontWeight: FontWeight.bold),),
              //
              //         Text('Last date of\nApplicaiton', style: TextStyle(fontWeight: FontWeight.bold),),
              //       ],
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("#" + jobId, style: TextStyle(fontWeight: FontWeight.bold),),
              //         Text(jobType, style: TextStyle(fontWeight: FontWeight.bold),),
              //         Text(designation, style: TextStyle(fontWeight: FontWeight.bold),),
              //         Text(qualification, style: TextStyle(fontWeight: FontWeight.bold),),
              //
              //         Text(lastdate, style: TextStyle(fontWeight: FontWeight.bold),),
              //       ],
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );  }
}
