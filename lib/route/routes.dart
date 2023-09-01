import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/screen/new-order/new-order.dart';

import '../constants/stringConstant.dart';
import '../screen/LoginPage.dart';
import '../screen/brancheDetails.dart';
import '../screen/branches.dart';
import '../screen/checkCreditLimit.dart';
import '../screen/complain.dart';
import '../screen/contactUs.dart';
import '../screen/homePage.dart';
import '../screen/ledger.dart';
import '../screen/new-order/order-form.dart';
import '../screen/order-history/order-history.dart';
import '../screen/orderDetails.dart';
import '../screen/orderNewEntryScreen/orderNewEntry.dart';
import '../screen/registrationForm.dart';
import '../screen/salesReport.dart';
import '../screen/splashScreen.dart';
import '../screen/subBranches.dart';


const String myHomePage = 'myHomePage';
const String loginPage = 'login';
// const String loginwithUserId = 'loginwithUserId';
const String homePage = 'homePage';
const String newOrderPage = 'orderNewEntry';
const String brancheDetails = 'brancheDetails';
const String branchPage = 'branches';
const String creditLimitPage = 'checkCreditLimit';
const String complainPage = 'complain';
const String contactUsPage = 'contactUs';
const String ledgerPage = 'ledger';
const String orderDetails = 'orderDetails';
// const String otpLogin = 'otpLogin';
const String registrationForm = 'registrationForm';
const String salesReportPage = 'salesReport';
const String subBranches = 'subBranches';


Route<dynamic> controller(RouteSettings settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case myHomePage:
      return MaterialPageRoute(builder: (context) => const MyHomePage());
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
  // case loginwithUserId:
  //   return MaterialPageRoute(builder: (context) => const LoginWithUser());
  //   case homePage:
  //     return MaterialPageRoute(builder: (context) =>  HomePage(userId: StringConstants.userId, appType: StringConstants.userType,));
    case newOrderPage:
      return MaterialPageRoute(builder: (context) =>  NewOrder());
    // case brancheDetails:
    //   return MaterialPageRoute(builder: (context) => const BranchDetail(data: data,));
    case branchPage:
      return MaterialPageRoute(builder: (context) => const Branch());
    case creditLimitPage:
      return MaterialPageRoute(builder: (context) => const CheckCreditLimit());
    case complainPage:
      return MaterialPageRoute(builder: (context) => const Complain());
    case contactUsPage:
      return MaterialPageRoute(builder: (context) => const ContactUs());
    case ledgerPage:
      return MaterialPageRoute(builder: (context) => const Ledger());
    case orderDetails:
      return MaterialPageRoute(builder: (context) => const OrderHistory());
  // case otpLogin:
  //   return MaterialPageRoute(builder: (context) =>  OtpLogin(phoneValue: ,));
    case registrationForm:
      return MaterialPageRoute(builder: (context) => const RegistrationForm());
    case salesReportPage:
      return MaterialPageRoute(builder: (context) => const SalesReport());
    // case subBranches:
    //   return MaterialPageRoute(builder: (context) => const SubBranches());
    default:
      throw('This route name does not exist');
  }
}

