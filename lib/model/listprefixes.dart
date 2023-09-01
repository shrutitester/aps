// import 'package:json_annotation/json_annotation.dart';
// part 'listprefixes.g.dart';
//
// @JsonSerializable()
class ListPrefixesModel {
  bool? status;
  String? message;
  Prefixs? prefixs;

  ListPrefixesModel(this.status, this.message, this.prefixs);

  ListPrefixesModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    prefixs =
        json['prefixs'] != null ? Prefixs.fromJson(json['prefixs']) : null;
  }
  // factory ListPrefixes.fromJson(Map<String, dynamic> json) =>
  //     _$ListPrefixesFromJson(json);
  //
  // Map<String, dynamic> toJson() =>
  //     _$ListPrefixesToJson(this);
}

// @JsonSerializable()
class Prefixs {
  String? prefixCode;
  String? prefixName;
  String? dBName;

  Prefixs(this.prefixCode, this.prefixName, this.dBName);

  Prefixs.fromJson(Map<String, dynamic> json) {
    prefixCode = json['PrefixCode'];
    prefixName = json['PrefixName'];
    dBName = json['DBName'];
  }
  // factory Prefixs.fromJson(Map<String, dynamic> json) =>
  //     _$PrefixsFromJson(json);
  //
  // Map<String, dynamic> toJson() =>
  //     _$PrefixsToJson(this);
}
