import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colorConstants.dart';
import '../constants/stringConstant.dart';
import '../controller/branch_controller.dart';
import '../utils/lotOfThemes.dart';
import 'package:url_launcher/url_launcher.dart';

class BranchDetail extends StatelessWidget {
  final BranchData data;

  const BranchDetail({Key? key, required this.data}) : super(key: key);

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
          StringConstants.brancheDetails,
          style: TextStyle(color: Colors.white, fontSize: 22.sp),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(
            "${data.name.toUpperCase()}",
            textAlign: TextAlign.center,
            style: LotOfThemes.heading17,
          ),
          const SizedBox(height: 16),
          if (data.address == null) const SizedBox.shrink() else Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Firm Address:",
                          style: LotOfThemes.dark15,
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            data.address?.address ?? '',
                            style: LotOfThemes.textSize(
                                ColorConstants.primaryColor, 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Tel. No. :",
                  //       style: LotOfThemes.dark15,
                  //     ),
                  //     Expanded(
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(left: 8.0),
                  //         child: Text(
                  //           data.address?.telNo ?? '',
                  //           style: LotOfThemes.dark14,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "CONTACT PERSON",
            textAlign: TextAlign.center,
            style: LotOfThemes.heading17,
          ),
          data.contacts.isEmpty
              ? const SizedBox.shrink()
              : Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListView.builder(
                itemCount: data.contacts.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  // flex: 4,
                                  child: Text(
                                    data.contacts[index].headHeading,
                                    style: LotOfThemes.dark14,
                                  ),
                                ),
                                Expanded(
                                  // flex: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      data.contacts[index].name,
                                      style: LotOfThemes.dark14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  // flex: 3,
                                  child: Text(
                                    "Contact No. :",
                                    style: LotOfThemes.dark14,
                                  ),
                                ),
                                Expanded(
                                  // flex: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            var url = Uri.parse('tel:${data.contacts[index].contactNo}');
                                            if (await canLaunchUrl(url)){
                                              await launchUrl(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child: Text(
                                            "${data.contacts[index].contact},",
                                            style: LotOfThemes.dark13,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            var url = Uri.parse('tel:${data.contacts[index].contact}');
                                            if (await canLaunchUrl(url)){
                                              await launchUrl(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child: Text(
                                            "${data.contacts[index].contactNo}",
                                            style: LotOfThemes.dark13,),),],),),),],),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  // flex: 4,
                                  child: Text(
                                    "E-mail :",
                                    style: LotOfThemes.dark14,
                                  ),
                                ),
                                Expanded(
                                  // flex: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: InkWell(
                                      onTap: () async{
                                        var url = Uri.parse('mailto: ${data.contacts[index].email}');
                                        // if (await can)
                                        if (await canLaunchUrl(url)){
                                          await launchUrl(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      child: Text(
                                        data.contacts[index].email,
                                        style: LotOfThemes.dark13,
                                      )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
