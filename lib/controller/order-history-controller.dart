import 'package:flutter/material.dart';
import 'package:untitled1/constants/stringConstant.dart';
import 'package:untitled1/model/ledgerModel.dart';

import '../model/all-api-data.dart';
import '../model/data.dart';
import '../model/rptSalesReport.dart';
import '../model/showBookedOrdersModel.dart';
import '../repository/app-repository.dart';
import '../utils/api-helper.dart';

class OrderHistoryController {
  Future<AllApiData> getSupplierCustomer(AllApiData allApiData) async {
    try {
      Map<String, dynamic> customerMap = {"groupcode": "00008,00009"};
      Data customer = await AppRepository.getApiData(
          bodyMap: customerMap,
          api: 'master/listparties',
          listName: "Parties",
          code: "PartyCode",
          name: "PartyName");

      Map<String, dynamic> supplierMap = {"groupcode": "00001"};
      Data supplier = await AppRepository.getApiData(
          bodyMap: supplierMap,
          api: 'master/listparties',
          listName: "Parties",
          code: "PartyCode",
          name: "PartyName");

      allApiData.customerData = customer;
      allApiData.supplierData = supplier;
    } catch (e) {
      debugPrint(e.toString());
    }
    return allApiData;
  }

  Future<ShowBookedOrdersModel> getOrderHistory() async {
    ShowBookedOrdersModel model;
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: "ORDER/SHOWBOOKEDORDERS",
      callType: StringConstants.postCall,
      // fieldsMap: bodyMap
    );
    // if (returnMap.containsKey('exception')) {
    //   model = ShowBookedOrdersModel();
    //   model.status = false;
    //   model.message = returnMap['exception'];
    //   return model;
    // } else if (returnMap.containsKey('statusCode')) {
    //   model = ShowBookedOrdersModel();
    //   model.status = false;
    //   model.message = returnMap['error'];
    //   return model;
    // } else
    {
      model = ShowBookedOrdersModel.fromJson(returnMap['body']);
      //model must have status and message
      return model;
    }
  }

  Future<LedgerModel> getLedger() async {
    LedgerModel model;
    Map<String, dynamic> returnMap = await ApiHelper.hittApi(
      api: 'Reports/rptPartyLedger',
      callType: StringConstants.postCall,
      fieldsMap: {
        'FY_ID': '63',
        'partycode': 'DL3711',
        'startdate': '04/01/2022',
        'enddate': '08/24/2023',
        'type': '2',
      }); // if (returnMap.containsKey('exception')) {
    //   model = ShowBookedOrdersModel();
    //   model.status = false;
    //   model.message = returnMap['exception'];
    //   return model;
    // } else if (returnMap.containsKey('statusCode')) {
    //   model = ShowBookedOrdersModel();
    //   model.status = false;
    //   model.message = returnMap['error'];
    //   return model;
    // } else
    {
      model = LedgerModel.fromJson(returnMap['body']);
      //model must have status and message
      return model;
    }
  }

  Future<RptSaleReport> getSaleReport() async {
    RptSaleReport model;
    Map<String, dynamic> returnMap = await ApiHelper.hittApi(
      api: StringConstants.rptSalesReport,
      callType: StringConstants.postCall,
      fieldsMap: {
        'FY_ID': '63',
        'partycode': 'DL121',
        'startdate': '04/01/2022',
        'enddate': '08/02/2023',
        'Tick': '2',
      }); // if (returnMap.containsKey('exception')) {
    //   model = ShowBookedOrdersModel();
    //   model.status = false;
    //   model.message = returnMap['exception'];
    //   return model;
    // } else if (returnMap.containsKey('statusCode')) {
    //   model = ShowBookedOrdersModel();
    //   model.status = false;
    //   model.message = returnMap['error'];
    //   return model;
    // } else
    {
      model = RptSaleReport.fromJson(returnMap['body']);
      //model must have status and message
      return model;
    }
  }
}