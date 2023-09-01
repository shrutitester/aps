import 'package:flutter/material.dart';

import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import '../../model/rptSalesReport.dart';
import '../../utils/lotOfThemes.dart';

class SalesReportListItem extends StatefulWidget {
  final SaleReport order;
  const SalesReportListItem({Key? key,required this.order,}) : super(key: key);

  @override
  State<SalesReportListItem> createState() => _SalesReportListItemState();
}

class _SalesReportListItemState extends State<SalesReportListItem> {
  late final int index;

  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 10));
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return
    //   Container(
    //   color: index%2!=0?Colors.white:Colors.grey.withOpacity(0.1),
    //   padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
    //   child: Row(children: [
    //     Expanded( flex:1,child: Text(widget.order.billDate!,style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
    //     Expanded( flex:1,child: Text(widget.order.billNo!,style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
    //     Expanded( flex:2,child: Text(widget.order.salesParty!,
    //       textAlign: TextAlign.center,
    //       style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
    //     Expanded( flex:1,child: Text(widget.order.marka!,
    //       textAlign: TextAlign.center,
    //       style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
    //   ],),
    // );

      Container(
      color: Colors.white,
      child: Column(
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(width: 100, child: LotOfThemes.smallHeading1('VchNo')),
                      Expanded(child: LotOfThemes.smallTxt1(widget.order.billDate!)),
                      // SizedBox(width: 70, child: LotOfThemes.smallHeading1('Date')),
                      Expanded(child: LotOfThemes.smallTxt1(widget.order.billNo!)),
                      Expanded(child: LotOfThemes.smallTxt1(widget.order.salesParty!)),
                      Expanded(child: LotOfThemes.smallTxt1(widget.order.marka!)),
                    ],
                  ),
                  marginBottom(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     SizedBox(
                  //         width: 100,
                  //         child: LotOfThemes.smallHeading1('VchDate')),
                  //     Expanded(child: LotOfThemes.smallTxt1(widget.order.salesParty!)),
                  //     SizedBox(
                  //         width: 70,
                  //         child: LotOfThemes.smallHeading1('Order No')),
                  //     Expanded(child: LotOfThemes.smallTxt1(widget.order.marka!)),
                  //   ],
                  // ),
                  // marginBottom(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     SizedBox(
                  //         width: 100,
                  //         child: LotOfThemes.smallHeading1('Customer')),
                  //     Expanded(
                  //         child: LotOfThemes.smallTxt1(widget.order.customerName!)),
                  //   ],
                  // ),
                  // marginBottom(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     SizedBox(
                  //         width: 100,
                  //         child: LotOfThemes.smallHeading1('Supplier')),
                  //     Expanded(
                  //         child: LotOfThemes.smallTxt1(widget.order.supplierName!)),
                  //   ],
                  // ),
                  // marginBottom(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     SizedBox(
                  //         width: 100, child: LotOfThemes.smallHeading1('Pcs')),
                  //     Expanded(child: LotOfThemes.smallTxt1(widget.order.pcs!)),
                  //     SizedBox(
                  //         width: 70, child: LotOfThemes.smallHeading1('Cases')),
                  //     Expanded(child: LotOfThemes.smallTxt1(widget.order.cases!)),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Container(height: 6, color: ColorConstants.midGrey.withOpacity(0.2))
        ],
      ),
    );
  }

}
