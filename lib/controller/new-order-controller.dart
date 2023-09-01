import 'package:flutter/material.dart';
import '../constants/stringConstant.dart';
import '../model/data.dart';
import '../model/new-order-view-model.dart';
import '../repository/app-repository.dart';
import 'allApiData.dart';

class NewOrderController {
  // created a common api call for all new Order api
  // listName represents the list json key, code represents code key name for name key
  // dbName is for prefix only
  // all are optional except api for calling api is required



  Future<AllApiData> initApis() async {
    AllApiData allApiData = AllApiData();
    try {
      Data finanical = await AppRepository.getApiData(
          api: StringConstants.listFinYear,
          listName: 'ListFinYear',
          code: 'ListFinYearCode',
          name: 'ListFinYearName'
      );

      Data prefix = await AppRepository.getApiData(
          api: 'master/listprefixes',
          listName: "Prefixs",
          code: "PrefixCode",
          name: "PrefixName",
          dbName: "DBName");

      Data branches = await AppRepository.getApiData(
          api: 'master/listbranches',
          listName: "Branchs",
          code: "BranchCode",
          name: "BranchName");

      Data brands = await AppRepository.getApiData(
          api: 'master/listbrands',
          listName: "Brands",
          code: "BrandCode",
          name: "BrandName");

      Map<String, dynamic> customerMap = {"groupcode": "026"};
      Data customer = await AppRepository.getApiData(
          bodyMap: customerMap,
          api: 'master/listparties',
          listName: "Parties",
          code: "PartyCode",
          name: "PartyName");

      Map<String, dynamic> supplierAcMap = {"groupcode": "00001"};
      Data supplierAc = await AppRepository.getApiData(
          bodyMap: supplierAcMap,
          api: 'master/listparties',
          listName: "Parties",
          code: "PartyCode",
          name: "PartyName");

      Map<String, dynamic> supplierMap = {"groupcode": "00008,00009"};
      Data supplier = await AppRepository.getApiData(
          bodyMap: supplierMap,
          api: 'master/listparties',
          listName: "Parties",
          code: "PartyCode",
          name: "PartyName");

      Map<String, dynamic> transportMap = {"groupcode": "00002"};
      Data transport = await AppRepository.getApiData(
          bodyMap: transportMap,
          api: 'master/listparties',
          listName: "Parties",
          code: "PartyCode",
          name: "PartyName");

      allApiData.finanicalData = finanical;
      allApiData.prefixData = prefix;
      allApiData.branchesData = branches;
      allApiData.brandData = brands;
      allApiData.customerData = customer;
      allApiData.supplierData = supplier;
      allApiData.supplierAcData = supplierAc;
      allApiData.transportData = transport;
    } catch (e) {
      debugPrint(e.toString());
    }
    return allApiData;
  }

  Future<Data> getBillingFirm(
      AllApiData allApiData, NewOrderModel model) async {
    String? dbName = allApiData.prefixData?.data
        ?.firstWhere((element) => element.code == model.prefixValue)
        .dbName;
    Map<String, dynamic> billingMap = {
      "PrefixCode": model.prefixValue,
      "DBName": dbName,
      "partycode": model.customerValue
    };
    Data billingFirm = await AppRepository.getApiData(
        bodyMap: billingMap,
        api: 'master/listparties',
        listName: "Parties",
        code: "PartyCode",
        name: "PartyName");

    return billingFirm;
  }
}
