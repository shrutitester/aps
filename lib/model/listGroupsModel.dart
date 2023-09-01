class ListGroupsModel {
  bool? status;
  String? message;
  Groups? groups;

  ListGroupsModel(this.status, this.message, this.groups);

  ListGroupsModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    groups = json['groups'] != null ? Groups.fromJson(json['groups']) : null;
  }
}

class Groups {
  String? groupCode;
  String? groupName;

  Groups(this.groupCode, this.groupName);

  Groups.fromJson(Map<String, dynamic> json) {
    groupCode = json['GroupCode'];
    groupName = json['GroupName'];
  }
}
