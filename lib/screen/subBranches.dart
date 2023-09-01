
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../constants/colorConstants.dart';
// import '../../constants/stringConstant.dart';
// import 'brancheDetails.dart';
//
// class SubBranches extends StatelessWidget {
//   const SubBranches({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorConstants.primaryColor,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon:  Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//             size: 22.sp,
//           ),
//         ),
//         title: Text(
//           StringConstants.branches,
//           style: TextStyle(color: Colors.white, fontSize: 22.sp),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding:
//              EdgeInsets.only(left: 16.0.w, right: 16.w, top: 24.h),
//             child: Row(
//               children: [
//                 Expanded(
//                     flex: 5,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (BuildContext context) {
//                               return const BranchDetail();
//                             }));
//                       },
//                       child: SizedBox(
//                         height: 150.h,
//                         width: 156.w,
//                         child: Card(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               CircleAvatar(
//                                 radius: 32,
//                                 backgroundImage:
//                                 Image.asset('assets/photo1.jpg').image,
//                               ),
//                                 SizedBox(
//                                 height: 10.h,
//                               ),
//                               const Text('Delhi')
//                             ],
//                           ),
//                         ),
//                       ),
//                     )),
//                   SizedBox(
//                   width: 16.w,
//                 ),
//                 Expanded(
//                     flex: 5,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (BuildContext context) {
//                               return const BrancheDetails();
//                             }));
//                       },
//                       child: SizedBox(
//                         height: 150.h,
//                         width: 156.w,
//                         child: Card(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               CircleAvatar(
//                                 radius: 32,
//                                 backgroundImage:
//                                 Image.asset('assets/photo1.jpg').image,
//                               ),
//                               SizedBox(
//                                 height: 10.h,
//                               ),
//                               const Text('Ludhiana')
//                             ],
//                           ),
//                         ),
//                       ),
//                     )),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
