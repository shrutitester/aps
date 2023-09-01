class AddCustomerModel {
  bool? status;
  String? message;

  AddCustomerModel(this.status, this.message);

  AddCustomerModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
  }
}
