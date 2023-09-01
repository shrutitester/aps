import 'package:flutter/material.dart';

import '../../Model/articleWiseModel.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import 'addUserDialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleBox extends StatefulWidget {
  const ArticleBox({super.key});

  @override
  State<ArticleBox> createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  List<ArticleWise> userList = [];
  bool _isVisible = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    void addUserData(ArticleWise user) {
      setState(() {
        userList.add(user);
      });
    }

    return Column(
      children: [
        AddUserDialog(addUserData),
        SizedBox(
          height: 120.h,
          child: ListView(
            shrinkWrap: true,
            children: [
              userList.length > 0
                  ? Column(
                children: [
                  Container(
                    color: ColorConstants.primaryColor,
                    height: 40.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          StringConstants.enterDesign,
                          style: (TextStyle(
                              fontSize: 14.sp,
                              color: ColorConstants.mainBgColor)),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 12,
                        ),
                        Text(StringConstants.enterSize,
                            style: (TextStyle(
                                fontSize: 14.sp,
                                color: ColorConstants.mainBgColor))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 12,
                        ),
                        Text(StringConstants.enterColor,
                            style: (TextStyle(
                                fontSize: 14.sp,
                                color: ColorConstants.mainBgColor))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 12,
                        ),
                        Text(StringConstants.enterPcs,
                            style: (TextStyle(
                                fontSize: 14.sp,
                                color: ColorConstants.mainBgColor))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 12,
                        ),
                        Text(StringConstants.enterRate,
                            style: (TextStyle(
                                fontSize: 14.sp,
                                color: ColorConstants.mainBgColor))),
                      ],
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: userList.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          color: (index % 2 == 0) ? Colors.grey : Colors.white,
                          child: Row(
                            children: [
                               SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                  child: Text(
                                    userList[index].design ?? '',
                                    style:  TextStyle(fontSize: 14.sp),
                                  )),
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.width / 14,
                              ),
                              Expanded(
                                  child: Text(
                                    userList[index].size ?? '',
                                    style: TextStyle(fontSize: 14.sp),
                                  )),
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.width / 24,
                              ),
                              Expanded(
                                  child: Text(
                                    userList[index].color ?? '',
                                    style:  TextStyle(fontSize: 14.sp),
                                  )),
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.width / 24,
                              ),
                              Expanded(
                                  child: Text(
                                    userList[index].pcs ?? '',
                                    style:  TextStyle(fontSize: 14.sp),
                                  )),
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.width / 24,
                              ),
                              Expanded(
                                  child: Text(
                                    userList[index].rate ?? '',
                                    style:  TextStyle(fontSize: 14.sp),
                                  )),
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      userList.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              )
                  : const SizedBox.shrink()
            ],
          ),
        )
      ],
    );
  }
}