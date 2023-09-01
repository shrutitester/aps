
import 'package:untitled1/constants/stringConstant.dart';
import 'package:untitled1/utils/api-helper.dart';

import '../model/ledgerModel.dart';

class LedgerController{
  Future<LedgerModel> getledger() async {
    LedgerModel model;
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: "ORDER/SHOWBOOKEDORDERS",
      callType: StringConstants.postCall,
      fieldsMap: {
            'FY_ID': '63',
            'partycode': 'DL3711',
            'startdate': '04/01/2022',
            'enddate': '08/24/2023',
            'type': '2'
          }
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
      model = LedgerModel.fromJson(returnMap['body']);
      //model must have status and message
      return model;
    }
  }

// Future<LedgerModel> ledger() async{
  //   LedgerModel? model;
  //   Map<String, dynamic> bodyMap = {
  //     'FY_ID': '63',
  //     'partycode': 'DL3711',
  //     'startdate': '04/01/2022',
  //     'enddate': '08/24/2023',
  //     'type': '2'
  //   };
  //
  //   Map<String, dynamic> returnMap = await ApiHelper.hittApi(
  //     api: StringConstants.rptPartyLedger,
  //     callType: StringConstants.postCall,
  //     fieldsMap: bodyMap
  //   );
  //   {
  //     model = LedgerModel.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }
}