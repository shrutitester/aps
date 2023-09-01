import 'package:flutter/material.dart';

import '../constants/colorConstants.dart';
import '../model/ledgerModel.dart';
import '../utils/lotOfThemes.dart';

class LegerListItem extends StatefulWidget {
  final PartyLedger order;
  const LegerListItem({Key? key,required this.order}) : super(key: key);

  @override
  State<LegerListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<LegerListItem> {
  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 10));
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              //setState(() => open = !open);
              // showBottomDialog(
              //     context: context,
              //     dialogContent: OrderDialog(order:widget.order));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 100, child: LotOfThemes.smallHeading1('VchNo')),
                      Expanded(child: LotOfThemes.smallTxt1(widget.order.bLDATE!)),
                      SizedBox(
                          width: 70, child: LotOfThemes.smallHeading1('Date')),
                      Expanded(child: LotOfThemes.smallTxt1(widget.order.accountId!)),
                    ],
                  ),
                  marginBottom(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 100,
                          child: LotOfThemes.smallHeading1('VchDate')),
                      Expanded(child: LotOfThemes.smallTxt1(widget.order.description!)),
                      SizedBox(
                          width: 70,
                          child: LotOfThemes.smallHeading1('Order No')),
                      Expanded(child: LotOfThemes.smallTxt1(widget.order.debitAmt!)),
                    ],
                  ),
                  marginBottom(),
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
          // open
          //     ? Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          //       child: Column(
          //           children: [
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Prefix')),
          //                 Expanded(child: LotOfThemes.smallTxt('MKKd')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Branch')),
          //                 Expanded(child: LotOfThemes.smallTxt('MKKd')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Brand')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Sub A/C')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt(
          //                         'Shri vrindavan texttiles')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Sub A/c')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Method')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Given By')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Transport')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Booking')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Marka')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Remark')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child:
          //                         LotOfThemes.smallHeading('Detail\nRemark')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child:
          //                         LotOfThemes.smallHeading('Billing firm')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child:
          //                         LotOfThemes.smallHeading('Shipping Firm')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('ORP')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('IsBilling')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('SalesMan')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('IsComplete')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Billing')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('IsScheme')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('IsLoose')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //               ],
          //             ),
          //             marginBottom(),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 SizedBox(
          //                     width: 100,
          //                     child: LotOfThemes.smallHeading('Amount')),
          //                 Expanded(
          //                     child: LotOfThemes.smallTxt('BLACK JACKET')),
          //                 Container(
          //                     padding: const EdgeInsets.symmetric(
          //                         vertical: 4, horizontal: 20),
          //                     decoration: BoxDecoration(
          //                         color: AppColors.primary,
          //                         border: Border.all(
          //                           color: AppColors.primary,
          //                         ),
          //                         borderRadius: const BorderRadius.all(
          //                             Radius.circular(3))),
          //                     child: Text(
          //                       "Pdf",
          //                       style: LotOfThemes.textSize(Colors.white, 10),
          //                     )),
          //               ],
          //             ),
          //           ],
          //         ),
          //     )
          //     : const SizedBox.shrink(),
          Container(height: 6, color: ColorConstants.midGrey.withOpacity(0.2))
        ],
      ),
    );
  }

}