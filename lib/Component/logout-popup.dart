// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../utils/lotOfThemes.dart';
//
// showLogoutDialog(
//     {required Function onPress, required BuildContext context}) async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           content: StatefulBuilder(builder: (context, setState) {
//             return SingleChildScrollView(
//                 child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(
//                   height: 22,
//                 ),
//                 const Icon(Icons.delete_outline_sharp, size: 40),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Text(
//                   'Are you sure?',
//                   style: GoogleFonts.rubik(
//                       fontSize: 19, fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Text(
//                   "Do you really want to Logout?",
//                   style: LotOfThemes.grey15,
//                 ),
//                 const SizedBox(
//                   height: 26,
//                 ),
//                 Container(
//                     color: Colors.grey,
//                     width: MediaQuery.of(context).size.width,
//                     height: 1),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: InkWell(
//                         onTap: () =>
//                           Navigator.of(context).pop(),
//                         child: const SizedBox(
//                           height: 40,
//                           child: Center(
//                             child: Text(
//                               'Cancel',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(color: Colors.grey, width: 1.4, height: 54),
//                     Expanded(
//                       child: InkWell(
//                         onTap:()=> onPress(),
//                         child: const SizedBox(
//                           height: 40,
//                           child: Center(
//                             child: Text(
//                               "Logout",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   color: Colors.red,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ));
//           }));
//     },
//   );
// }
