class SaveOrderPdfModel {
  bool? status;
  String? message;

  SaveOrderPdfModel(this.status, this.message);

  SaveOrderPdfModel.fromJson(Map<String, dynamic> json){
    status = json['Status'];
    message = json['Message'];
  }
}
