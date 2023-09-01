class LedgerModel {
  bool? status;
  String? message;
  List<PartyLedger>? partyLedger;

  LedgerModel(this.status, this.message, this.partyLedger);

  LedgerModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    partyLedger = <PartyLedger>[];
    if (json['PartyLedger'] != null) {
      json['PartyLedger'].forEach((v) {
        partyLedger?.add(PartyLedger.fromJson(v));
      });
    }
  }
}

class PartyLedger{
  String? bLDATE;
  String? accountId;
  String? partyName;
  String? accountStatus;
  String? description;
  String? openingAmt;
  String? debitAmt;
  String? creditAmt;
  String? balanceAmt;
  String? status;

  PartyLedger(
      this.bLDATE,
      this.accountId,
      this.partyName,
      this.accountStatus,
      this.description,
      this.openingAmt,
      this.debitAmt,
      this.creditAmt,
      this.balanceAmt,
      this.status
      );

  PartyLedger.fromJson(Map<String, dynamic> json){
    bLDATE = json['BLDATE'];
    accountId = json['AccountID'];
    partyName = json['PartyName'];
    accountStatus = json['AccountStatus'];
    description = json['Description'];
    openingAmt = json['OPENINGAMT'];
    debitAmt = json['DEBITAMT'];
    creditAmt = json['CREDITAMT'];
    balanceAmt = json['BalanceAmt'];
    status = json['STATUS'];
  }
}
