import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Model/AllJobModel.dart';
import 'package:job_dekho_app/Model/PlansModel.dart';
import 'package:job_dekho_app/Services/api_path.dart';
import 'package:job_dekho_app/Services/push_notification_service.dart';
import 'package:job_dekho_app/Services/tokenString.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customDialogBox.dart';
import 'package:job_dekho_app/Utils/iconUrl.dart';
import 'package:job_dekho_app/Views/Recruiter/addJob.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/RecruiterProfileModel.dart';
import '../../Utils/CustomWidgets/customPlanTile.dart';
import '../../Utils/CustomWidgets/customTextButton.dart';
import '../../Utils/CustomWidgets/jobPostCard.dart';
import '../../Utils/style.dart';
import 'recruiterdrawer_Screen.dart';
import 'package:http/http.dart' as http;

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({Key? key}) : super(key: key);

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {

  openPostjobDialog(){
    return showDialog(context: context, builder: (context){
      return StatefulBuilder(builder: (context,setState){
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 70,
                alignment: Alignment.center,
                color: primaryColor,
                child: Text("Select Payment Plan", style: TextStyle(fontSize: 16, color: whiteColor, fontWeight: FontWeight.bold),),
              ),
              Container(
                 height: 250,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                        shrinkWrap: true,
                    itemCount: getPlansModel!.data!.length,
                    itemBuilder: (c,i){
                  return  CustomPlanTile(planName: "${getPlansModel!.data![i].name}", planPrice: "${getPlansModel!.data![i].amountInr}", description1: "${getPlansModel!.data![i].planDurationCount} ${getPlansModel!.data![i].planDurationType}", description2: "${getPlansModel!.data![i].description}",onTap: ()async{
                    // final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddJob()));
                    // print("checking result here value here ${result}");
                    // if(result == true){
                    //   Navigator.pop(context);
                    //   getMyJobs();
                    // }
                    // if(result == null){
                    //   Navigator.pop(context);
                    // }
                    // setState(() {
                    // });
                    if(getPlansModel!.data![i].amountInr == "0"){
                      planAmount = getPlansModel!.data![i].amountInr.toString();
                      planid = getPlansModel!.data![i].id.toString();
                      purcheasApi('ssdsd', planAmount,);
                      // var snackBar = SnackBar(
                      //   backgroundColor: primaryColor,
                      //   content: Text("Plan amount can't be 0"),
                      // );
                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else{
                      setState((){
                        planAmount = getPlansModel!.data![i].amountInr.toString();
                        planid = getPlansModel!.data![i].id.toString();
                      });
                      checkOut();
                    }
                  },
                  );
                })
              ),
              CustomTextButton(buttonText: "Close", onTap: (){
                Navigator.of(context).pop();
              },)
            ],
          ),
        );
      });
    });
  }

  AllJobModel? allJobModel;

    var planAmount;
    var planid;

  getMyJobs()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString(TokenString.userid);
    var headers = {
      'Cookie': 'ci_session=056439a05a0899b4ea52dc1ac181a060af22ccd2'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}job_lists'));
    request.fields.addAll({
      'user_id': '$userid'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = AllJobModel.fromJson(json.decode(finalResponse));
      setState(() {
        allJobModel = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }
  Razorpay _razorpay = Razorpay();

  callApi(){
    getMyJobs();
    getProfiledData();
  }

  Future _refresh() async{
  //  return getMyJobs();
return callApi();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PushNotificationService pushNotificationService = new PushNotificationService(context: context);
    pushNotificationService.initialise();
    Future.delayed(Duration(milliseconds: 500),(){
      return getMyJobs();
    });
    Future.delayed(Duration(milliseconds: 200),(){
      return getPlans();
    });
    Future.delayed(Duration(milliseconds: 300),(){
      return getProfiledData();
    });
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  purcheasApi(String pymtid,String amount)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userEmail = prefs.getString(TokenString.userEmail);
    var headers = {
      'Cookie': 'ci_session=b29e882d4d300ec29020d553597463396c0bdb0c'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}payu_success'));
    request.fields.addAll({
      'id': '${planid}',
      'mihpayid': '${pymtid}',
      'email': '${userEmail}',
      'mode': 'Razorpay',
      'status': 'Success',
      'amount': '${amount}'
    });
    print("paramters of purchase api  ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult =  await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResult);
      print("final jsonResponse here for payment ${jsonResponse}");
      if(jsonResponse['staus'] == 'true'){
        final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddJob()));
        print("checking result here value here ${result}");
        if(result == true){
          // var snackBar = SnackBar(
          //   content: Text('Plan activated successfully'),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // Navigator.pop(context);
        await  getProfiledData();
          getMyJobs();
        }
        if(result == null){
          Navigator.pop(context);
       await getProfiledData();
        }
        setState(() {
        });
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }


  checkOut() {
    int amount  = int.parse(planAmount.toString()) * 100;
    print("checking amount here ${amount}");
    var options = {
      'key': "rzp_test_CpvP0qcfS4CSJD",
      'amount': amount,
      'currency': 'INR',
      'name': 'Alpha Job Portal',
      'description': '',
      // 'prefill': {'contact': userMobile, 'email': userEmail},
    };
    print("OPTIONS ===== $options");
    _razorpay.open(options);
  }
  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // var userId = await MyToken.getUserID();
    var snackBar = SnackBar(
      content: Text('Payment Successfull'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //purchasePlan("$userId", planI,"${response.paymentId}");
    purcheasApi('ssdsd', planAmount,);
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("FAILURE === ${response.message}");
    // UtilityHlepar.getToast("${response.message}");
    var snackBar = SnackBar(
      content: Text('Payment Failed'),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  PlansModel? getPlansModel;

  getPlans()async{
    var headers = {
      'Cookie': 'ci_session=870de272991b64efd0ff1c6a3f8f9ecf1905cc7d'
    };
    var request = http.Request('GET', Uri.parse('${ApiPath.baseUrl}plans'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = PlansModel.fromJson(json.decode(finalResponse));
      setState(() {
        getPlansModel = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  RecruiterProfileModel? recruiterProfileModel;

  var paymentStatus;

  getProfiledData()async{
    print("ooooooooooooooo");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString(TokenString.userid);
    var headers = {
      'Cookie': 'ci_session=af7c02e772664abfa7caad1f5b272362e2f3c492'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}recruiter_profile'));
    request.fields.addAll({
      'id': '${userid}'
    });
    print("parameter for recruiter profile ${request.fields} and ${ApiPath.baseUrl}recruiter_profile");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = RecruiterProfileModel.fromJson(json.decode(finalResponse));
      print("final json response ${jsonResponse}");
      setState(() {
        recruiterProfileModel = jsonResponse;
        paymentStatus = recruiterProfileModel!.data!.pay.toString();
        print("payment status here ${paymentStatus}");
      });

    }
    else {
      print(response.reasonPhrase);
    }
  }

  Future<bool> showExitPopup() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit an App?'),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('No'),
          ),

          ElevatedButton(
            onPressed: (){
              exit(0);
              // Navigator.pop(context,true);
              // Navigator.pop(context,true);
            },
            //return true when click on "Yes"
            child:Text('Yes'),
          ),
        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: SafeArea(child: Scaffold(
        backgroundColor: primaryColor,
        floatingActionButton: GestureDetector(
          onTap: ()async{
            print("payment status here ${paymentStatus}");
            if(paymentStatus == "yes"){
              final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddJob()));
              if(result == true){
                 getMyJobs();
              }
              setState(() {

              });
            }
            else{
              await openPostjobDialog();
            }
          //  openPostjobDialog();


            //Get.to(CustomDialogBox());
          },
          child: Container(
            width: 64,
            height: 64,
            child: Image.asset(postjobIconR, color: whiteColor),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(100)
            ),
          ),),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.to(DrawerScreen());
            },
            child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
          ),
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text("${getTranslated(context, 'Post_job')}"),
          centerTitle: true,
        ),
          body: RefreshIndicator(
            onRefresh: _refresh,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
                  color: Colors.white
              ),
              alignment: Alignment.center,
              width: size.width,
              height: size.height,
              child: allJobModel == null ? Center(child: CircularProgressIndicator()) :  allJobModel!.data!.length == 0 ? Center(child: Text("${getTranslated(context, 'No_Job')}"),) : ListView.builder(
                  itemCount: allJobModel!.data!.length,
                  itemBuilder: (BuildContext context, int index){
                return JobPostCard(model: allJobModel!.data![index],);
              })
              // Column(
              //   //mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     JobPostCard(),
              //     JobPostCard(),
              //     JobPostCard()
              //   ],
              // ),
            ),
          )
      )),
    );
  }
}
