class SendOrderPdfModel {
  bool? status;
  String? message;

  SendOrderPdfModel(this.status, this.message);

  SendOrderPdfModel.fromJson(Map<String, dynamic> json){
    status = json['Status'];
    message = json['Message'];
  }
}