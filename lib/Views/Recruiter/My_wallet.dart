import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_dekho_app/Utils/style.dart';
import 'package:job_dekho_app/Views/Recruiter/addwallet.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import '../../Model/getwalletmodel.dart';
import '../../Services/tokenString.dart';
import '../../Utils/CustomWidgets/customButton.dart';
import '../Job Seeker/company_details.dart';

class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  Getwalletmodel? walletData;

  getWallet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString(TokenString.userid);


    print('_________________>>>>>>>>>>>>>>>>>>>>>${userid}');
    var headers = {
      'Cookie': 'ci_session=8c2275d8af8aa49a38366843cf03ea05190bd53b'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://webadmin.naukrijunction.org/api/get_wallet_transaction'));
    request.fields.addAll({
      'user_id': userid.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var walletresult = await response.stream.bytesToString();
      final finalresponse = Getwalletmodel.fromJson(json.decode(walletresult));

      print("__________________${finalresponse}");
      print("_________________${walletresult}");
      setState((){
        walletData = finalresponse;
      });

    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWallet();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "${getTranslated(context, 'myWallet')}",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700,color:Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(

            children: [
              Center(
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(

                    children: [
                      SizedBox(height: 20),
                      Container(
                          height: 90,
                          width: 170,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, border: Border.all(color: primaryColor)),
                          child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                  children:[
                                    Text(
                                      "${getTranslated(context, 'Current_Bal')}",
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    walletData==null || walletData!.data!.first.amount == ""? Center(child: CircularProgressIndicator(color: primaryColor,),):
                                    Text('\₹' + "${walletData?.data?.first.amount}", )
                                    // Text('\₹' + "1000",
                                    //     style: Theme.of(context).textTheme
                                    //         .headline4!
                                    //         .copyWith(color: Colors.black),
                                    //     textAlign: TextAlign.center),
                                  ]
                              ))),
                      // Text(
                      //   "Your Balance",
                      //   style: Theme.of(context).textTheme.bodyText2,
                      //   textAlign: TextAlign.center,
                      // ),
                      // SizedBox(
                      //   height: 4,
                      // ),
                      // Text('\₹' + balance.toString(),
                      //     style: Theme.of(context)
                      //         .textTheme
                      //         .headline4!
                      //         .copyWith(color: blackColor),
                      //     textAlign: TextAlign.center),
                      SizedBox(
                        height: 50,
                      ),
                      Image.asset("assets/mywallet.png", height: 300, width: 300,),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(buttonText: "${getTranslated(context, 'Add_Money')}",
                    onTap: (){
                  Get.to(AddMoneyUI());
                }),

                // CustomButton(
                //     locale.addMoney,
                //     onTap: () {
                //       Navigator.push(
                //           context, MaterialPageRoute(builder: (C) => AddMoneyUI()));
                //     }
                // ),
              ),
            ],
          ),
        ),

    );
  }
  void handlePaymentErrorResponse(PaymentFailureResponse response){
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {
        Navigator.pop(context);

      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
