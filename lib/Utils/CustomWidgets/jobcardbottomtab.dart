import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTapButton.dart';

import '../style.dart';

class JobCardBottomTile extends StatelessWidget {
  final VoidCallback? editOnTap;
  final VoidCallback? deleteOnTap;
  final VoidCallback? shareOnTap;
  final VoidCallback? viewOnTap;
  
  const JobCardBottomTile({Key? key, this.editOnTap, this.deleteOnTap, this.shareOnTap, this.viewOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: editOnTap,
            child: Card(
                elevation: 2,
                child: Container(
                  height: 25,
              width: 25,
              padding: EdgeInsets.all(3.0),
              child: Image.asset('assets/ProfileAssets/editIcon.png',height: 10,width: 10,),
            )),
          ),
          // Container(
          //     width: 34,
          //     height: 34,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10)
          //     ),
          //     child: Image.asset('assets/ProfileAssets/editIcon.png',scale: 1.2,),
          // ),
          GestureDetector(
            onTap: deleteOnTap,
            child: Card(
              elevation: 2,
              child: Container(
                height: 25,
                width: 25,
                padding: EdgeInsets.all(3),
                child: Image.asset('assets/DrawerAssets/deleteIcon.png', height: 10,width: 10,),
              ),
            ),
          ),
          // Container(
          //     width: 34,
          //     height: 34,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10)
          //     ),
          //     child: Image.asset('assets/DrawerAssets/deleteIcon.png', scale: 1.2,)
          // ),
          GestureDetector(
            onTap: shareOnTap,
            child: Card(
                elevation: 2,
                child: Container(
                  height: 25,
                  width: 25,
                  alignment: Alignment.center,
                 // padding:  EdgeInsets.all(5.0),
                  child: Icon(Icons.share,color: Colors.black,size: 20,),
                ))
          ),
          // Container(
          //     width: 34,
          //     height: 34,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10)
          //     ),
          //     child: Image.asset('assets/DrawerAssets/shareappIcon.png', scale: 1.2,)
          // ),
          GestureDetector(
            onTap: viewOnTap,
            child: Container(
              width: 80,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor
              ),
              child: Text("View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),),
            )
            //CustomTapButton(),
          )
        ],
      ),
    );
  }
}
