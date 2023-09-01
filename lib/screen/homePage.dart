import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/screen/salesReport/salesReport.dart';
import 'package:untitled1/utils/api-helper.dart';

import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import 'LoginPage.dart';
import 'branches.dart';
import 'checkCreditLimit.dart';
import 'complain.dart';
import 'contactUs.dart';
import 'ledger/ledger.dart';
import 'new-order/new-order.dart';
import 'order-history/order-history.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  String balance = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            Positioned(
                top: 60.h,
                left: 16.w,
                right: 16.w,
                bottom: 0,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 8,
                                  child: Text(
                                    StringConstants.welcome,
                                    style: TextStyle(
                                        fontSize: 20.sp, color: Colors.white),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                      height: 26.5.h,
                                      width: 30.29.w,
                                      child: InkWell(
                                          onTap: () {
                                            showAlertDialog(context);
                                          },
                                          child: Image.asset(
                                              'assets/logout.png'))))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                StringConstants.appName,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Card(
                            color: Colors.white,
                            elevation: 2,
                            child: Stack(
                              children: [
                                SizedBox(
                                  child: Image.asset(
                                    'assets/card_background.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Positioned(
                                  top: 21.h,
                                  left: 14.w,
                                  right: 14.w,
                                  bottom: 0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Current Outstanding',
                                        style: TextStyle(fontSize: 18.sp),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Rs.',
                                            style: TextStyle(fontSize: 18.sp),
                                          ),
                                          Text(
                                            balance,
                                            // '365287.0',
                                            style: TextStyle(
                                                fontSize: 33.sp,
                                                fontWeight: FontWeight.w400,
                                                color: ColorConstants
                                                    .primaryColor),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Show More',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: ColorConstants.primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LedgerPage()));
                                  },
                                  child: SizedBox(
                                    width: 156.w,
                                    height: 140.h,
                                    child: Card(
                                      elevation: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/ledger.png'),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            StringConstants.ledger,
                                            style: TextStyle(fontSize: 14.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SalesReportPage()));
                                  },
                                  child: SizedBox(
                                    width: 156.w,
                                    height: 140.h,
                                    child: Card(
                                      elevation: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/salesreport.png'),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            StringConstants.salesReports,
                                            style: TextStyle(fontSize: 14.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const OrderHistory()
                                                ));
                                  },
                                  child: SizedBox(
                                    height: 140.h,
                                    width: 156.w,
                                    child: Card(
                                      elevation: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/pending order.png'),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            StringConstants.pendingOrder,
                                            style: TextStyle(fontSize: 14.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    height: 140.h,
                                    width: 156.w,
                                    child: Card(
                                      elevation: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/Courier.png'),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            StringConstants.courier,
                                            style: TextStyle(fontSize: 14.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NewOrder()));
                                  },
                                  child: SizedBox(
                                    height: 140.h,
                                    width: 156.w,
                                    child: Card(
                                      elevation: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/Order Booking.png'),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            StringConstants.orderBooking,
                                            style: TextStyle(fontSize: 14.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CheckCreditLimit()));
                                  },
                                  child: SizedBox(
                                    height: 140.h,
                                    width: 156.w,
                                    child: Card(
                                      elevation: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/Check credit limit icon.png'),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            StringConstants.checkCreditLimit,
                                            style: TextStyle(fontSize: 14.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Branch()));
                                  },
                                  child: SizedBox(
                                    height: 140.h,
                                    width: 156.w,
                                    child: Card(
                                      elevation: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/branch.png'),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            StringConstants.branch,
                                            style: TextStyle(fontSize: 14.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Complain()));
                                  },
                                  child: SizedBox(
                                    height: 140.h,
                                    width: 156.w,
                                    child: Card(
                                      elevation: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/Complain.png'),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Text(
                                            StringConstants.complain,
                                            style: TextStyle(fontSize: 14.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          SizedBox(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ContactUs()));
                              },
                              child: SizedBox(
                                height: 140.h,
                                width: 156.w,
                                child: Card(
                                  elevation: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/Contact Us.png'),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        StringConstants.contactUs,
                                        style: TextStyle(fontSize: 14.sp),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ))
          ],
        ));
  }

  void getBalance() async {
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.showCreditLimit,
      callType: StringConstants.postCall,
      fieldsMap: {
        'partycode': '00504'
      }
    );
    if (returnMap.containsKey('exception')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(returnMap['exception'])),
      );
    } else if (returnMap.containsKey('statusCode')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(returnMap['error'])),
      );
    } else {
      Map<String, dynamic> json = returnMap['body'];
      setState(() {
        balance = '${json['Balance']}';
      });
    }
  }
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: const Text(StringConstants.logout),
    content: const Text(StringConstants.doYouWantTologout),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                ModalRoute.withName('/'));
          },
          child: const Text(StringConstants.yes)),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(StringConstants.no)),
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}






// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_initicon/flutter_initicon.dart';
// import '../../utils/api-helper.dart';
// import '../../utils/app-images.dart';
// import '../Component/logout-popup.dart';
// import '../constants/colorConstants.dart';
// import '../constants/stringConstant.dart';
// import '../controller/home_controller.dart';
// import '../route/routes.dart';
// import '../utils/lotOfThemes.dart';
// import '../utils/preferences.dart';
//
// class HomePage extends StatefulWidget {
//   final String userId;
//   final String appType;
//
//   const HomePage({Key? key, required this.userId, required this.appType})
//       : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   AppPreferences preference = AppPreferences();
//   List<CardData> cardList = [];
//   HomeController controller = HomeController();
//
//   @override
//   void initState() {
//     cardList.addAll(controller.addList(widget.appType));
//     super.initState();
//     if (!widget.appType.contains("s")) {
//       getBalance();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: Container(
//           color: Colors.grey.withOpacity(0.04),
//           height: size.height,
//           width: size.width,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: size.height * 0.4,
//                 child: Stack(
//                   children: [
//                     //this color container is used because image is not perfect
//                     Container(
//                       color: ColorConstants.primaryColor,
//                       height: size.height * 0.16,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: size.height * 0.14),
//                       child: Image.asset(
//                         '${AppImages.imagePath}draw-bg.png',
//                         fit: BoxFit.cover,
//                         height: size.height * 0.3,
//                         width: size.width,
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.height * 0.3,
//                       child: Padding(
//                         padding:
//                         const EdgeInsets.only(top: 80, left: 20.0, right: 4),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(40),
//                                   child: CachedNetworkImage(
//                                     imageUrl: "",
//                                     //"https://img.freepik.com/free-photo/handsome-young-businessman-suit_273609-6513.jpg",
//                                     width: 53,
//                                     height: 53,
//                                     fit: BoxFit.cover,
//                                     errorWidget: (context, url, error) => Initicon(
//                                       text: StringConstants.appName,
//                                       size: 53,
//                                       borderRadius: BorderRadius.circular(40),
//                                       backgroundColor: Colors.white,
//                                       style: LotOfThemes.textBold(
//                                           ColorConstants.primary, 18),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text("Welcome",
//                                         style:
//                                         LotOfThemes.textSize(Colors.white, 20)),
//                                     const SizedBox(height: 6),
//                                     Text(StringConstants.appName,
//                                         style:
//                                         LotOfThemes.textBold(Colors.white, 20)),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             IconButton(
//                                 onPressed: () => showLogoutDialog(
//                                     context: context,
//                                     onPress: () => onLogoutClick()),
//                                 icon: const Icon(
//                                   Icons.logout,
//                                   color: Colors.white,
//                                 ))
//                           ],
//                         ),
//                       ),
//                     ),
//                     widget.appType.contains("s")
//                         ? const SizedBox.shrink()
//                         : Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 20),
//                         width: size.width,
//                         height: size.height * 0.2,
//                         child: Stack(
//                           children: [
//                             Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(14.0),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.start,
//                                   children: [
//                                     Text("Current balance",
//                                         style: LotOfThemes.textSize(
//                                             ColorConstants.blackColor, 18)),
//                                     const SizedBox(height: 16),
//                                     Row(
//                                       children: [
//                                         Text("Rs.",
//                                             style: LotOfThemes.textSize(
//                                                 ColorConstants.blackColor, 18)),
//                                         Text(balance,
//                                             style: LotOfThemes.textBold(
//                                                 ColorConstants.primaryColor, 32)),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 16),
//                                     Text("Show More",
//                                         style: LotOfThemes.textSize(
//                                             ColorConstants.primaryColor, 14)),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             // ),
//                             Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 3.0, right: 3, bottom: 4),
//                                 child: Image.asset(
//                                     '${AppImages.imagePath}shape-light-blue.png'),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Wrap(children: gridItems(cardList)),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
//
//   gridItems(List<CardData> list) {
//     return List<Widget>.generate(list.length, (index) {
//       return getGridItem(list[index]);
//     });
//   }
//
//   onLogoutClick() async {
//     await preference.logoutPreference();
//     // Navigator.of(context).pop();
//     Navigator.popAndPushNamed(context, loginPage);
//   }
//
//   getGridItem(CardData data) {
//     double width = MediaQuery.of(context).size.width;
//     return InkWell(
//       onTap: () => data.navigationName.isEmpty
//           ? null
//           : Navigator.pushNamed(context, data.navigationName),
//       child: Container(
//         width: width * 0.40,
//         height: width * 0.35,
//         margin: const EdgeInsets.all(10),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(14.0),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 AppImages.imagePath + data.icon,
//                 height: width * 0.14,
//                 width: width * 0.14,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Text(data.name, style: LotOfThemes.dark14),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   String balance = '';
//
//   void getBalance() async {
//     Map<String, dynamic> returnMap = await ApiHelper.hitApi(
//         api: StringConstants.showCreditLimit,
//         callType: StringConstants.postCall,
//         fieldsMap: {"partycode": widget.userId});
//
//     if (returnMap.containsKey('exception')) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(returnMap['exception'])),
//       );
//     } else if (returnMap.containsKey('statusCode')) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(returnMap['error'])),
//       );
//     } else {
//       Map<String, dynamic> json = returnMap['body'];
//       setState(() {
//         balance = '${json['Balance']}';
//       });
//     }
//   }
// }
