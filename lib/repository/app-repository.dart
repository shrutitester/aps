import '../constants/stringConstant.dart';
import '../model/data.dart';
import '../utils/api-helper.dart';

class AppRepository{

 static Future<Data> getApiData(
      {Map<String, dynamic>? bodyMap,
        required String api,
        String? listName,
        String? code,
        String? name,
        String? dbName}) async {
    Data? model;

    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: api, callType: StringConstants.postCall, fieldsMap: bodyMap);

    if (returnMap.containsKey('exception')) {
      model = Data();
      model.status = false;
      model.message = returnMap['exception'];
      return model;
    } else if (returnMap.containsKey('statusCode')) {
      model = Data();
      model.status = false;
      model.message = returnMap['error'];
      return model;
    } else {
      model = Data.fromJson(
          json: returnMap['body'],
          listName: listName,
          code: code,
          name: name,
          dbName: dbName);

      //model must have status and message
      return model;
    }
  }


}