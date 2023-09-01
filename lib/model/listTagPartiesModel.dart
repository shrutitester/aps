class ListTagPartiesModel {
  bool? status;
  String? message;
  int? records;
  Parties? parties;

  ListTagPartiesModel(this.status, this.message, this.records, this.parties);

  ListTagPartiesModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    records = json['Records'];
    parties =
        json['parties'] != null ? Parties.fromJson(json['parties']) : null;
  }
}

class Parties {
  String? partyCode;
  String? partyName;
  String? mobilePhone;

  Parties(this.partyCode, this.partyName, this.mobilePhone);

  Parties.fromJson(Map<String, dynamic> json) {
    partyCode = json['PartyCode'];
    partyName = json['PartyName'];
    mobilePhone = json['MobilePhone'];
  }
}
