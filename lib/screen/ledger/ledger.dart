import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/model/ledgerModel.dart';

import '../../Component/custom-button.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import '../../controller/order-history-controller.dart';
import '../../model/data.dart';
import '../../repository/app-repository.dart';
import '../../utils/app-utils.dart';
import '../../utils/lotOfThemes.dart';
import 'ledger_list_item.dart';

class LedgerPage extends StatefulWidget {
  const LedgerPage({Key? key}) : super(key: key);

  @override
  State<LedgerPage> createState() => _LedgerPageState();
}

class _LedgerPageState extends State<LedgerPage> {
  // AllApiData allApiData = AllApiData();
  // ShowBookedOrdersModel? historyData;
  LedgerModel? ledgerModel;
  String? selectedCustomer;
  // String? selectedSupplier;
  String? _chosenValue1;
  // String? _chosenValue2;
  // bool filterOn = false;

  @override
  void initState() {
    super.initState();
    initializeState();
    getPartyList();
    getSupplierList();
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
            StringConstants.ledger,
            style: TextStyle(fontSize: 22.sp, color: Colors.white),
          ),
          // actions: [
          //   IconButton(
          //       onPressed: () => setState(() => filterOn = !filterOn),
          //       icon: Icon(
          //           filterOn ? Icons.filter_alt_off : Icons.filter_alt_rounded))
          // ],
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 16),
          child: Stack(
            children: [
              Column(
                children: [
                  // filterOn
                  //     ?
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
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
                                      items: customerData?.searchModel?.nameList ?? [],
                                      // allApiData?.customerData?.searchModel?.nameList?.toList() ?? [],
                                      // finanicalData?.searchModel?.nameList
                                      //     ?.toList() ??
                                      //     [],
                                      dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                          InputDecoration(
                                              border: InputBorder.none,
                                              hintText: StringConstants
                                                  .customer)),
                                      onChanged: (val) {
                                        selectedCustomer = val;
                                      },
                                      selectedItem: _chosenValue1,
                                    ))
                              // SearchableText(
                              //     model: allApiData.customerData != null
                              //         ? allApiData.customerData?.searchModel!
                              //         : null,
                              //     hint: "Customer",
                              //     onChanged: (value) =>
                              //         setState(
                              //                 () => selectedCustomer = value)),
                            ),
                            // const SizedBox(
                            //   width: 16,
                            // ),
                            // Expanded(
                            //     child: Container(
                            //         height: 50.h,
                            //         width: MediaQuery.of(context).size.width,
                            //         padding: EdgeInsets.symmetric(horizontal: 16.w),
                            //         decoration: BoxDecoration(
                            //             border: Border.all(
                            //                 color: Colors.grey, width: 1.w),
                            //             borderRadius: BorderRadius.circular(5)),
                            //         child: DropdownSearch<String>(
                            //           popupProps: const PopupProps.dialog(
                            //               showSearchBox: true,
                            //               showSelectedItems: true),
                            //           items: supplierData?.searchModel?.nameList ?? [],
                            //
                            //           // allApiData?.supplierData?.searchModel?.nameList?.toList() ?? [],
                            //           // finanicalData?.searchModel?.nameList
                            //           //     ?.toList() ??
                            //           //     [],
                            //           dropdownDecoratorProps:
                            //           const DropDownDecoratorProps(
                            //               dropdownSearchDecoration:
                            //               InputDecoration(
                            //                   border: InputBorder.none,
                            //                   hintText: StringConstants
                            //                       .supplier)),
                            //           onChanged: (val) {
                            //             selectedCustomer = val;
                            //           },
                            //           selectedItem: _chosenValue2,
                            //         ))
                            //   // SearchableText(
                            //   //     model: allApiData.supplierData != null
                            //   //         ? allApiData.supplierData?.searchModel!
                            //   //         : null,
                            //   //     hint: "Supplier",
                            //   //     onChanged: (value) =>
                            //   //         setState(
                            //   //                 () => selectedCustomer = value)),
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () =>
                                    _selectDate(
                                        context, null, DateTime.now()),
                                child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0.7,
                                          color: ColorConstants.midGrey,
                                        ),
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(4)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          startDate ?? "Start date",
                                          style: LotOfThemes.dark14,
                                        ),
                                        Icon(Icons.calendar_month_sharp,
                                            color: ColorConstants.primary),
                                      ],
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () =>
                                startDate != null
                                    ? _selectDate(context, startDateTime!,
                                    startDateTime!)
                                    : ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Select start date first')),
                                ),
                                child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.7,
                                        color: ColorConstants.midGrey,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(endDate ?? "End date",
                                            style: LotOfThemes.dark14),
                                        Icon(
                                          Icons.calendar_month_sharp,
                                          color: ColorConstants.primary,
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomButton(
                            onPress: () {}, buttonText: "Search"),
                      ),
                    ],
                  ),
                  // : const SizedBox.shrink(),
                  ledgerModel == null || ledgerModel!.partyLedger!.isEmpty ?
                  const SizedBox.shrink()
                      :
                  Expanded(
                    child: Column(
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
                                  flex:1,child: Text(StringConstants.account,style: LotOfThemes.textBold(Colors.white, 14),)),
                              Expanded(
                                  flex:2,child: Text(StringConstants.description,   textAlign: TextAlign.center,style: LotOfThemes.textBold(Colors.white, 14),)),
                              Expanded(
                                  flex:1,child: Text(StringConstants.debitAmt,
                                textAlign: TextAlign.center,
                                style: LotOfThemes.textBold(Colors.white, 14),))
                            ],),
                          ),
                        ),

                        ListView.builder(
                          itemCount: ledgerModel!.partyLedger!.length!,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return LedgerListItem(order:ledgerModel!.partyLedger![index]);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),

              isApiFetching ? const Align(alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ):const SizedBox.shrink()
            ],
          ),
        ));
  }

  DateTime? startDateTime;
  DateTime? endDateTime;
  String? startDate;
  String? endDate;
  bool isApiFetching = false;
  OrderHistoryController controller = OrderHistoryController();

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
    LedgerModel tempHistoryData = await controller.getLedger();
    // AllApiData tempData = (await controller.getSupplierCustomer(allApiData)) as AllApiData;
    setState(() {
      ledgerModel = tempHistoryData!;
      // allApiData = tempData!;
      isApiFetching = false;
    });
  }

  Data? customerData;
  Data? supplierData;

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

  void getSupplierList() async {
    Map<String, dynamic> customerMap = {'groupcode': '00001'};
    Data supplier = await AppRepository.getApiData(
        bodyMap: customerMap,
        api: StringConstants.listParties,
        listName: 'Parties',
        code: 'PartyCode',
        name: 'PartyName');

    setState(() => supplierData = supplier);
  }
}
