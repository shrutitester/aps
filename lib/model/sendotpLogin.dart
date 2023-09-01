// import 'package:json_annotation/json_annotation.dart';
// part 'sendotpLogin.g.dart';

// @JsonSerializable()
class OtpLoginModel {
  bool? status;
  String? message;
  String? info;
  String? otp;
  String? appType;

  OtpLoginModel(this.status, this.message, this.info, this.otp, this.appType);

  OtpLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    info = json['Info'];
    otp = json['OTP'];
    appType = json['AppType'];
  }
}
