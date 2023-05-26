import 'package:flutter/material.dart';

import '../../style.dart';

class BottomWidget extends StatelessWidget {
  final String jobDescription;
  final List<String> roi1;
  final bool? isBorder;
  const BottomWidget({Key? key, required this.jobDescription, required this.roi1, required this.isBorder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        color: Colors.white,
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: isBorder == true ? Border.all(color: primaryColor) : Border.all(color: Colors.transparent),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Job Description", style: TextStyle(fontSize: 14, color: primaryColor,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
          jobDescription == null || jobDescription == "null"  ? SizedBox.shrink() :    Text(jobDescription, maxLines: 12,),
              jobDescription == null || jobDescription == "null" ? SizedBox.shrink() :    SizedBox(height: 5,),
              Text("Rounds of Interview", style: TextStyle(fontSize: 14, color: primaryColor,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Align(
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                  shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: roi1.length,
                  itemBuilder: (c,i){
                    return Text("${roi1[i]}");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
