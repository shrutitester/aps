
import 'dart:io';

import 'package:device_info/device_info.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/constants/stringConstant.dart';
import 'package:untitled1/controller/registrationForm_controller.dart';

import '../Model/sendotpLogin.dart';
import '../utils/api-helper.dart';

class LoginController{
  Future<OtpLoginModel>  signIn(phoneValue) async {
    // String token = await getFirebaseToken();
    String uniqueKey = await getDeviceUniqueKey();
    OtpLoginModel? model;
    Map<String, dynamic> bodyMap = {
      'whatsappno': phoneValue,
      // 'TOKENKEY': token,
      'IMEI': uniqueKey,
    };

    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: StringConstants.sendOtp,
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);

    // if (returnMap.containsKey('exception')) {
    //   model = OtpLoginModel();
    //   model.status = false;
    //   model.message = returnMap['exception'];
    //   return model;
    // } else if (returnMap.containsKey('statusCode')) {
    //   model = OtpLoginModel();
    //   model.status = false;
    //   model.message = returnMap['error'];
    //   return model;
    // } else
    {
      model = OtpLoginModel.fromJson(returnMap['body']);
      return model;
    }
  }

  // Future<OtpLoginModel> signUp(SignUpPojo data) async {
  //   OtpLoginModel? model;
  //
  //   Map<String, dynamic> bodyMap = data.toJson();
  //   // String token = await getFirebaseToken();
  //   String uniqueKey = await getDeviceUniqueKey();
  //   bodyMap["imei"] = uniqueKey;
  //   // bodyMap["TokenKey"] = token;
  //
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: data.status == true ? 'Login/updateCustomer' : 'Login/AddCustomer',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //
  //   if (returnMap.containsKey('exception')) {
  //     model = OtpLoginModel();
  //     model.status = false;
  //     model.message = returnMap['exception'];
  //     return model;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     model = OtpLoginModel();
  //     model.status = false;
  //     model.message = returnMap['error'];
  //     return model;
  //   } else {
  //     model = OtpLoginModel.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  // getUserDetail(bodyMap) async {
  //   RegistrationController? model;
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'Login/displaycustomers',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //
  //   if (returnMap.containsKey('exception')) {
  //     model = RegistrationController();
  //     model.status = false;
  //     model.message = returnMap['exception'];
  //     return model;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     model = RegistrationController();
  //     model.status = false;
  //     model.message = returnMap['error'];
  //     return model;
  //   } else {
  //     Map<String, dynamic> json = returnMap['body'];
  //     bool status = json['Status'];
  //     String message = json['Message'];
  //     if (json['customers'] == null ||
  //         json['customers'].toString().contains('[]')) {
  //       model = RegistrationController();
  //       model.status = false;
  //       model.message = message;
  //     } else {
  //       List<RegistrationController> modelList = <RegistrationController>[];
  //       json['customers'].forEach((v) {
  //         modelList!.add(RegistrationController.fromJson(v));
  //       });
  //       if (modelList.isNotEmpty) {
  //         model = modelList[0];
  //         model.status = status;
  //         model.message = message;
  //       }
  //     }
  //     return model;
  //   }
  // }

  getDeviceUniqueKey() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        return build.androidId;
        //return "IMEI PK";
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        return data.identifierForVendor;
        //UUID for iOS
      }
    } on PlatformException {
      debugPrint('Failed to get platform version');
      return "";
    }
  }

  // getFirebaseToken() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   String? firebaseToken = await messaging.getToken();
  //   return firebaseToken;
  // }
}