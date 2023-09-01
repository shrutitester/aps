
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/repository/app-repository.dart';
import 'package:untitled1/utils/api-helper.dart';

import '../../component/roundButton.dart';
import '../../component/roundInputField.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import '../Component/searchable-text.dart';
import '../model/data.dart';
import '../model/showCreditLimitModel.dart';
import '../utils/lotOfThemes.dart';

class CheckCreditLimit extends StatefulWidget {
  const CheckCreditLimit({super.key});

  @override
  State<CheckCreditLimit> createState() => _CheckCreditLimitState();
}

class _CheckCreditLimitState extends State<CheckCreditLimit> {
  // final _formKey = GlobalKey<FormState>();
  String? _chosenValue;
  String balance = '';
  String creditLimit = '';
  // String? code ;

  @override
  void initState() {
    super.initState();
    getPartyList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          StringConstants.checkCreditLimit,
          style: TextStyle(fontSize: 22.sp, color: Colors.white),
        ),
        backgroundColor: ColorConstants.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 17.w, top: 16.h, right: 15.0.w),
        child: ListView(
          children: [
            Text(
              StringConstants.customer,
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownSearch<String>(
                  popupProps: const PopupProps.dialog(
                      showSearchBox: true, showSelectedItems: true),
                  items: customerData?.searchModel?.nameList?.toList() ??[],
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                          hintText: StringConstants.selectCustomer)),
                  onChanged: (value) {
                    getCreditLimit(value);
                  },
                  selectedItem: _chosenValue,
                )),

            // SearchableText(
            //   model: customerData != null ? customerData?.searchModel! : ,
              // model: customerData != null ? customerData?.searchModel! : null,
              // hint: "Select Customer",
              // onChanged: (value) => {getCreditLimit(value)},
            // ),

            SizedBox(
              height: 20.h,
            ),
            Text(
              StringConstants.balance,
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: ColorConstants.midGrey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Text(
                balance,
                style: LotOfThemes.dark14,
              ),
            ),
            // RoundedInputField(
            //   keyboardType: TextInputType.number,
            //   type: StringConstants.username,
            // ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              StringConstants.creditLimit,
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: ColorConstants.midGrey,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              child: Text(
                creditLimit,
                style: LotOfThemes.dark14,
              ),
            ),
            // Container(
            //   child: Text('${model?.crLimit ?? ''}'),
            // ),
            // RoundedInputField(
            //   keyboardType: TextInputType.phone,
            //   type: StringConstants.username,
            // ),
          ],
        ),
      ),
    );
  }

  Data? customerData;

  void getPartyList() async {
    Map<String, dynamic> customerMap = {'groupcode': '00008,00009'};
    Data customer = await AppRepository.getApiData(
        bodyMap: customerMap,
        api: StringConstants.listParties,
        listName: 'Parties',
        code: 'PartyCode',
        name: 'PartyName');

    setState(() => customerData = customer);
  }

  getCreditLimit(value) async {
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: StringConstants.showCreditLimit,
        callType: StringConstants.postCall,
        fieldsMap: {'partycode': value});

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
        creditLimit = '${json['CrLimit']}';
      });
    }
  }
}
