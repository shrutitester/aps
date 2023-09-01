import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/stringConstant.dart';
import '../constants/colorConstants.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorConstants.mainBgColor,
            size: 22.sp,
          ),
        ),
        title: Text(
          StringConstants.contactUs,
          style: TextStyle(
            color: ColorConstants.mainBgColor,
            fontSize: 22.sp
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 36.h,),
            Text(StringConstants.appName,style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),),
            SizedBox(height: 12.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone,size: 14.sp,),
                SizedBox(width: 10.w,),
                TextButton(onPressed: () async{
                  var url = Uri.parse('tel: ${StringConstants.phone}');
                  if(await canLaunchUrl(url)){
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text(StringConstants.phone, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
