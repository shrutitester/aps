class ShowSaleModel{
  bool? status;
  String? message;
  int? records;
  Bills? bills;

  ShowSaleModel(
      this.status,
      this.message,
      this.records,
      this.bills
      );

  ShowSaleModel.fromJson(Map<String, dynamic> json){
    status = json['Status'];
    message = json['Message'];
    records = json['Records'];
    bills = json['Bills'];
  }
}

class Bills{
  
}