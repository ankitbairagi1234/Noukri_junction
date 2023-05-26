import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Model/AllRecruiterModel.dart';
import '../../Services/api_path.dart';
import '../../Utils/CustomWidgets/customButton.dart';
import '../../Utils/iconUrl.dart';
import '../../Utils/style.dart';
import 'package:http/http.dart' as http;

import 'company_details.dart';

class SearchAllRecruiter extends StatefulWidget {
  const SearchAllRecruiter({Key? key}) : super(key: key);

  @override
  State<SearchAllRecruiter> createState() => _SearchAllRecruiterState();
}

class _SearchAllRecruiterState extends State<SearchAllRecruiter> {

  TextEditingController searchController = TextEditingController();

  AllRecruiterModel? allRecruiterModel;
  getAllRecruiterList(String val)async{
    // var headers = {
    //   'Cookie': 'ci_session=b2c63ad9a1350c2ef462afeb0661e0ab3249d138'
    // };
    // var request = http.Request('POST', Uri.parse('${ApiPath.baseUrl}all_recruiters'));
    // request.fields.addAll({
    //   'search': 'a'
    // });
    // request.headers.addAll(headers);
    // http.StreamedResponse response = await request.send();
    // if (response.statusCode == 200) {
    //   var finalResponse =  await response.stream.bytesToString();
    //   final jsonResponse = AllRecruiterModel.fromJson(json.decode(finalResponse));
    //   setState(() {
    //     allRecruiterModel = jsonResponse;
    //   });
    // }
    // else {
    //   print(response.reasonPhrase);
    // }
    var headers = {
      'Cookie': 'ci_session=426057a1b5e136693a27d29106eac95bf297af3d'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}all_recruiters'));
    request.fields.addAll({
      'search': val.toString(),
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
        var finalResponse =  await response.stream.bytesToString();
        final jsonResponse = AllRecruiterModel.fromJson(json.decode(finalResponse));
        setState(() {
          allRecruiterModel = jsonResponse;
        });
    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
            Navigator.pop(context);
            },
            child:Icon(Icons.arrow_back,color: Colors.white,)
          ),
          title: Text('Search Recruiters'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: primaryColor,
          actions: [
            
          ],
        ),
      body:  Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(90))
          ),
          padding: EdgeInsets.only(left: 16,right: 16,top: 25,bottom: 10),
          child:   Column(
            children: [
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: backgroundColor
                ),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (v){
                    setState(() {
                      getAllRecruiterList(v);
                    });
                  },
                  decoration: InputDecoration(
                      fillColor: backgroundColor,
                      hintText: "Search Recruiters",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: primaryColor)
                      )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              allRecruiterModel == null ?  Container() : allRecruiterModel!.data!.length == 0 ? Center(child: Text("No recruiter found"),) :   Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: allRecruiterModel!.data!.length,
                    itemBuilder: (c,i){
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Container(
                              width: MediaQuery.of(context).size.width,

                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 22,
                                          child: allRecruiterModel!.data![i].img == null ? Image.asset('assets/recruiters.png', scale: 2,) : ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: Image.network("${allRecruiterModel!.data![i].img}",fit: BoxFit.fill,),),
                                        ),
                                        SizedBox(width: 05,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Organization ID #${allRecruiterModel!.data![i].id}", style: TextStyle(fontWeight: FontWeight.bold),),
                                            Container(
                                                width: MediaQuery.of(context).size.width/1.6,
                                                child: Text("Consultancy Name: ${allRecruiterModel!.data![i].company!.toUpperCase()}", style: TextStyle(fontWeight: FontWeight.bold),maxLines: 2,)),
                                            Container(
                                                width: MediaQuery.of(context).size.width/1.6,
                                                child: Text("Company HR: ${allRecruiterModel!.data![i].name}", style: TextStyle(fontWeight: FontWeight.bold),maxLines: 2,)),

                                            SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Image.asset('assets/AuthAssets/callicon.png', color: primaryColor, scale: 1.5,),
                                                SizedBox(width: 15,),
                                                Text("${allRecruiterModel!.data![i].mno}", style: TextStyle(color: greyColor2),),
                                              ],
                                            ),
                                            SizedBox(height: 05,),
                                            Row(
                                              children: [
                                                Image.asset('assets/AuthAssets/emailicon.png', color: primaryColor, scale: 1.5,),
                                                SizedBox(width: 15,),
                                                Container(
                                                    width: MediaQuery.of(context).size.width/1.7,
                                                    child: Text("${allRecruiterModel!.data![i].email}", style: TextStyle(color: greyColor2),maxLines: 2,)),
                                              ],
                                            ), SizedBox(height: 05,),
                                            Row(
                                              children: [
                                                Image.asset('assets/AuthAssets/locationicon.png', color: primaryColor, scale: 1.5,),
                                                SizedBox(width: 15,),
                                                Container(
                                                    width: MediaQuery.of(context).size.width/1.7,
                                                    child: Text("${allRecruiterModel!.data![i].address}", style: TextStyle(color: greyColor2),maxLines: 2,)),
                                              ],
                                            ),


                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomButton(buttonText: "Details", onTap: (){Get.to(CompanyDetails(id: allRecruiterModel!.data![i].id,));}),
                                        CustomButton(buttonText: "Call HR", onTap: ()async{
                                          var url = "tel:${allRecruiterModel!.data![i].mno}";
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
                    }),
              ),
            ],
          )
      )
    );
  }
}
