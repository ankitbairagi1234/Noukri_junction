import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/style.dart';

class ViewJobPage extends StatefulWidget {
  const ViewJobPage({Key? key}) : super(key: key);

  @override
  State<ViewJobPage> createState() => _ViewJobPageState();
}

class _ViewJobPageState extends State<ViewJobPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
                // Get.to(DrawerScreen());
              },
              child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
            ),
            elevation: 0,
            backgroundColor: primaryColor,
            title: Text("View Job"),
            centerTitle: true,
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
            child: Column(
              children: [

              ],
            ),
          ),
        ));
  }
}
