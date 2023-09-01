import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/roundButton.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import '../model/data.dart';
import '../repository/app-repository.dart';
import '../utils/lotOfThemes.dart';
import 'list-item.dart';

class SalesReport extends StatefulWidget {
  const SalesReport({super.key});

  @override
  State<SalesReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  String? scheme;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();
  List<SalesReport> report = [];
  String? _chosenValue;
  String? subparty;

  @override
  void initState() {
    // dateinput.text = '';
    // dateinput1.text = '';
    super.initState();
    getSubParty();
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
            size: 22.sp,
            color: Colors.white,
          ),
        ),
        title: Text(
          StringConstants.salesReports,
          style: TextStyle(fontSize: 22.sp, color: Colors.white),
        ),
        backgroundColor: ColorConstants.primaryColor,
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: 14.0.w),
        //     child: ElevatedButton(
        //         style: ButtonStyle(
        //             foregroundColor:
        //                 MaterialStateProperty.all<Color>(Colors.white),
        //             backgroundColor:
        //                 MaterialStateProperty.all<Color>(Colors.black),
        //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //                 RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(5),
        //                     side: const BorderSide(color: Colors.black)))),
        //         onPressed: () {
        //           showModalBottomSheet(
        //               context: context,
        //               builder: (BuildContext context) {
        //                 return SizedBox(
        //                   height: 260.h,
        //                   child: Stack(
        //                     children: [
        //                       Container(
        //                         height: 50.h,
        //                         width: MediaQuery.of(context).size.width,
        //                         color: ColorConstants.primaryColor,
        //                         child: ListTile(
        //                           trailing: IconButton(
        //                             icon: Icon(
        //                               Icons.cancel,
        //                               color: ColorConstants.mainBgColor,
        //                             ),
        //                             onPressed: () {
        //                               Navigator.pop(context);
        //                             },
        //                           ),
        //                           title: Text(
        //                             StringConstants.filter,
        //                             style: TextStyle(
        //                                 color: Colors.white, fontSize: 14.sp),
        //                           ),
        //                         ),
        //                       ),
        //                       Positioned(
        //                           top: 50.h,
        //                           left: 0,
        //                           right: 0,
        //                           bottom: 0,
        //                           child: Padding(
        //                             padding: EdgeInsets.only(
        //                                 left: 14.0.w, right: 18.w),
        //                             child: ListView(
        //                               children: [
        //                                 Row(
        //                                   children: [
        //                                     Expanded(
        //                                       child: Row(
        //                                         children: [
        //                                           Radio(
        //                                               value: 'all',
        //                                               groupValue: scheme,
        //                                               onChanged: (value) {
        //                                                 setState(() {
        //                                                   scheme = value.toString();
        //                                                 });
        //                                               }),
        //                                           const Text(
        //                                             StringConstants.all,
        //                                             maxLines: 1,
        //                                             style: TextStyle(fontSize: 14),
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     Expanded(
        //                                       child: Row(
        //                                         children: [
        //                                           Radio(
        //                                               value: 'tick',
        //                                               groupValue: scheme,
        //                                               onChanged: (value) {
        //                                                 setState(() {
        //                                                   scheme = value.toString();
        //                                                 });
        //                                               }),
        //                                           const Text(
        //                                             StringConstants.tick,
        //                                             maxLines: 1,
        //                                             style: TextStyle(fontSize: 14),
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     Expanded(
        //                                       child: Row(
        //                                         children: [
        //                                           Radio(
        //                                               value: 'untick',
        //                                               groupValue: scheme,
        //                                               onChanged: (value) {
        //                                                 setState(() {
        //                                                   scheme = value.toString();
        //                                                 });
        //                                               }),
        //                                           const Text(
        //                                             StringConstants.untick,
        //                                             maxLines: 1,
        //                                             style: TextStyle(fontSize: 14),
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                   ],
        //                                 ),
        //                                 Row(
        //                                   children: [
        //                                     Expanded(
        //                                       child: TextFormField(
        //                                         controller: dateinput,
        //                                         validator: (value) {
        //                                           if (value == null ||
        //                                               value.isEmpty) {
        //                                             return 'Please enter some text';
        //                                           }
        //                                           return null;
        //                                         },
        //                                         decoration:
        //                                             const InputDecoration(
        //                                           border: OutlineInputBorder(),
        //                                           labelText:
        //                                               StringConstants.dateFrom,
        //                                           suffixIcon: Icon(Icons
        //                                               .calendar_today_outlined),
        //                                         ),
        //                                         readOnly: true,
        //                                         onTap: () async {
        //                                           DateTime? pickedDate =
        //                                               await showDatePicker(
        //                                                   context: context,
        //                                                   initialDate:
        //                                                       DateTime.now(),
        //                                                   firstDate:
        //                                                       DateTime(2000),
        //                                                   lastDate:
        //                                                       DateTime(2101));
        //                                           if (pickedDate != null) {
        //                                             String formattedDate =
        //                                                 DateFormat('yyyy-MM-dd')
        //                                                     .format(pickedDate);
        //                                             setState(() {
        //                                               dateinput.text =
        //                                                   formattedDate;
        //                                             });
        //                                           } else {
        //                                             print(StringConstants
        //                                                 .dateIsNotSelected);
        //                                           }
        //                                         },
        //                                       ),
        //                                     ),
        //                                     SizedBox(
        //                                       width: 15.w,
        //                                     ),
        //                                     Expanded(
        //                                       child: TextFormField(
        //                                         controller: dateinput1,
        //                                         validator: (value) {
        //                                           if (value == null ||
        //                                               value.isEmpty) {
        //                                             return 'Please enter some text';
        //                                           }
        //                                           return null;
        //                                         },
        //                                         decoration:
        //                                             const InputDecoration(
        //                                           border: OutlineInputBorder(),
        //                                           labelText:
        //                                               StringConstants.dateTo,
        //                                           suffixIcon: Icon(Icons
        //                                               .calendar_today_outlined),
        //                                         ),
        //                                         readOnly: true,
        //                                         onTap: () async {
        //                                           DateTime? pickedDate =
        //                                               await showDatePicker(
        //                                                   context: context,
        //                                                   initialDate:
        //                                                       DateTime.now(),
        //                                                   firstDate:
        //                                                       DateTime(2000),
        //                                                   lastDate:
        //                                                       DateTime(2101));
        //                                           if (pickedDate != null) {
        //                                             String formattedDate =
        //                                                 DateFormat('yyyy-MM-dd')
        //                                                     .format(pickedDate);
        //                                             setState(() {
        //                                               dateinput1.text =
        //                                                   formattedDate;
        //                                             });
        //                                           } else {
        //                                             print(StringConstants
        //                                                 .dateIsNotSelected);
        //                                           }
        //                                         },
        //                                       ),
        //                                     )
        //                                   ],
        //                                 ),
        //                                 SizedBox(
        //                                   height: 23.h,
        //                                 ),
        //                                 SizedBox(
        //                                     height: 50.h,
        //                                     width: MediaQuery.of(context)
        //                                         .size
        //                                         .width,
        //                                     child: RoundedButton(
        //                                         text: StringConstants.next,
        //                                         btnColor:
        //                                             ColorConstants.primaryColor,
        //                                         btnWidth: 300,
        //                                         press: () {}))
        //                               ],
        //                             ),
        //                           ))
        //                     ],
        //                   ),
        //                 );
        //               });
        //         },
        //         child: Row(
        //           children: [
        //             Icon(Icons.filter_list_rounded),
        //             Text(
        //               StringConstants.filter,
        //               style: TextStyle(
        //                 fontSize: 14.sp,
        //               ),
        //             )
        //           ],
        //         )),
        //   )
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.w),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownSearch<String>(
                  popupProps: const PopupProps.dialog(
                      showSearchBox: true, showSelectedItems: true),
                  items: subPartyData?.searchModel?.nameList ?? [],
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: StringConstants.selectSubParty)),
                  onChanged: (val) {
                    subparty = val;
                  },
                  selectedItem: _chosenValue,
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: dateinput,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: StringConstants.dateFrom,
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
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                        setState(() {
                          dateinput.text = formattedDate;
                        });
                      } else {
                        print(StringConstants.dateIsNotSelected);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextFormField(
                    controller: dateinput1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: StringConstants.dateTo,
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
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                        setState(() {
                          dateinput1.text = formattedDate;
                        });
                      } else {
                        print(StringConstants.dateIsNotSelected);
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 50.h,
                width: MediaQuery.of(context).size.width - 50,
                child: RoundedButton(
                    text: StringConstants.next,
                    btnColor: ColorConstants.primaryColor,
                    btnWidth: 300,
                    press: () {})),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    color: ColorConstants.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                    child: Row(children: [
                      Expanded(
                          flex:1,
                          child: Text(StringConstants.date,style: LotOfThemes.textBold(Colors.white, 14),)),
                      Expanded(
                          flex:1,child: Text(StringConstants.billNo,style: LotOfThemes.textBold(Colors.white, 14),)),
                      Expanded(
                          flex:2,child: Text(StringConstants.purchaseSNo,   textAlign: TextAlign.center,style: LotOfThemes.textBold(Colors.white, 14),)),
                      Expanded(
                          flex:1,child: Text(StringConstants.supplier,
                        textAlign: TextAlign.center,
                        style: LotOfThemes.textBold(Colors.white, 14),))
                    ],),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListItem(index:index);
                      },
                    ))

              ],
            ),
          ],
        ),
      )
      // ListView(
      //   children: [
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     Container(
      //       color: ColorConstants.primaryColor,
      //       height: 40.h,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           Text(
      //             StringConstants.date,
      //             style: TextStyle(
      //                 fontSize: 14.sp, color: ColorConstants.mainBgColor),
      //           ),
      //           Text(StringConstants.billNo,
      //               style: TextStyle(
      //                   fontSize: 14.sp, color: ColorConstants.mainBgColor)),
      //           Text(StringConstants.purchaseSNo,
      //               style: TextStyle(
      //                   fontSize: 14.sp, color: ColorConstants.mainBgColor)),
      //           Text(StringConstants.supplier,
      //               style: TextStyle(
      //                   fontSize: 14.sp, color: ColorConstants.mainBgColor)),
      //         ],
      //       ),
      //     ),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI28 jai Ambey Enterprises'))
      //       ],
      //     ),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI28 jai Ambey Enterprises'))
      //       ],
      //     ),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI28 jai Ambey Enterprises'))
      //       ],
      //     ),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI28 jai Ambey Enterprises'))
      //       ],
      //     ),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     const Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI28 jai Ambey Enterprises'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI28 jai Ambey Enterprises'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '01/04/2018',
      //               style: TextStyle(color: Colors.black),
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(
      //             child: Text(
      //               '18-19/DLS 45',
      //             )),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DLP 127')),
      //         // SizedBox(
      //         //   width: 5.w,
      //         // ),
      //         Expanded(child: Text('DI288 Simran Apparels'))
      //       ],
      //     ),
      //
      //
      //
      //
      //
      //
      //
      //     // ListView.builder(
      //     //     shrinkWrap: true,
      //     //     itemCount: report.length,
      //     //     itemBuilder: (context, index) {
      //     //       return Container(
      //     //         color: (index % 2 == 0) ? Colors.grey : Colors.white,
      //     //         child: ListView(
      //     //           children: const [
      //     //             Row(
      //     //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     //               children: [
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(
      //     //                     child: Text(
      //     //                   '01/04/2018',
      //     //                   style: TextStyle(color: Colors.black),
      //     //                 )),
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(
      //     //                     child: Text(
      //     //                   '18-19/DLS 45',
      //     //                 )),
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(child: Text('DLP 127')),
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(child: Text('DI28 Jai Ambey Enterprises'))
      //     //               ],
      //     //             ),
      //     //             Row(
      //     //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     //               children: [
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(child: Text('01/04/2018')),
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(child: Text('18-19/DLS 45')),
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(child: Text('DLP 127')),
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(child: Text('DI28 Jai Ambey Enterprises'))
      //     //               ],
      //     //             ),
      //     //             Row(
      //     //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     //               children: [
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(child: Text('01/04/2018')),
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(child: Text('18-19/DLS 45')),
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(child: Text('DLP 127')),
      //     //                 // SizedBox(
      //     //                 //   width: 5.w,
      //     //                 // ),
      //     //                 Expanded(child: Text('DI28 Jai Ambey Enterprises'))
      //     //               ],
      //     //             ),
      //     //           ],
      //     //         ),
      //     //       );
      //     //     })
      //   ],
      // ),
    );
  }

  Data? subPartyData;

  void getSubParty() async {
    Map<String, dynamic> subPartyMap = {'groupcode': '00008,00009'};
    Data subParty = await AppRepository.getApiData(
        api: StringConstants.listParties,
        bodyMap: subPartyMap,
        listName: 'Parties',
        code: 'PartyCode',
        name: 'PartyName');
    setState(() => subPartyData = subParty);
  }
}
