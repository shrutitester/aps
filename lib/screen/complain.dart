import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../component/roundButton.dart';
import '../../component/roundInputField.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import '../model/data.dart';
import '../utils/api-helper.dart';
import '../utils/preferences.dart';

class Complain extends StatefulWidget {
  const Complain({super.key});

  @override
  State<Complain> createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  final _formKey = GlobalKey<FormState>();
  String? _chosenValue;
  String sales = '';
  String referenceNo = '';
  String complaint = '';
  String? userId;
  AppPreferences preferences = AppPreferences();

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 22.sp,
            )),
        title:  Text(
          StringConstants.complain,
          style: TextStyle(color: Colors.white, fontSize: 22.sp),
        ),
        backgroundColor: ColorConstants.primaryColor,
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 17.w, top: 16.h, right: 15.0.w),
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: ListView(
                children: [
                   Text(
                    StringConstants.sales,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                   SizedBox(
                    height: 8.h,
                  ),
                  Container(
                      height: 40.h,
                      width: MediaQuery.of(context).size.width,
                      padding:  EdgeInsets.symmetric(horizontal: 16.w,),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownSearch<String>(
                        popupProps: const PopupProps.dialog(
                            showSearchBox: true,
                            showSelectedItems: true
                        ),
                        items: ['Sales', 'Order', 'Accounts', 'Others'],
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              border: InputBorder.none,
                                hintText: StringConstants.selectCreditLimit
                            )
                        ),
                        onChanged: (val){
                          sales = val!;
                          },
                        selectedItem: _chosenValue,
                      )
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                   Text(
                    StringConstants.refernceNo,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                   // SizedBox(
                   //  height: 8.h,
                  // ),
                  RoundedInputField(
                    hintText: StringConstants.enterReferenceNo,
                    keyboardType: TextInputType.number,
                    type: StringConstants.username,
                    onChanged: (value){
                      referenceNo = value;
                    },
                  ),
                   SizedBox(
                    height: 10.h,
                  ),
                   Text(
                    StringConstants.yourComplaint,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                   // SizedBox(
                   //  height: 8.h,
                  // ),
                  RoundedInputField(
                    hintText: StringConstants.pleaseEnterYourCompaintHere,
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                    type: StringConstants.username,
                    onChanged: (value){
                      complaint = value;
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
                left: 0,
                bottom: 29,
                child: SizedBox(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    child: RoundedButton(
                        text: StringConstants.submitTxt,
                        btnColor: ColorConstants.primaryColor,
                        btnWidth: 300,
                        press: onSubmit
                        )
                    ))
          ],
        ),
      ),
    );
  }

  bool isLoading = false;
  bool? status;
  String? message;

  onSubmit() async {
    if(_chosenValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Select sales first!'))
      );
      return;
    }
    setState(() => isLoading = true);

    Map<String, dynamic> bodyMap = {
      'partycode' : userId,
      'type' : _chosenValue,
      'message' : complaint,
      'refno' : referenceNo
    };

    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.addComplaint,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );

    setState(() {
      if (returnMap.containsKey('exception')) {
        status = false;
        message = returnMap['exception'];
      } else if (returnMap.containsKey('statusCode')) {
        status = false;
        message = returnMap['error'];
      } else {
        Map<String, dynamic> json = returnMap['body'];
        status = json['Status'];
        message = json['Message'];
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$message')),
    );

    if (status == true) {
      Navigator.of(context).pop();
    }
    setState(() => isLoading = false);
  }

  Data? customerData;
  void getUserId() async {
    userId = await preferences.getStringPreference(StringConstants.userId);
  }
}
