import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/colorConstants.dart';
import '../../model/showBookedOrdersModel.dart';
import '../../utils/lotOfThemes.dart';


class OrderDialog extends StatelessWidget {
  final Orders order;

  const OrderDialog({Key? key, required this.order}) : super(key: key);

  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 10));

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: ColorConstants.primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          )),
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ColorConstants.primaryColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      // onTap: ()=>_launchUrl(order.slNo!),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 16),
                          decoration: BoxDecoration(
                              color: ColorConstants.black,
                              border: Border.all(
                                color: ColorConstants.black,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6))),
                          child: Row(
                            children: [
                              const Icon(Icons.download_rounded,
                                  size: 16, color: Colors.white),
                              Text(
                                " Download Pdf",
                                style: LotOfThemes.textBold(Colors.white, 12),
                              ),
                            ],
                          )),
                    ),
                    InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.cancel, color: Colors.white))
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('VchNo')),
                        Expanded(child: LotOfThemes.smallTxt(order.vchNo!)),
                        SizedBox(
                            width: 70, child: LotOfThemes.smallHeading('Date')),
                        Expanded(
                            child: LotOfThemes.smallTxt(order.deliveryDate!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('VchDate')),
                        Expanded(child: LotOfThemes.smallTxt(order.vchDate!)),
                        SizedBox(
                            width: 70,
                            child: LotOfThemes.smallHeading('Order No')),
                        Expanded(child: LotOfThemes.smallTxt('1185A-2727')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Customer')),
                        Expanded(
                            child: LotOfThemes.smallTxt(order.customerName!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Supplier')),
                        Expanded(
                            child: LotOfThemes.smallTxt(order.supplierName!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100, child: LotOfThemes.smallHeading('Pcs')),
                        Expanded(child: LotOfThemes.smallTxt(order.pcs!)),
                        SizedBox(
                            width: 70,
                            child: LotOfThemes.smallHeading('Cases')),
                        Expanded(child: LotOfThemes.smallTxt(order.cases!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Prefix')),
                        Expanded(
                            child: LotOfThemes.smallTxt(order.prefixName!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Branch')),
                        Expanded(child: LotOfThemes.smallTxt(order.brandName!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Brand')),
                        Expanded(child: LotOfThemes.smallTxt(order.brandName!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Sub A/C')),
                        Expanded(
                            child: LotOfThemes.smallTxt(order.subPartyName!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Method')),
                        Expanded(child: LotOfThemes.smallTxt(order.method!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Given By')),
                        Expanded(child: LotOfThemes.smallTxt(order.givenBy!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Transport')),
                        Expanded(
                            child: LotOfThemes.smallTxt(order.transportName!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Booking')),
                        Expanded(child: LotOfThemes.smallTxt(order.booking!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Marka')),
                        Expanded(child: LotOfThemes.smallTxt(order.marka!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Remark')),
                        Expanded(child: LotOfThemes.smallTxt(order.remark!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Detail\nRemark')),
                        Expanded(
                            child: LotOfThemes.smallTxt(order.detailRemark!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Billing firm')),
                        Expanded(
                            child:
                                LotOfThemes.smallTxt(order.billingFirmName!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Shipping Firm')),
                        Expanded(
                            child:
                                LotOfThemes.smallTxt(order.shippingFirmName!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100, child: LotOfThemes.smallHeading('ORP')),
                        Expanded(child: LotOfThemes.smallTxt(order.oRP!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('IsBilling')),
                        Expanded(child: LotOfThemes.smallTxt(order.isBilling!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('SalesMan')),
                        Expanded(
                            child: LotOfThemes.smallTxt(order.salesmanName!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('IsComplete')),
                        Expanded(
                            child: LotOfThemes.smallTxt(order.isComplete!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('IsScheme')),
                        Expanded(child: LotOfThemes.smallTxt(order.isScheme!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('IsLoose')),
                        Expanded(child: LotOfThemes.smallTxt(order.isLoose!)),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading('Amount')),
                        Expanded(child: LotOfThemes.smallTxt(order.amount!)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _launchUrl(String slNo) async {
  //   final uri = Uri.parse('http://103.91.90.252/sp/pdf/order-$slNo.pdf');
  //   debugPrint(uri.toString());
  //   launchUrl(uri,mode: LaunchMode.externalApplication,
  //   );
  // }
}
