import 'package:flutter/material.dart';

import '../../../model/data.dart';
import '../controller/allApiData.dart';

class NewOrderModel {
  String? finanicalValue;
  String? prefixValue;
  String? markaValue = "mdf";
  String? customerValue;
  String? subAccountValue;
  String? supplierValue;
  String? brandValue;
  String? transportValue;
  String? branchValue;
  String? billingFirmValue;
  String? shippingFirmValue;
  String? caseValue;
  String? methodValue;
  String? piecesValue;
  String? amountValue;
  String? bookingStationValue;
  String? givenByValue;
  String? orpValue;
  String? orpMobileValue;
  String? marketerName;
  String? marketerMobile;
  String? billingValue;
  String? selectedDate;
  String? exportToValue;
  String? remarkValue;
  String? detailedRemarkValue;
  bool selectedScheme = false;
  bool selectedLoose = false;
  bool isBilling = false;
  bool isArticleWise = false;
  String? supplierDoc;
  String design = '';
  String size = '';
  String color = '';
  String pcs = '';
  String rate = '';
  List<Product> productList = [];

  Map<String, dynamic> orderToJson(AllApiData allApiData) {
    // DataModel? finanical = allApiData.finanicalData?.data
    //     ?.firstWhere((element) => element.code == finanicalValue);

    // get prefix object from selected prefix code
    DataModel? prefix = allApiData.prefixData?.data
        ?.firstWhere((element) => element.code == prefixValue);

    // get billing name from selected billing code
    String? billingName = billingFirmValue != null
        ? allApiData.billingShippingFirmData?.data
            ?.firstWhere((element) => element.code == billingFirmValue)
            .name
        : '';
    // get shipping name from selected shipping code
    String? shippingName = shippingFirmValue != null
        ? allApiData.billingShippingFirmData?.data
            ?.firstWhere((element) => element.code == shippingFirmValue)
            .name
        : '';
    Map<String, dynamic> map = {
      'Finanical': finanicalValue ?? '',
      "BranchCode": branchValue ?? '',
      "ExportTo": exportToValue ?? '',
      "OrpMobile": orpMobileValue ?? '',
      "MarketerName": marketerName ?? '',
      "MarketerMobile": marketerMobile ?? '',
      "ReportModifier": "",
      "SalesmanCode": "00125",
      "Amount": "500",
      "Billing": billingValue ?? '',
      "BillingFirmCode": billingFirmValue ?? '',
      "BillingFirmName": billingName ?? '',
      "Booking": "",
      "BrandCode": brandValue ?? '',
      "Cases": caseValue ?? '',
      "CustomerCode": customerValue ?? '',
      "DBName": prefix?.dbName ?? '',
      "DeliveryDate": selectedDate ?? '',
      "DetailRemark": detailedRemarkValue ?? '',
      "Freight": "",
      "GivenBy": givenByValue ?? '',
      "IsBilling": isBilling ? 'Y' : 'N',
      "IsComplete": "N",
      "IsItems": productList.isEmpty ? "N" : "Y",
      "IsLoose": !selectedLoose ? "N" : "Y",
      "IsScheme": !selectedScheme ? "N" : "Y",
      "Marka": markaValue ?? '',
      "Method": methodValue ?? '',
      "ORP": orpValue ?? '',
      "Packing": "",
      "Pcs": piecesValue ?? '',
      "PrefixCode": prefixValue ?? '',
      "PrefixName": prefix?.name ?? '',
      "Remark": remarkValue ?? '',
      "SubPartyCode": "",
      "SupplierCode": supplierValue ?? '',
      "Tax": "",
      "TransportCode": transportValue ?? '',
      "UserName": "",
      "ImageBase64": supplierDoc ?? '',
      "Items": productList.isEmpty
          ? []
          : productList.map((e) => e.toJson()).toList(),

      // "PrefixCode": prefixValue ?? '',
      // "PrefixName": prefix?.name ?? '',
      // "DBName": prefix?.dbName ?? '',
      // "CustomerCode": customerValue ?? '',
      // "SubPartyCode": subAccountValue ?? '',
      // "BranchCode": branchValue ?? '',
      // "TransportCode": transportValue ?? '',
      // "Booking": bookingStationValue ?? '',
      // "Marka": markaValue ?? '',
      // "Remark": remarkValue ?? '',
      // "BillingFirmCode": billingFirmValue ?? '',
      // "ShippingFirmCode": shippingFirmValue ?? '',
      // "BillingFirmName": billingName ?? '',
      // "ShippingFirmName": shippingName ?? '',
      // "ORP": orpValue ?? '',
      // "IsBilling": isBilling ? 'Y' : 'N',
      // "UserName": orpMobileValue ?? '',
      // "SupplierCode": supplierValue ?? '',
      // "BrandCode": brandValue ?? '',
      // "GivenBy": givenByValue ?? '',
      // "BrandCode": brandValue ?? '',
      // "IsScheme": selectedScheme ? 'Y' : 'N',
      // "IsLoose": selectedLoose ? 'Y' : 'N',
      // "Pcs": piecesValue ?? '',
      // "Amount": amountValue ?? '',
      // "DetailRemark": detailedRemarkValue ?? '',
      // "ImageBase64": supplierDoc ?? '',
      // "Method": methodValue ?? '',
      // "DeliveryDate": selectedDate ?? '',
      // "Items": productList.isEmpty
      //     ? []
      //     : productList.map((e) => e.toJson()).toList(),
      //
      // //TODO ask for these fields
      // "IsComplete": 'Y',
      // "Billing": billingValue ?? '',
      // "Cases": '',
      // "Freight": '',
      // "Tax": '',
      // "Packing": '',
      // "TotalAmt": '',
      // "SalesmanCode": orpMobileValue ?? '',
    };
    return map;
  }
}

class Product {
  String? design;
  String? size;
  String? color;
  String? pcs;
  String? rate;

  Product(this.design, this.size, this.color, this.pcs, this.rate);

  toJson() => {
        "colourname": color,
        "designname": design,
        "pcs": pcs,
        "rate": rate,
        "sizename": size,
      };
}
