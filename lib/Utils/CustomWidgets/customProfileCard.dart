import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTapButton.dart';
import 'package:job_dekho_app/Utils/style.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomProfileCard extends StatefulWidget {
  final String jobId;
  final String name;
  final String mobileNumber;
  final String email;
  final VoidCallback? onTap;
  const CustomProfileCard({Key? key, required this.jobId, required this.name, required this.mobileNumber, required this.email, this.onTap}) : super(key: key);

  @override
  State<CustomProfileCard> createState() => _CustomProfileCardState();
}

class _CustomProfileCardState extends State<CustomProfileCard> {
  @override
  Widget build(BuildContext context) {
    // String email = Uri.encodeComponent();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: 360,
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
         decoration: BoxDecoration(
           color: whiteColor,
           borderRadius: BorderRadius.circular(40)
         ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Job ID - " + "#" +widget.jobId, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(widget.name.toUpperCase().toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                  InkWell(
                    onTap: ()async {
                      String mob = Uri.encodeComponent("${widget.mobileNumber}");
                      Uri mobiles = Uri.parse("tel:$mob");
                      if (await canLaunch(mobiles.toString())) {
                        await launch(mobiles.toString());
                      } else {
                        throw 'Could not launch $mobiles';
                      }
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/AuthAssets/callicon.png', color: primaryColor, scale: 1.5,),
                        SizedBox(width: 10,),
                        Text(widget.mobileNumber, style: TextStyle(color: greyColor2),),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: ()async{
                      String email = Uri.encodeComponent("${widget.email}");
                      Uri mail = Uri.parse("mailto:$email");
                      // const url = 'mailto: ${widget.email}';
                      if(await canLaunch(mail.toString())){
                        await launch(mail.toString());
                      }else {
                        throw 'Could not launch $mail';
                      }
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/AuthAssets/emailicon.png', color: primaryColor, scale: 1.5,),
                        SizedBox(width: 10,),
                        Text(widget.email, style: TextStyle(color: greyColor2),),
                      ],
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: CustomTapButton(
                  buttonColor: primaryColor,
                  buttonText: "View",
                  buttonTextColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
