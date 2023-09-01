//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled1/model/data.dart';
// import '../constants/stringConstant.dart';
// import '../repository/app-repository.dart';
// import 'allApiData.dart';
//
// class OrderNewEntryController {
//  Future<AllApiData> initApis() async {
//    AllApiData allApiData = AllApiData();
//    try {
//      Data prefix = await AppRepository.getApiData(
//        api: StringConstants.listPrefixes,
//        // listName: 'Prefixs',
//        // code: 'PrefixCode' ,
//        // name: 'PrefixName',
//        // dbName: '' ,
//      );
//
//      Data finYear = await AppRepository.getApiData(
//        api: StringConstants.listFinYear
//      );
//
//      Data branchs = await AppRepository.getApiData(
//          api: StringConstants.listBranches
//      );
//
//      allApiData.listfinyearData = finYear;
//      // allApiData.prefixData = prefix;
//      allApiData.branchsData = branchs;
//
//    } catch (e) {
//      debugPrint(e.toString());
//    }
//    return allApiData;
//  }
// }