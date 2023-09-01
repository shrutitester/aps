class UpdateCustomerModel {
  bool? status;
  String? message;

  UpdateCustomerModel(this.status, this.message);

  UpdateCustomerModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
  }
}
