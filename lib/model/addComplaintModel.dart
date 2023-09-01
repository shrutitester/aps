class AddComplaintModel {
  bool? status;
  String? message;

  AddComplaintModel(this.status, this.message);

  AddComplaintModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
  }
}
