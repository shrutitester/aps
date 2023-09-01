import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/constants/stringConstant.dart';
import 'package:untitled1/utils/api-helper.dart';
import 'package:device_info/device_info.dart';

import '../Model/addCustomerModel.dart';

class RegistrationController {
  Future<AddCustomerModel> registrationForm(
      firmName,
      ownerName,
      whatsappNumber,
      email,
      address,
      pinCode,
      state,
      city,
      district,
      transport,
      booking,
      booking2,
      rfdby,
      crdays,
      crlimit) async {
    String uniqueKey = await getDeviceUniqueKey();
    AddCustomerModel model;
    Map<String, dynamic> bodyMap = {
      'CustomerName': ownerName,
      'FirmName': firmName,
      'Address': address,
      'CityName': city,
      'Email': email,
      'Phone': whatsappNumber,
      'WhatsAppNo': whatsappNumber,
      // 'DealerType' : ,
      // 'DealsIn' : ,
      // 'TokenKey' : ,
      'pincode': pinCode,
      'statename': state,
      'districtname': district,
      'transport': transport,
      'booking': booking,
      'booking2': booking2,
      'refdby': rfdby,
      'crlimit': crlimit,
      'crdays': crdays,
      // 'gstin' : ,
      // 'pan' : ,
      // 'aadhar' : ,
      'username': firmName,
      'imei': uniqueKey,
    };

    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: StringConstants.addCustomer,
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    {
      model = AddCustomerModel.fromJson(returnMap['body']);
      return model;
    }
  }

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

}
