// import 'package:flutter/material.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';import 'package:untitled1/screen/subBranches.dart';
// import '../../constants/colorConstants.dart'; import '../../constants/stringConstant.dart';
// class Branches extends StatelessWidget { const Branches({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorConstants.primaryColor,
//         leading: IconButton(onPressed: () {Navigator.pop(context);},icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 22.sp,),),
//         title: Text(StringConstants.branches,style: TextStyle(color: Colors.white, fontSize: 22.sp),),),
//       body: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 16.0.w, right: 16.w, top: 24.h),
//             child: Row(
//               children: [
//                 Expanded(
//                     flex: 5,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
//                           return const SubBranches(); }));},
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
//                                 Image.asset('assets/Delhi.png').image,
//                               ),
//                                     // Image.asset('assets/Delhi.jpg').image,
//
//                               SizedBox(
//                                 height: 10.h,
//                               ),
//                               const Text('Delhi')
//                             ],
//                           ),
//                         ),
//                       ),
//                     )),
//                 SizedBox(
//                   width: 16.w,
//                 ),
//                 Expanded(
//                     flex: 5,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (BuildContext context) {
//                           return const SubBranches();
//                         }));
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
//                                     Image.asset('assets/Ludhiana.png').image,
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
//           Padding(
//             padding: EdgeInsets.only(left: 16.0.w, right: 16.w, top: 24.h),
//             child: Row(
//               children: [
//                 Expanded(
//                     flex: 5,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (BuildContext context) {
//                           return const SubBranches();
//                         }));
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
//                                     Image.asset('assets/Kolkata.png').image,
//                               ),
//                               SizedBox(
//                                 height: 10.h,
//                               ),
//                               const Text('Kolkata')
//                             ],
//                           ),
//                         ),
//                       ),
//                     )),
//                 SizedBox(
//                   width: 16.w,
//                 ),
//                 Expanded(
//                     flex: 5,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (BuildContext context) {
//                           return const SubBranches();
//                         }));
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
//                                     Image.asset('assets/Ahmedabad.png').image,
//                               ),
//                               SizedBox(
//                                 height: 10.h,
//                               ),
//                               const Text('Ahmedabad')
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colorConstants.dart';
import '../constants/stringConstant.dart';
import '../controller/branch_controller.dart';
import '../utils/app-images.dart';
import '../utils/lotOfThemes.dart';
import 'brancheDetails.dart';
class Branch extends StatefulWidget {
  const Branch({Key? key}) : super(key: key);
  @override
  State<Branch> createState() => _BranchState();
}
class _BranchState extends State<Branch> {
  List<BranchData> cardList = [];
  BranchController controller=BranchController();
  @override
  void initState() {
    cardList.addAll(controller.addList());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 22.sp,
          ),
        ),
        title: Text(
          StringConstants.branches,
          style: TextStyle(color: Colors.white, fontSize: 22.sp),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                     SizedBox(height: 20.h),
                    Wrap(children: gridItems(cardList)),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  gridItems(List<BranchData> list) {
    return List<Widget>.generate(list.length, (index) {
      return getGridItem(list[index]);
    });
  }

  getGridItem(BranchData data) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () =>  Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BranchDetail(data:data),
        ),
      ),
      child: Container(
        width: 150,
        height: 156,
        margin:  EdgeInsets.only(left: 18,bottom: 16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.imagePath + data.icon,
                height: width * 0.14,
                width: width * 0.14,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(data.name, style: LotOfThemes.dark14, textAlign: TextAlign.center,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
