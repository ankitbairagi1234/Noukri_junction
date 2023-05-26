import 'package:flutter/material.dart';

import '../Helper/demo_localization.dart';

//Colors
final Color primaryColor = Color(0xFF3700b3);
final Color blue = Color(0xFF3700b3);
final Color secondry = Color(0xFFC3C3C5);
final Color whiteColor = Color(0xFFFFFFFF);
final Color greyColor = Color(0xFFBEBEBE);
final Color greyColor1 = Color(0xFFA4A4A4);
final Color backgroundColor = Color(0xFFF3F3F3);
final Color greyColor3 = Color(0xFF919191);
final Color profileBg = Color(0xFFF6F6F6);
final Color greyColor2 = Color(0xFF747474);
final Color purpleColor = Color(0xFFECE1FF);

//TextStyles
final TextStyle buttonTextStyle = TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white);


String? getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context)!.translate(key);
}