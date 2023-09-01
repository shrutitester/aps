import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/controller/login_controller.dart';

import '../../component/roundButton.dart';
import '../../constants/stringConstant.dart';
import '../Model/sendotpLogin.dart';
import '../constants/colorConstants.dart';
import '../utils/preferences.dart';
import 'homePage.dart';

class OtpLogin extends StatefulWidget {
   OtpLogin(
      {super.key, required this.phoneValue,this.otpvalue, required this.otpLoginModel});

  final String phoneValue;
  final OtpLoginModel otpLoginModel;
  String? otpvalue;
  @override
  State<OtpLogin> createState() => _OtpLoginState();
}

class _OtpLoginState extends State<OtpLogin> {
  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;
  final _formKey = GlobalKey<FormState>();
  String? phoneValue;
  bool _visible = false;
  OtpFieldController otpController = OtpFieldController();
  String receivedOtp = '';
  AppPreferences preference = AppPreferences();


  @override
  void initState() {
    super.initState();
    getPhoneNo();
    timer = Timer.periodic(const Duration(seconds: 01), (_) {
      if (secondsRemaining != 00) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  void show() {
    setState(() {
      _visible = !_visible;
    });
  }

  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Image.asset('assets/logo.png'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.optPage +
                          '$phoneValue'.replaceRange(0, 6, StringConstants.xx),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: OTPTextField(
                          controller: otpController,
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceEvenly,
                          fieldWidth: 45,
                          fieldStyle: FieldStyle.underline,
                          outlineBorderRadius: 15,
                          style: TextStyle(fontSize: 17.sp),
                          onChanged: (pin) {
                            setState(() => receivedOtp = pin);
                            // print("Changed: " + pin);
                          },
                          onCompleted: (pin) {
                            // receivedOtp = pin;
                            // print("Completed: " + pin);
                          }),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    (receivedOtp!.length == 4 &&
                        (receivedOtp == widget.otpLoginModel.otp ))
                        ? SizedBox(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width,
                            child: RoundedButton(
                                text: StringConstants.verify,
                                // btnColor: ColorConstants.primaryColor,
                                btnWidth: 300,
                                press: () async {
                                  if (widget.otpLoginModel.appType != null &&
                                      widget.otpLoginModel.info != '0') {
                                    await preference.setStringPreference(
                                        StringConstants.userId,
                                        widget.otpLoginModel.info!);
                                    await preference.setStringPreference(
                                        StringConstants.userType,
                                        widget.otpLoginModel.appType!);
                                  }
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                    return  HomePage(
                                      // userId: widget.otpLoginModel.info!,
                                      // appType: widget.otpLoginModel.appType!,
                                    );
                                  }));
                                })
                            // : SizedBox.shrink()
                            )
                        : SizedBox(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width,
                            child: RoundedButton(
                              text: StringConstants.verify,
                              btnColor: ColorConstants.disableTextGrey,
                              btnWidth: 300,
                              press: () async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'OTP Mismatch!\nPlease enter correct OTP.')));
                              },
                            )),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(StringConstants.otpMessage),
                  secondsRemaining > 0
                      ? Text(' 00 : $secondsRemaining',
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.sp))
                      : TextButton(
                        onPressed: () async {
                          OtpLoginModel otpLogin = await controller.signIn(phoneValue);
                          // otpvalue = otpLogin as String? ;
                        },
                        child: Text(
                            StringConstants.resendOtp,
                            style: TextStyle(
                                fontSize: 16.sp, color: Colors.redAccent),
                          ),
                      )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void getPhoneNo() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    phoneValue = pref.getString('phoneNo');
    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
