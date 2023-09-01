import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_info/device_info.dart';
import 'package:connectivity/connectivity.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:untitled1/screen/homePage.dart';
import 'package:untitled1/screen/registrationForm.dart';

import '../Component/roundButton.dart';
import '../Component/roundInputField.dart';
import '../Model/addCustomerModel.dart';
import '../Model/sendotpLogin.dart';
import '../constants/colorConstants.dart';
import '../constants/stringConstant.dart';
import '../controller/login_controller.dart';
import '../utils/lotOfThemes.dart';
import 'otpLogin.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key,
    // required this.addCustomer
  });

  // final AddCustomerModel addCustomer;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  StreamSubscription? subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  String phoneValue = '';
  String identifer = '';

  // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // AndroidDeviceInfo? androidInfo;
  //
  // Future<AndroidDeviceInfo> getInfo() async {
  //   return await deviceInfo.androidInfo;
  // }
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  // }

  // Future<void> _getDeviceDetails() async {
  //   final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  //   try {
  //     if (Platform.isAndroid) {
  //       var build = await deviceInfoPlugin.androidInfo;
  //       setState(() {
  //         identifer = build.androidId;
  //       });
  //     } else if (Platform.isIOS) {
  //       var data = await deviceInfoPlugin.iosInfo;
  //       setState(() {
  //         identifer = data.identifierForVendor;
  //       });
  //     }
  //   } on PlatformException {
  //     print(StringConstants.failedTogetPlatformVersion);
  //   }
  // }

  @override
  void initState() {
    // _getDeviceDetails();
    getConnectivity();
    super.initState();
  }

  getConnectivity() => subscription = Connectivity()
      .onConnectivityChanged
      .listen((ConnectivityResult result) async {
    isDeviceConnected = await InternetConnectionChecker().hasConnection;
    if (!isDeviceConnected && isAlertSet == false) {
      showDialogBox();
      setState(() {
        isAlertSet = true;
      });
    }
  });

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  showDialogBox() => showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(StringConstants.noConnection),
        content:
        const Text(StringConstants.pleaseCheckYourInternetConnection),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context, StringConstants.cancel);
              setState(() => isAlertSet = false);
              isDeviceConnected =
              await InternetConnectionChecker().hasConnection;
              if (!isDeviceConnected) {
                showDialogBox();
                setState(() => isAlertSet = true);
              }
            },
            child: const Text(StringConstants.ok),
          )
        ],
      )
  );

  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Image.asset('assets/logo.png'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstants.phoneNumber,
                  style: LotOfThemes.textText12,
                ),
                RoundedInputField(
                  controller: phoneNumberController,
                  hintText: StringConstants.enterRegisterPhoneNumber,
                  maxLength: 10,
                  counterText: '',
                  onChanged: (value) {
                    phoneValue = value;
                  },
                  keyboardType: TextInputType.phone,
                  type: StringConstants.mobile,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RoundedButton(
                      text: StringConstants.next,
                      btnColor: ColorConstants.primaryColor,
                      btnWidth: 300,
                      press: () async {
                        if (_formKey.currentState?.validate() == true) {
                          if (phoneNumberController.toString() == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                    Text(StringConstants.alertPhoneNo)));
                          } else {
                           OtpLoginModel otpLogin =
                                await controller.signIn(phoneValue);
                            setPhoneNo(phoneNumberController.text);
                            getPhoneNo();
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: Text('${otpLoginModel.otp}'))
                            // );
                            // Navigator.push(context, MaterialPageRoute(
                            //                   builder: (BuildContext context) {
                            //                 return OtpLogin(
                            //                   otpLoginModel: otpLogin,
                            //                   phoneValue: phoneValue
                            //                 );
                            //               }));




                            AlertDialog alert = AlertDialog(
                              title: const Text(StringConstants.alert),
                              content: Column(
                                children: [
                                  Text(StringConstants.phoneNumber +
                                      '$phoneValue'),
                                  Text(StringConstants.identifier + '$identifer'),
                                  Text('OTP : ${otpLogin.otp}')
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pushAndRemoveUntil(context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                                return
                                                  OtpLogin(
                                                    otpLoginModel: otpLogin,
                                                    phoneValue: phoneValue,
                                                  );
                                              }), ModalRoute.withName('/'));
                                    },
                                    child: const Text(StringConstants.ok)),
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return alert;
                                });
                          }
                        }
                      }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                StringConstants.needAnAccount,
                style: TextStyle(fontSize: 16.sp),
              ),
              TextButton(
                child: Text(
                  StringConstants.signUp,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.redAccent,
                      decorationThickness: 2,
                      color: Colors.redAccent,
                      fontSize: 16.sp),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const RegistrationForm();
                      }));
                },
              )
            ],
          ),
        ]),
      ),
    );
  }

  Future<void> setPhoneNo(phone) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('phoneNo', phone);
  }

  void getPhoneNo() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    phoneValue = pref.getString('phoneNo')?? '';
  }
}
