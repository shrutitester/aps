class ShowCreditLimitModel {
  bool? status;
  String? message;
  double? balance;
  double? crLimit;
  double? ledgerBal;
  double? orderbal;

  ShowCreditLimitModel(this.status, this.message, this.balance, this.crLimit,
      this.ledgerBal, this.orderbal);

  ShowCreditLimitModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    balance = json['Balance'];
    crLimit = json['CrLimit'];
    ledgerBal = json['LedgerBal'];
    orderbal = json['Orderbal'];
  }
}
