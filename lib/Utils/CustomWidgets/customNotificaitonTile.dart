import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/style.dart';

class CustomNotificaitonTile extends StatelessWidget {
  final String username;
  final String time;
  final String msg;
  const CustomNotificaitonTile({Key? key, required this.username, required this.time,required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xffF9F9F9)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width/2.3,
                      child: Text(username, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                  Text(time, style: TextStyle(color: greyColor2,fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              ),
              Text("${msg}")
            ],
          ),
        ),
    );
  }
}
