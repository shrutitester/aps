import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/repository/app-repository.dart';

import '../../Component/roundButton.dart';
import '../../component/roundInputField.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import '../../model/data.dart';
import '../../utils/lotOfThemes.dart';
import 'checkboxes.dart';

class OrderNewEntry extends StatefulWidget {
  const OrderNewEntry({super.key});

  @override
  State<OrderNewEntry> createState() => _OrderNewEntryState();
}

class _OrderNewEntryState extends State<OrderNewEntry> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  String? scheme;
  String? loose;
  bool value = false;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();
  // FilePickerResult? result;
  final _formKey = GlobalKey<FormState>();
  String? _chosenValue;
  String? _chosenValue1;
  String? _chosenValue2;
  String? _chosenValue3;
  String? _chosenValue4;
  String? _chosenValue5;
  String? _chosenValue7;
  File? image;
  String? dateValue;
  String? deliveryDate;
  String? cases;
  String? marka;
  String? pcs;
  String? amount;
  String? bookingStation;
  String? marketerName;
  String? marketerMobile;
  String? billing;
  String? export;
  String? selectFinancialYear;
  String? remark;
  String? prefix;
  String? branch;
  String? customer;
  String? subparty;
  String? supplier;
  String? transport;
  String? brand;
  String? article;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print(StringConstants.failedToPickImage + '$e');
    }
  }

  @override
  void initState() {
    dateinput.text = '';
    dateinput1.text = '';
    super.initState();
    getPrefixValue();
    getFinanicalValue();
    getPartyList();
    getBranchValue();
    getBrandValue();
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
            color: ColorConstants.mainBgColor,
          ),
        ),
        title: Text(
          StringConstants.orderNewEntry,
          style: TextStyle(fontSize: 22.sp, color: ColorConstants.mainBgColor),
        ),
      ),
      key: _globalKey,
      backgroundColor: ColorConstants.primaryColor,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(
                    top: 20.h, left: 16.w, right: 16.w, bottom: 0),
                height: 220.h,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstants.selectFinancialYear,
                            style: LotOfThemes.textText12,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                              height: 50.h,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.w),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownSearch<String>(
                                popupProps: const PopupProps.dialog(
                                    showSearchBox: true,
                                    showSelectedItems: true),
                                items: finanicalData?.searchModel?.nameList
                                        ?.toList() ??
                                    [],
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                border: InputBorder.none,
                                                hintText: StringConstants
                                                    .selectFinancialYear)),
                                onChanged: (val) {
                                  selectFinancialYear = val;
                                },
                                selectedItem: _chosenValue1,
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.prefix,
                            style: LotOfThemes.textText12,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                              height: 50.h,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.w),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownSearch<String>(
                                popupProps: const PopupProps.dialog(
                                    showSearchBox: true,
                                    showSelectedItems: true),
                                items: prefixData?.searchModel?.nameList
                                        ?.toList() ??
                                    [],
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                border: InputBorder.none,
                                                hintText: StringConstants
                                                    .selectPrefix)),
                                onChanged: (val) {
                                  prefix = val;
                                },
                                selectedItem: _chosenValue1,
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.branch,
                            style: LotOfThemes.textText12,
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
                                  border: Border.all(
                                      color: Colors.grey, width: 1.w),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownSearch<String>(
                                popupProps: const PopupProps.dialog(
                                    showSearchBox: true,
                                    showSelectedItems: true),
                                items: branchData?.searchModel?.nameList
                                        ?.toList() ??
                                    [],
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                border: InputBorder.none,
                                                hintText: StringConstants
                                                    .selectBranch)),
                                onChanged: (val) {
                                  branch = val;
                                },
                                selectedItem: _chosenValue2,
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.customer,
                            style: LotOfThemes.textText12,
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
                                  border: Border.all(
                                      color: Colors.grey, width: 1.w),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownSearch<String>(
                                popupProps: const PopupProps.dialog(
                                    showSearchBox: true,
                                    showSelectedItems: true),
                                items: partiesData?.searchModel?.nameList
                                        ?.toList() ??
                                    [],
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                border: InputBorder.none,
                                                hintText: StringConstants
                                                    .selectCustomer)),
                                onChanged: (val) {
                                  customer = val;
                                },
                                selectedItem: _chosenValue3,
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.subParty,
                            style: LotOfThemes.textText12,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                              height: 50.h,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 16.w, right: 16.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.w),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownSearch<String>(
                                popupProps: const PopupProps.dialog(
                                    showSearchBox: true,
                                    showSelectedItems: true),
                                items: const ['ABC', 'XYZ', 'OPQ', 'STU'],
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                border: InputBorder.none,
                                                hintText: StringConstants
                                                    .selectSubParty)),
                                onChanged: (val) {
                                  subparty = val;
                                },
                                selectedItem: _chosenValue4,
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.supplier,
                            style: LotOfThemes.textText12,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                              height: 50.h,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 16.w, right: 16.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.w),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownSearch<String>(
                                popupProps: const PopupProps.dialog(
                                    showSearchBox: true,
                                    showSelectedItems: true),
                                items: partiesData?.searchModel?.nameList
                                        ?.toList() ??
                                    [],
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                border: InputBorder.none,
                                                hintText: StringConstants
                                                    .selectSupplier)),
                                onChanged: (val) {
                                  supplier = val;
                                },
                                selectedItem: _chosenValue5,
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(StringConstants.scheme),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Radio(
                                                value: 'y',
                                                groupValue: scheme,
                                                onChanged: (value) {
                                                  setState(() {
                                                    scheme = value.toString();
                                                  });
                                                },
                                              ),
                                              Text(
                                                StringConstants.yes,
                                                maxLines: 1,
                                                style:
                                                    TextStyle(fontSize: 14.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Radio(
                                                value: 'n',
                                                groupValue: scheme,
                                                onChanged: (value) {
                                                  setState(() {
                                                    scheme = value.toString();
                                                  });
                                                },
                                              ),
                                              Text(
                                                StringConstants.no,
                                                maxLines: 1,
                                                style:
                                                    TextStyle(fontSize: 14.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(StringConstants.loose),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Radio(
                                                value: 'y',
                                                groupValue: loose,
                                                onChanged: (value) {
                                                  setState(() {
                                                    loose = value.toString();
                                                  });
                                                },
                                              ),
                                              Text(
                                                StringConstants.yes,
                                                maxLines: 1,
                                                style:
                                                    TextStyle(fontSize: 14.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Radio(
                                                value: 'n',
                                                groupValue: loose,
                                                onChanged: (value) {
                                                  setState(() {
                                                    loose = value.toString();
                                                  });
                                                },
                                              ),
                                              Text(
                                                StringConstants.no,
                                                maxLines: 1,
                                                style:
                                                    TextStyle(fontSize: 14.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // CustomerRadioButton(),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              const Text(StringConstants.billing),
                              SizedBox(
                                width: 10.w,
                              ),
                              Checkbox(
                                  value: value,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.value = value!;
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.selectDate,
                            style: LotOfThemes.textText12,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextFormField(
                            onChanged: (val) {
                              dateValue = val;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select date';
                              }
                              return null;
                            },
                            controller: dateinput,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: StringConstants.enterDate,
                              suffixIcon: Icon(Icons.calendar_today_outlined),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                setState(() {
                                  dateinput.text = formattedDate;
                                });
                              } else {
                                const Text(StringConstants.dateIsNotSelected);
                              }
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.deliveryDate,
                            style: LotOfThemes.textText12,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          TextFormField(
                            onChanged: (val) {
                              deliveryDate = val;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select date';
                              }
                              return null;
                            },
                            controller: dateinput1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: StringConstants.deliveryDate,
                              suffixIcon: Icon(Icons.calendar_today_outlined),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                setState(() {
                                  dateinput1.text = formattedDate;
                                });
                              } else {
                                const Text(StringConstants.dateIsNotSelected);
                              }
                            },
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
                                      StringConstants.cases,
                                      style: LotOfThemes.textText12,
                                    ),
                                    RoundedInputField(
                                      hintText: StringConstants.enterCase,
                                      keyboardType: TextInputType.name,
                                      type: StringConstants.username,
                                      onChanged: (val) {
                                        cases = val;
                                      },
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
                                      StringConstants.marka,
                                      style: LotOfThemes.textText12,
                                    ),
                                    RoundedInputField(
                                      hintText: StringConstants.enterMarks,
                                      keyboardType: TextInputType.name,
                                      type: StringConstants.username,
                                      onChanged: (val) {
                                        marka = val;
                                      },
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
                                      StringConstants.pcs,
                                      style: LotOfThemes.textText12,
                                    ),
                                    RoundedInputField(
                                      hintText: StringConstants.enterPcs,
                                      keyboardType: TextInputType.number,
                                      type: StringConstants.username,
                                      onChanged: (val) {
                                        pcs = val;
                                      },
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
                                      StringConstants.amount,
                                      style: LotOfThemes.textText12,
                                    ),
                                    RoundedInputField(
                                      hintText: StringConstants.enterAmount,
                                      maxLength: 10,
                                      counterText: '',
                                      keyboardType: TextInputType.number,
                                      type: StringConstants.username,
                                      onChanged: (val) {
                                        amount = val;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.selectTransport,
                            style: LotOfThemes.textText12,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                              height: 50.h,
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownSearch<String>(
                                popupProps: const PopupProps.dialog(
                                    showSearchBox: true,
                                    showSelectedItems: true),
                                items: partiesData?.searchModel?.nameList
                                        ?.toList() ??
                                    [],
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                border: InputBorder.none,
                                                hintText: StringConstants
                                                    .selectTransport)),
                                onChanged: (val) {
                                  transport = val;
                                },
                                selectedItem: _chosenValue,
                              )),
                          SizedBox(
                            height: 20.h,
                          ),

                          Text(
                            StringConstants.bookingStation,
                            style: LotOfThemes.textText12,
                          ),
                          RoundedInputField(
                            hintText: StringConstants.bookingStation,
                            keyboardType: TextInputType.name,
                            type: StringConstants.username,
                            onChanged: (val) {
                              bookingStation = val;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.marketerName,
                            style: LotOfThemes.textText12,
                          ),
                          RoundedInputField(
                            hintText: StringConstants.marketerName,
                            keyboardType: TextInputType.name,
                            type: StringConstants.username,
                            onChanged: (val) {
                              marketerName = val;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.marketerMobileNo,
                            style: LotOfThemes.textText12,
                          ),
                          RoundedInputField(
                            hintText: StringConstants.marketerMobileNo,
                            keyboardType: TextInputType.phone,
                            type: StringConstants.mobile,
                            maxLength: 10,
                            counterText: '',
                            onChanged: (val) {
                              marketerMobile = val;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.billing,
                            style: LotOfThemes.textText12,
                          ),
                          RoundedInputField(
                            hintText: StringConstants.enterBilling,
                            keyboardType: TextInputType.name,
                            type: StringConstants.username,
                            onChanged: (value) {
                              billing = value;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.exportTo,
                            style: LotOfThemes.textText12,
                          ),
                          RoundedInputField(
                            hintText: StringConstants.enterExportTo,
                            keyboardType: TextInputType.name,
                            type: StringConstants.username,
                            onChanged: (value) {
                              export = value;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.remark,
                            style: LotOfThemes.textText12,
                          ),
                          RoundedInputField(
                            hintText: StringConstants.enterRemark,
                            keyboardType: TextInputType.name,
                            type: StringConstants.username,
                            onChanged: (value) {
                              remark = value;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            StringConstants.brand,
                            style: LotOfThemes.textText12,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Container(
                              height: 50.h,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownSearch<String>(
                                popupProps: const PopupProps.dialog(
                                    showSearchBox: true,
                                    showSelectedItems: true),
                                items: brandData?.searchModel?.nameList
                                        ?.toList() ??
                                    [],
                                dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                                border: InputBorder.none,
                                                hintText: StringConstants
                                                    .selectBrand)),
                                onChanged: (val) {
                                  brand = val;
                                },
                                selectedItem: _chosenValue7,
                              )),
                          SizedBox(
                            height: 20.h,
                          ),

                          Text(
                            StringConstants.pleaseUploadSupplierOrderForm,
                            style: LotOfThemes.textText12,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          // if (result != null)
                          //   Padding(
                          //     padding: const EdgeInsets.all(8),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         const Text(
                          //           StringConstants.uploadDocument,
                          //           style: TextStyle(fontSize: 16),
                          //         ),
                          //         ListView.builder(
                          //             shrinkWrap: true,
                          //             itemCount: result?.files.length ?? 0,
                          //             itemBuilder: (context, index) {
                          //               return Text(
                          //                 result?.files[index].name ?? '',
                          //                 style: const TextStyle(
                          //                   fontSize: 14,
                          //                 ),
                          //               );
                          //             })
                          //       ],
                          //     ),
                          //   ),
                          // SizedBox(
                          //   height: 80,
                          //   width: MediaQuery.of(context).size.width,
                          //   child: ElevatedButton(
                          //     style: ButtonStyle(
                          //         foregroundColor: MaterialStateProperty.all<Color>(
                          //             const Color(0xFF2C2C2C)),
                          //         backgroundColor: MaterialStateProperty.all<Color>(
                          //             const Color(0x0fe0e0e0)),
                          //         shape: MaterialStateProperty.all<
                          //                 RoundedRectangleBorder>(
                          //             RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(5),
                          //                 side: const BorderSide(
                          //                     color: Colors.grey)))),
                          //     onPressed: () async {
                          //       result = await FilePicker.platform
                          //           .pickFiles(allowMultiple: true);
                          //       if (result == null) {
                          //         print('No file selected');
                          //       } else {
                          //         result?.files.forEach((element) {
                          //           print(element.name);
                          //         });
                          //       }
                          //     },
                          //     child: const Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Icon(Icons.upload_file_rounded),
                          //         Text(
                          //           StringConstants.uploadDocument,
                          //           style: TextStyle(fontSize: 14),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          image != null
                              ? SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Image.file(image!),
                                )
                              : const SizedBox.shrink(),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 80.h,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF2C2C2C)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color(0x0fe0e0e0)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: const BorderSide(
                                                color: Colors.grey)))),
                                onPressed: () {
                                  pickImage();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.upload_file_rounded),
                                    Text(
                                      StringConstants.uploadDocument,
                                      style: TextStyle(fontSize: 14.sp),
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            height: 50.h,
                            width: MediaQuery.of(context).size.width,
                            child: RoundedButton(
                                text: StringConstants.submitTxt,
                                btnColor: ColorConstants.primaryColor,
                                btnWidth: 300,
                                press: () {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    AlertDialog alert = AlertDialog(
                                      title: const Text(
                                          StringConstants.orderNewEntry),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .selectFinancialYear)),
                                                Expanded(
                                                    child: Text(
                                                        '$selectFinancialYear'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .prefix)),
                                                Expanded(
                                                    child: Text('$prefix'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .branch)),
                                                Expanded(
                                                    child: Text('$branch'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .customer)),
                                                Expanded(
                                                    child: Text('$customer'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .subParty)),
                                                Expanded(
                                                    child: Text('$subparty'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .supplier)),
                                                Expanded(
                                                    child: Text('$supplier'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .scheme)),
                                                Expanded(
                                                    child: Text('$scheme'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(
                                                        StringConstants.loose)),
                                                Expanded(
                                                    child: Text('$loose'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .selectDate)),
                                                Expanded(
                                                    child: Text('$dateValue')),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .deliveryDate)),
                                                Expanded(
                                                    child: Text('$dateValue')),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(
                                                        StringConstants.cases)),
                                                Expanded(
                                                    child: Text('$cases'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(
                                                        StringConstants.marka)),
                                                Expanded(
                                                    child: Text('$marka'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(
                                                        StringConstants.pcs)),
                                                Expanded(child: Text('$pcs'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .amount)),
                                                Expanded(
                                                    child: Text('$amount'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .selectTransport)),
                                                Expanded(
                                                    child: Text('$transport'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .bookingStation)),
                                                Expanded(
                                                    child: Text(
                                                        '$bookingStation'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .marketerName)),
                                                Expanded(
                                                    child:
                                                        Text('$marketerName'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .marketerMobileNo)),
                                                Expanded(
                                                    child: Text(
                                                        '$marketerMobile'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .billing)),
                                                Expanded(
                                                    child: Text('$billing')),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .exportTo)),
                                                Expanded(
                                                    child: Text('$export')),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .remark)),
                                                Expanded(
                                                    child: Text('$remark'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(
                                                        StringConstants.brand)),
                                                Expanded(
                                                    child: Text('$brand'!)),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                    child: Text(StringConstants
                                                        .article)),
                                                Expanded(
                                                    child: Text('$article'!)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              // Navigator.push(context,
                                              //     MaterialPageRoute(builder:
                                              //         (BuildContext context) {
                                              //   return const HomePage();
                                              // }));
                                            },
                                            child:
                                                const Text(StringConstants.ok))
                                      ],
                                    );
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        });
                                  } else {
                                    showAlertDialog(context);
                                  }
                                }),
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Data? prefixData;
  Data? finanicalData;
  Data? branchData;
  Data? brandData;
  Data? partiesData;

  void getPrefixValue() async {
    Data prefix =
        await AppRepository.getApiData(api: StringConstants.listPrefixes);
    setState(() => prefixData = prefix);
  }

  void getFinanicalValue() async {
    Data finanical =
        await AppRepository.getApiData(api: StringConstants.listFinYear);
    setState(() => finanicalData = finanical);
  }

  void getBranchValue() async {
    Data branch =
        await AppRepository.getApiData(api: StringConstants.listBranches);
    setState(() => branchData = branch);
  }

  void getPartyList() async {
    Map<String, dynamic> customerMap = {'groupcode': '00001'};
    Data parties = await AppRepository.getApiData(
        bodyMap: customerMap,
        api: StringConstants.listParties,
        listName: 'Parties',
        code: 'PartyCode',
        name: 'PartyName');
    setState(() => partiesData = parties);
  }

  void getBrandValue() async {
    Data brand =
        await AppRepository.getApiData(api: StringConstants.listBrands);
    setState(() => brandData = brand);
  }
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: const Text(StringConstants.alert),
    content: const Text(StringConstants.invalid_allfields),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(StringConstants.ok)),
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
