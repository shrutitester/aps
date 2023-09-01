import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colorConstants.dart';
import '../../utils/lotOfThemes.dart';
import '../constants/stringConstant.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  String? scheme;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();
  String? _chosenValue1;
  String? _chosenValue2;

  @override
  void initState() {
    dateinput.text = '';
    dateinput1.text = '';
    super.initState();
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
          ),
        ),
        title:  Text(
          StringConstants.orderDetails,
          style: TextStyle(fontSize: 22.sp, color: Colors.white),
        ),
        backgroundColor: ColorConstants.primaryColor,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 14.0.w),
            child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.black)))),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            child: Stack(
                              children: [
                                Container(
                                  height: 50.h,
                                  width: MediaQuery.of(context).size.width,
                                  color: ColorConstants.primaryColor,
                                  child: ListTile(
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.cancel,
                                        color: ColorConstants.mainBgColor,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    title:  Text(
                                      StringConstants.filter,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14.sp),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 60.h,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 18.w,),
                                      child: ListView(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                    height: 50.h,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    padding:
                                                         EdgeInsets.symmetric(horizontal: 16.w,),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child:
                                                        DropdownSearch<String>(
                                                      popupProps:
                                                          const PopupProps
                                                                  .dialog(
                                                              showSearchBox:
                                                                  true,
                                                              showSelectedItems:
                                                                  true),
                                                      items: const [
                                                        'ABC',
                                                        'XYZ',
                                                        'OPQ',
                                                        'STU'
                                                      ],
                                                      dropdownDecoratorProps:
                                                          const DropDownDecoratorProps(
                                                              dropdownSearchDecoration:
                                                                  InputDecoration(
                                                                    border: InputBorder.none,
                                                                      hintText:
                                                                          StringConstants
                                                                              .selectCustomer)),
                                                      onChanged: (val) {
                                                        print(val);
                                                      },
                                                      selectedItem:
                                                          _chosenValue1,
                                                    )),
                                              ),
                                               SizedBox(
                                                width: 15.w,
                                              ),
                                              Expanded(
                                                child: Container(
                                                    height: 50.h,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    padding:
                                                         EdgeInsets.symmetric(horizontal: 16.w,),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child:
                                                        DropdownSearch<String>(
                                                      popupProps:
                                                          const PopupProps
                                                                  .dialog(
                                                              showSearchBox:
                                                                  true,
                                                              showSelectedItems:
                                                                  true),
                                                      items: const [
                                                        'ABC',
                                                        'XYZ',
                                                        'OPQ',
                                                        'STU'
                                                      ],
                                                      dropdownDecoratorProps:
                                                          const DropDownDecoratorProps(
                                                              dropdownSearchDecoration:
                                                                  InputDecoration(
                                                                    border: InputBorder.none,
                                                                      hintText:
                                                                          StringConstants
                                                                              .selectSupplier)),
                                                      onChanged: (val) {
                                                        print(val);
                                                      },
                                                      selectedItem:
                                                          _chosenValue2,
                                                    )),
                                              ),
                                            ],
                                          ),
                                           SizedBox(
                                            height: 15.h,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextFormField(
                                                  controller: dateinput,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter some text';
                                                    }
                                                    return null;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText: StringConstants
                                                        .dateFrom,
                                                    suffixIcon: Icon(Icons
                                                        .calendar_today_outlined),
                                                  ),
                                                  readOnly: true,
                                                  onTap: () async {
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(2101));
                                                    if (pickedDate != null) {
                                                      String formattedDate =
                                                          DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(
                                                                  pickedDate);
                                                      setState(() {
                                                        dateinput.text =
                                                            formattedDate;
                                                      });
                                                    } else {
                                                      print(StringConstants.dateIsNotSelected);
                                                    }
                                                  },
                                                ),
                                              ),
                                               SizedBox(
                                                width: 15.w,
                                              ),
                                              Expanded(
                                                child: TextFormField(
                                                  controller: dateinput1,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter some text';
                                                    }
                                                    return null;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText:
                                                        StringConstants.dateTo,
                                                    suffixIcon: Icon(Icons
                                                        .calendar_today_outlined),
                                                  ),
                                                  readOnly: true,
                                                  onTap: () async {
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(2101));
                                                    if (pickedDate != null) {
                                                      String formattedDate =
                                                          DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(
                                                                  pickedDate);
                                                      setState(() {
                                                        dateinput1.text =
                                                            formattedDate;
                                                      });
                                                    } else {
                                                      print(StringConstants.dateIsNotSelected);
                                                    }
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                           SizedBox(
                                            height: 20.h,
                                          ),
                                          SizedBox(
                                            height: 50.h,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                  foregroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.white),
                                                  backgroundColor: MaterialStateProperty.all<
                                                          Color>(
                                                      const Color(0xFFFF4A52)),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(5),
                                                          side: const BorderSide(color: Colors.redAccent)))),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return ListView(
                                                        children: [
                                                          Container(
                                                            color: ColorConstants
                                                                .primaryColor,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 60.h,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      16.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 165.w,
                                                                    height: 50.h,
                                                                    child:
                                                                        ElevatedButton(
                                                                      style: ButtonStyle(
                                                                          foregroundColor: MaterialStateProperty.all<Color>(ColorConstants
                                                                              .mainBgColor),
                                                                          backgroundColor: MaterialStateProperty.all<Color>(ColorConstants
                                                                              .black),
                                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(5),
                                                                              side: BorderSide(color: ColorConstants.black)))),
                                                                      onPressed:
                                                                          () {},
                                                                      child:
                                                                          const Row(
                                                                        children: [
                                                                          Icon(
                                                                            Icons.download,
                                                                          ),
                                                                          Text(StringConstants
                                                                              .downloadPdf)
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    color: Colors
                                                                        .white,
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .cancel),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                                 Padding(
                                                                  padding: EdgeInsets.all(16.0),
                                                                  child: Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Expanded(child: Text(StringConstants.vchNo, style: LotOfThemes.textText12,)),
                                                                          Expanded(child: Text(StringConstants.date, style: LotOfThemes.textText12,))
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: 12.h,),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(child: Text(StringConstants.vchDate, style: LotOfThemes.textText12,)),
                                                                          Expanded(child: Text(StringConstants.orderNo, style: LotOfThemes.textText12,))
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: 12.h,),
                                                                      Text(StringConstants.customer, style: LotOfThemes.textText12),
                                                                      SizedBox(height: 12.h,),
                                                                      Text(StringConstants.supplier, style: LotOfThemes.textText12),
                                                                      SizedBox(height: 12.h,),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(child: Text(StringConstants.pcs, style: LotOfThemes.textText12)),
                                                                          Expanded(child: Text(StringConstants.cases, style: LotOfThemes.textText12))
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: 12.h,),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(child: Text(StringConstants.prefix, style: LotOfThemes.textText12)),
                                                                          Expanded(child: Text(StringConstants.branch, style: LotOfThemes.textText12))
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: 12.h,),
                                                                      Text(StringConstants.brand, style: LotOfThemes.textText12),
                                                                      SizedBox(height: 12.h,),
                                                                      Text(StringConstants.subAc, style: LotOfThemes.textText12),
                                                                      SizedBox(height: 12.h,),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(child: Text(StringConstants.transport, style: LotOfThemes.textText12)),
                                                                          Expanded(child: Text(StringConstants.givenBy, style: LotOfThemes.textText12)),
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: 12.h,),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(child: Text(StringConstants.marka, style: LotOfThemes.textText12)),
                                                                          Expanded(child: Text(StringConstants.booking, style: LotOfThemes.textText12)),
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: 12.h,),
                                                                      Text(StringConstants.remark, style: LotOfThemes.textText12),
                                                                      SizedBox(height: 12.h,),
                                                                      Text(StringConstants.billingFirm, style: LotOfThemes.textText12),
                                                                      SizedBox(height: 12.h,),
                                                                      Text(StringConstants.shippingFirm, style: LotOfThemes.textText12),
                                                                      SizedBox(height: 12.h,),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(child: Text(StringConstants.oRP, style: LotOfThemes.textText12)),
                                                                          Expanded(child: Text(StringConstants.isBilling, style: LotOfThemes.textText12)),
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: 12.h,),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(child: Text(StringConstants.salesMan, style: LotOfThemes.textText12,)),
                                                                          Expanded(child: Text(StringConstants.isComplete, style: LotOfThemes.textText12)),
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: 12.h,),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(child: Text(StringConstants.billing, style: LotOfThemes.textText12)),
                                                                          Expanded(child: Text(StringConstants.isScheme, style: LotOfThemes.textText12)),
                                                                        ],
                                                                      ),
                                                                      SizedBox(height: 12.h,),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(child: Text(StringConstants.isLoose, style: LotOfThemes.textText12)),
                                                                          Expanded(child: Text(StringConstants.amt, style: LotOfThemes.textText12)),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: const Text(StringConstants.show),
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            )
                            );
                      });
                },
                child: const Row(
                  children: [
                    Icon(Icons.filter_list_rounded),
                    Text(StringConstants.filter)
                  ],
                )),
          )
        ],
      ),
      body: Padding(
        padding:   EdgeInsets.only(top: 10.0.h),
        child: ListView(
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0)
              ),
              child:  Padding(
                padding: EdgeInsets.only(left: 16.0.w, top: 12.h, right: 16.w,bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchNo, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.date, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchDate, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.orderNo, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.customer,  style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.supplier, style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.pcs, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.cases, style: LotOfThemes.textText12))
                      ],
                    )
                  ],
                ),
              ),
            ),
             SizedBox(height: 10.h ,),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              ),
              child:  Padding(
                padding: EdgeInsets.only(left: 16.0.w, top: 12.h, right: 16.w,bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchNo, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.date, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchDate, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.orderNo, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.customer,  style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.supplier, style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.pcs, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.cases, style: LotOfThemes.textText12))
                      ],
                    )
                  ],
                ),
              ),
            ),
             SizedBox(height: 10.h ,),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              ),
              child:  Padding(
                padding: EdgeInsets.only(left: 16.0.w, top: 12.h, right: 16.w,bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchNo, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.date, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchDate, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.orderNo, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.customer,  style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.supplier, style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.pcs, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.cases, style: LotOfThemes.textText12))
                      ],
                    )
                  ],
                ),
              ),
            ),
             SizedBox(height: 10.h ,),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              ),
              child:  Padding(
                padding: EdgeInsets.only(left: 16.0.w, top: 12.h, right: 16.w,bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchNo, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.date, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchDate, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.orderNo, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.customer,  style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.supplier, style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.pcs, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.cases, style: LotOfThemes.textText12))
                      ],
                    )
                  ],
                ),
              ),
            ),
             SizedBox(height: 10.h ,),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              ),
              child:  Padding(
                padding: EdgeInsets.only(left: 16.0.w, top: 12.h, right: 16.w,bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchNo, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.date, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchDate, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.orderNo, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.customer,  style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.supplier, style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.pcs, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.cases, style: LotOfThemes.textText12))
                      ],
                    )
                  ],
                ),
              ),
            ),
             SizedBox(height: 10.h ,),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              ),
              child:  Padding(
                padding: EdgeInsets.only(left: 16.0.w, top: 12.h, right: 16.w,bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchNo, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.date, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchDate, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.orderNo, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.customer,  style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.supplier, style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.pcs, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.cases, style: LotOfThemes.textText12))
                      ],
                    )
                  ],
                ),
              ),
            ),
             SizedBox(height: 10.h ,),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
              ),
              child:  Padding(
                padding: EdgeInsets.only(left: 16.0.w, top: 12.h, right: 16.w,bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchNo, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.date, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.vchDate, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.orderNo, style: LotOfThemes.textText12)),
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.customer,  style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Text(StringConstants.supplier, style: LotOfThemes.textText12),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Expanded(child: Text(StringConstants.pcs, style: LotOfThemes.textText12)),
                        Expanded(child: Text(StringConstants.cases, style: LotOfThemes.textText12))
                      ],
                    )
                  ],
                ),
              ),
            ),
             SizedBox(height: 10.h ,),
          ],
        ),
      ),
    );
  }
}

