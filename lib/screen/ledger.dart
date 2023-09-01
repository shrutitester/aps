import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/controller/allApiData.dart';
import 'package:untitled1/controller/ledger_controller.dart';
import 'package:untitled1/model/ledgerModel.dart';
import 'package:untitled1/repository/app-repository.dart';
import 'package:untitled1/utils/api-helper.dart';

import '../../component/roundButton.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import '../controller/order-history-controller.dart';
import '../model/data.dart';
import '../utils/app-utils.dart';
import '../utils/lotOfThemes.dart';
import 'ledger_list_item.dart';

class Ledger extends StatefulWidget {
  const Ledger({
    super.key,
  });

  @override
  State<Ledger> createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {
  // AllApiData? allApiData;
  LedgerModel? model;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();
  String? _chosenValue;
  String? subparty;
  // String date = '';
  // String account = '';
  // String description = '';
  // String debAmt = '';

  @override
  void initState() {
    super.initState();
    initializeState();
    getSubParty();
    // dateinput.text = '';
    // dateinput1.text = '';
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
            StringConstants.ledger,
            style: TextStyle(fontSize: 22.sp, color: Colors.white),
          ),
          backgroundColor: ColorConstants.primaryColor,
          // actions: [
          //   Padding(
          //     padding:  EdgeInsets.only(right: 14.0.w),
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
          //                     height: MediaQuery.of(context).size.height / 3,
          //                     child: Stack(
          //                       children: [
          //                         Container(
          //                           height: 50.h,
          //                           width: MediaQuery.of(context).size.width,
          //                           color: ColorConstants.primaryColor,
          //                           child: ListTile(
          //                             trailing: IconButton(
          //                               icon: Icon(
          //                                 Icons.cancel,
          //                                 color: ColorConstants.mainBgColor,
          //                               ),
          //                               onPressed: () {
          //                                 Navigator.pop(context);
          //                               },
          //                             ),
          //                             title:  Text(
          //                               StringConstants.filter,
          //                               style: TextStyle(
          //                                   color: Colors.white, fontSize: 14.sp),
          //                             ),
          //                           ),
          //                         ),
          //                         Positioned(
          //                             top: 50.h,
          //                             left: 0,
          //                             right: 0,
          //                             bottom: 0,
          //                             child: Padding(
          //                               padding:  EdgeInsets.symmetric(horizontal: 18.w,),
          //                               child: ListView(
          //                                 children: [
          //                                   Row(
          //                                     children: [
          //                                       Expanded(
          //                                         child: Row(
          //                                           children: [
          //                                             Radio(
          //                                                 value: 'all',
          //                                                 groupValue: scheme,
          //                                                 onChanged: (value) {
          //                                                   setState(() {
          //                                                     scheme = value.toString();
          //                                                   });
          //                                                 }),
          //                                             const Text(
          //                                               StringConstants.all,
          //                                               maxLines: 1,
          //                                               style: TextStyle(fontSize: 14),
          //                                             ),
          //                                           ],
          //                                         ),
          //                                       ),
          //                                       Expanded(
          //                                         child: Row(
          //                                           children: [
          //                                             Radio(
          //                                                 value: 'tick',
          //                                                 groupValue: scheme,
          //                                                 onChanged: (value) {
          //                                                   setState(() {
          //                                                     scheme = value.toString();
          //                                                   });
          //                                                 }),
          //                                             const Text(
          //                                               StringConstants.tick,
          //                                               maxLines: 1,
          //                                               style: TextStyle(fontSize: 14),
          //                                             ),
          //                                           ],
          //                                         ),
          //                                       ),
          //                                       Expanded(
          //                                         child: Row(
          //                                           children: [
          //                                             Radio(
          //                                                 value: 'untick',
          //                                                 groupValue: scheme,
          //                                                 onChanged: (value) {
          //                                                   setState(() {
          //                                                     scheme = value.toString();
          //                                                   });
          //                                                 }),
          //                                             const Text(
          //                                               StringConstants.untick,
          //                                               maxLines: 1,
          //                                               style: TextStyle(fontSize: 14),
          //                                             ),
          //                                           ],
          //                                         ),
          //                                       ),
          //                                     ],
          //                                   ),
          //                                   Row(
          //                                     children: [
          //                                       Expanded(
          //                                         child: TextFormField(
          //                                           controller: dateinput,
          //                                           validator: (value) {
          //                                             if (value == null ||
          //                                                 value.isEmpty) {
          //                                               return 'Please enter some text';
          //                                             }
          //                                             return null;
          //                                           },
          //                                           decoration:
          //                                               const InputDecoration(
          //                                             border:
          //                                                 OutlineInputBorder(),
          //                                             labelText: StringConstants
          //                                                 .dateFrom,
          //                                             suffixIcon: Icon(Icons
          //                                                 .calendar_today_outlined),
          //                                           ),
          //                                           readOnly: true,
          //                                           onTap: () async {
          //                                             DateTime? pickedDate =
          //                                                 await showDatePicker(
          //                                                     context: context,
          //                                                     initialDate:
          //                                                         DateTime
          //                                                             .now(),
          //                                                     firstDate:
          //                                                         DateTime(
          //                                                             2000),
          //                                                     lastDate:
          //                                                         DateTime(
          //                                                             2101));
          //                                             if (pickedDate != null) {
          //                                               String formattedDate =
          //                                                   DateFormat(
          //                                                           'dd-MM-yyyy')
          //                                                       .format(
          //                                                           pickedDate);
          //                                               setState(() {
          //                                                 dateinput.text =
          //                                                     formattedDate;
          //                                               });
          //                                             } else {
          //                                               print(StringConstants.dateIsNotSelected);
          //                                             }
          //                                           },
          //                                         ),
          //                                       ),
          //                                       const SizedBox(
          //                                         width: 15,
          //                                       ),
          //                                       Expanded(
          //                                         child: TextFormField(
          //                                           controller: dateinput1,
          //                                           validator: (value) {
          //                                             if (value == null ||
          //                                                 value.isEmpty) {
          //                                               return 'Please enter some text';
          //                                             }
          //                                             return null;
          //                                           },
          //                                           decoration:
          //                                               const InputDecoration(
          //                                             border:
          //                                                 OutlineInputBorder(),
          //                                             labelText: StringConstants
          //                                                 .dateTo,
          //                                             suffixIcon: Icon(Icons
          //                                                 .calendar_today_outlined),
          //                                           ),
          //                                           readOnly: true,
          //                                           onTap: () async {
          //                                             DateTime? pickedDate =
          //                                                 await showDatePicker(
          //                                                     context: context,
          //                                                     initialDate:
          //                                                         DateTime
          //                                                             .now(),
          //                                                     firstDate:
          //                                                         DateTime(
          //                                                             2000),
          //                                                     lastDate:
          //                                                         DateTime(
          //                                                             2101));
          //                                             if (pickedDate != null) {
          //                                               String formattedDate =
          //                                                   DateFormat(
          //                                                           'dd-MM-yyyy')
          //                                                       .format(
          //                                                           pickedDate);
          //                                               setState(() {
          //                                                 dateinput1.text =
          //                                                     formattedDate;
          //                                               });
          //                                             } else {
          //                                               print(StringConstants.dateIsNotSelected);
          //                                             }
          //                                           },
          //                                         ),
          //                                       )
          //                                     ],
          //                                   ),
          //                                    SizedBox(
          //                                     height: 23.h,
          //                                   ),
          //                                   SizedBox(
          //                                       height: 50.h,
          //                                       width: MediaQuery.of(context)
          //                                           .size
          //                                           .width,
          //                                       child: RoundedButton(
          //                                           text: StringConstants.next,
          //                                           btnColor: ColorConstants
          //                                               .primaryColor,
          //                                           btnWidth: 300,
          //                                           press: () {
          //                                           })
          //                                       ),
          //                                   SizedBox(height: 20.h,)
          //                                 ],
          //                               ),
          //                             ))
          //                       ],
          //                     )
          //                     );
          //               });
          //         },
          //         child:  Row(
          //           children: [
          //             const Icon(Icons.filter_list_rounded),
          //             Text(StringConstants.filter,
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
            child: Column(children: [
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
                      press: () async {
                        // LedgerModel ledger = await
                      })),
              SizedBox(
                height: 20,
              ),
              model == null || model!.partyLedger!.isEmpty ?
                  SizedBox.shrink() :
              Expanded(
                  child:
                  ListView.builder(
                    shrinkWrap: true,
                      itemCount: model?.partyLedger?.length,
                      itemBuilder: (context, index){
                      return LegerListItem(order: model!.partyLedger![index]);
                      //   Container(
                      //   child: Column(
                      //     children: [
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           SizedBox(
                      //               width: 100, child: LotOfThemes.smallHeading1('VchNo')),
                      //           Expanded(child: LotOfThemes.smallTxt1(model?.partyLedger?.bLDATE?? '')),
                      //           SizedBox(
                      //               width: 70, child: LotOfThemes.smallHeading1('Date')),
                      //           Expanded(child: LotOfThemes.smallTxt1(model?.partyLedger?.accountId ?? '')),
                      //         ]
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           SizedBox(
                      //               width: 100, child: LotOfThemes.smallHeading1('VchNo')),
                      //           Expanded(child: LotOfThemes.smallTxt1(model?.partyLedger?.description?? '')),
                      //           SizedBox(
                      //               width: 70, child: LotOfThemes.smallHeading1('Date')),
                      //           Expanded(child: LotOfThemes.smallTxt1(model?.partyLedger?.debitAmt ?? '')),
                      //         ]
                      //       ),
                      //     ],
                      //   ),
                      // );
                      })
              )

            ]),

        )

        // ListView(
        //   children: [
        //     SizedBox(height: 10,),
        //     Container(
        //       color: ColorConstants.primaryColor,
        //       height: 40.h,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           Text(
        //             StringConstants.date,
        //             style: TextStyle(
        //               fontSize: 14.sp,
        //               color: ColorConstants.mainBgColor
        //             ),
        //           ),
        //           Text(
        //             StringConstants.account,
        //             style: TextStyle(
        //               fontSize: 14.sp,
        //               color: ColorConstants.mainBgColor
        //             ),
        //           ),
        //           Text(
        //             StringConstants.description,
        //             style: TextStyle(
        //               fontSize: 14.sp,
        //               color: ColorConstants.mainBgColor
        //             ),
        //           ),
        //           Text(
        //             StringConstants.debitAmt,
        //             style: TextStyle(
        //               fontSize: 14.sp,
        //               color: ColorConstants.mainBgColor
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        //               'Opening',
        //             )),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Forwarded')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 9')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
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
        //               'Opening',
        //             )),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Forwarded')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 9')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
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
        //               'Opening',
        //             )),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Forwarded')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 9')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
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
        //               'Opening',
        //             )),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Forwarded')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 9')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
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
        //               'Opening',
        //             )),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Forwarded')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 9')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
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
        //               'Opening',
        //             )),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Forwarded')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 9')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
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
        //               'Opening',
        //             )),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Forwarded')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 9')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
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
        //               'Opening',
        //             )),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Forwarded')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 9')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 3')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 5')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 1')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('01/04/2018')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('Sales Return')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('18-19/DLSR 2')),
        //         // SizedBox(
        //         //   width: 5.w,
        //         // ),
        //         Expanded(child: Text('100000Rs'))
        //       ],
        //     )
        //
        //
        //     // ListView.builder(
        //     //     shrinkWrap: true,
        //     //     itemCount: ledger.length,
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
        //     //                       '01/04/2018',
        //     //                       style: TextStyle(color: Colors.black),
        //     //                     )),
        //     //                 // SizedBox(
        //     //                 //   width: 5.w,
        //     //                 // ),
        //     //                 Expanded(
        //     //                     child: Text(
        //     //                       '18-19/DLS 45',
        //     //                     )),
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
        //
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

  DateTime? startDateTime;
  DateTime? endDateTime;
  String? startDate;
  String? endDate;
  bool isApiFetching = false;
  LedgerController controller = LedgerController();

  Future<void> _selectDate(BuildContext context, DateTime? firstDate,
      DateTime? startDt) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDateTime ?? startDt ?? DateTime.now(),
        firstDate:
        startDateTime == null ? DateTime.now() : startDt ?? DateTime.now(),
        lastDate: DateTime(2028));
    if (picked != null) {
      if (firstDate != null) {
        endDateTime = picked;
        setState(() => endDate = AppUtil.formatDate(endDateTime!));
      } else {
        startDateTime = picked;
        setState(() => startDate = AppUtil.formatDate(startDateTime!));
        endDateTime = null;
      }
    }
  }

  void initializeState() async {
    setState(() => isApiFetching = true);
    LedgerModel tempHistoryData = await controller.getledger();
    // AllApiData tempData = (await controller.getSupplierCustomer(allApiData)) as AllApiData;
    setState(() {
      model = tempHistoryData!;
      // allApiData = tempData!;
      isApiFetching = false;
    });
  }
  // getLedger(value) async {
  //
  //   Map<String, dynamic> returnMap = await ApiHelper.hittApi(
  //     api: StringConstants.rptPartyLedger,
  //     callType: StringConstants.postCall,
  //     fieldsMap: {
  //       'FY_ID': '63',
  //       'partycode': 'DL3711',
  //       'startdate': '04/01/2022',
  //       'enddate': '08/24/2023',
  //       'type': '2',
  //     }
  //   );
  //   if (returnMap.containsKey('exception')) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(returnMap['exception'])),
  //     );
  //   } else if (returnMap.containsKey('statusCode')) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(returnMap['error'])),
  //     );
  //   } else {
  //     Map<String, dynamic> json = returnMap['body'];
  //     setState(() {
  //       date = '${json['BLDATE']}';
  //       account = '${json['AccountID']}';
  //       description = '${json['Description']}';
  //       debAmt = '${json['DEBITAMT']}';
  //     });
  //   }
  // }

}
