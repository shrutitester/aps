class FinanicalModel{
  bool? status;
  String? message;
  FinYears? finyears;

  FinanicalModel(
      this.status,
      this.message,
      this.finyears
      );

  FinanicalModel.fromJson(Map<String, dynamic> json){
    status = json['Status'];
    message = json['Message'];
    finyears = json['finyears'] != null ? FinYears.fromJson(json['finyears']) : null;
  }
}

class FinYears{
  String? finYearCode;
  String? finYearName;
  String? fYPrefix;

  FinYears(
      this.finYearCode,
      this.finYearName,
      this.fYPrefix
      );

  FinYears.fromJson(Map<String, dynamic> json){
    finYearCode = json['FinYearCode'];
    finYearName = json['FinYearName'];
    fYPrefix = json['FYPrefix'];
  }
}