import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Model/articleWiseModel.dart';
import '../../component/roundButton.dart';
import '../../component/roundInputField.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import '../../utils/lotOfThemes.dart';

class AddUserDialog extends StatefulWidget {
  final Function(ArticleWise) addUser;

  const AddUserDialog(this.addUser, {super.key});

  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  List<ArticleWise> userList = [];
  final formKey = GlobalKey<FormState>();

  TextEditingController designController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController pcsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        StringConstants.design,
                        style: LotOfThemes.textText12,
                      ),
                      RoundedInputField(
                        controller: designController,
                        hintText: StringConstants.enterDesign,
                        keyboardType: TextInputType.name,
                        type: StringConstants.username,
                      ),
                    ],
                  ),
                ),
                 SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        StringConstants.size,
                        style: LotOfThemes.textText12,
                      ),
                      RoundedInputField(
                        controller: sizeController,
                        hintText: StringConstants.enterSize,
                        keyboardType: TextInputType.name,
                        type: StringConstants.username,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
           SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      StringConstants.color,
                      style: LotOfThemes.textText12,
                    ),
                    RoundedInputField(
                      controller: colorController,
                      hintText: StringConstants.enterColor,
                      keyboardType: TextInputType.name,
                      type: StringConstants.username,
                    ),
                  ],
                ),
              ),
               SizedBox(
                width: 15.w,
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      StringConstants.pcs,
                      style: LotOfThemes.textText12,
                    ),
                    RoundedInputField(
                      controller: pcsController,
                      hintText: StringConstants.enterPcs,
                      keyboardType: TextInputType.number,
                      type: StringConstants.username,
                    ),
                  ],
                ),
              ),
            ],
          ),
           SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      StringConstants.rate,
                      style: LotOfThemes.textText12,
                    ),
                    RoundedInputField(
                      controller: rateController,
                      hintText: StringConstants.enterRate,
                      keyboardType: TextInputType.number,
                      type: StringConstants.username,
                    ),
                  ],
                ),
              ),
               SizedBox(
                width: 15.w,
              ),
              Expanded(
                flex: 5,
                child: RoundedButton(
                    text: StringConstants.add,
                    btnColor: ColorConstants.black,
                    btnWidth: 300,
                    height: 45,
                    press: () {
                      if (formKey.currentState?.validate() == true) {
                        final user = ArticleWise(
                            designController.text,
                            sizeController.text,
                            colorController.text,
                            pcsController.text,
                            rateController.text);
                        widget.addUser(user);
                      }
                    }),
              ),
            ],
          ),
           SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}