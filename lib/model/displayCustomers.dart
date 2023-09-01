// import 'package:untitled1/controller/allApiData.dart';
// import 'package:untitled1/model/data.dart';
//
// class DisplayCustomersModel{
//   bool? status;
//   String? message;
//   Customers? customers;
//
//   DisplayCustomersModel(
//       this.status,
//       this.message,
//       this.customers
//       );
//
//   DisplayCustomersModel.fromJson(Map<String, dynamic> json){
//     status = json['Status'];
//     message = json['Message'];
//     customers = json['customers'] != null
//         ? Customers.fromJson(json['cusromers'])
//         : null;
//   }
// }
//
// class Customers {
//   String? customerCode;
//   String? customerName;
//   String? partyCode;
//   String? activatedBy;
//   String? firmName;
//   String? address;
//   String? cityName;
//   String? email;
//   String? phone;
//   String? whatsAppNo;
//   String? gSTIN;
//   String? pAN;
//   String? aadhar;
//   String? birthDate;
//   String? maritalStatus;
//   String? marriageDate;
//   String? dealerType;
//   String? dealsIn;
//   String? userName;
//   String? password;
//   String? userType;
//   String? active;
//   String? tokenKey;
//   String? otp;
//   String? otpCreationTime;
//   String? imei;
//   String? message;
//   String? pinCode;
//   String? stateName;
//   String? districtName;
//   String? transport;
//   String? booking;
//   String? booking2;
//   String? refdBy;
//   String? crLimit;
//   String? crDays;
//
//   Map<String, dynamic> orderToJson(AllApiData allApiData) {
//     DataModel? prefix = allApiData.prefixData?.data?.firstWhere((element) => element.code == pre)
//   }
// }