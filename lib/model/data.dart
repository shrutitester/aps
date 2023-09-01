import 'package:untitled1/Model/search-model.dart';

class Data {
  bool? status;
  String? message;
  List<DataModel>? data;
  SearchModel? searchModel;

  Data({this.status, this.message, this.data, this.searchModel});

  Data.fromJson(
      {required Map<String, dynamic> json,
      String? listName,
      String? code,
      String? name,
      String? dbName}) {
    status = json['Status'];
    message = json['Message'];
    if (listName != null && json[listName] != null) {
      data = <DataModel>[];
      json[listName].forEach((v) {
        data!.add(DataModel.fromJson(v, code!, name!, db: dbName));
      });
      if (data!.isNotEmpty) {
        searchModel = SearchModel(
            codeList: data?.map((e) => e.code ?? '').toList(),
            nameList: data?.map((e) => e.name ?? '').toList());
      }
    }
  }
}

class DataModel {
  String? code;
  String? name;
  String? dbName;

  DataModel({this.code, this.name, this.dbName});

  DataModel.fromJson(Map<String, dynamic> json, String c, String n,
      {String? db}) {
    code = json[c];
    name = json[n];
    dbName = db != null ? json[db] : null;
  }
}
