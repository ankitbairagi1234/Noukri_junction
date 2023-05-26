import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/style.dart';

class CustomDrawerTile extends StatelessWidget {
  final String tileName;
  final Widget tileIcon;
  final VoidCallback? onTap;
  const CustomDrawerTile({Key? key, required this.tileName, required this.tileIcon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: tileIcon
                  //Image.asset('assets/DrawerAssets/profileIcon.png', scale: 1.3,),
                ),
                SizedBox(width: 15,),
                Text(tileName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, ),)
              ],
            ),
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Image.asset('assets/DrawerAssets/forwardIcon.png', scale: 1.3,color: primaryColor,),
            ),
          ],
        ),
      ),
    );
  }
}
