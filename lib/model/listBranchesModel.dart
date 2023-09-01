class ListBranchesModel {
  bool? status;
  String? message;
  Branchs? branchs;

  ListBranchesModel(this.status, this.message, this.branchs);

  ListBranchesModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    branchs =
        json['branchs'] != null ? Branchs.fromJson(json['branchs']) : null;
  }
}

class Branchs {
  String? branchCode;
  String? branchName;

  Branchs(this.branchCode, this.branchName);

  Branchs.fromJson(Map<String, dynamic> json) {
    branchCode = json['BranchCode'];
    branchName = json['BranchName'];
  }
}
