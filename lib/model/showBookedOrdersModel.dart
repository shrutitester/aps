class ShowBookedOrdersModel {
  bool? status;
  String? message;
  int? records;
  List<Orders>? orders;

  ShowBookedOrdersModel(this.status, this.message, this.records, this.orders);

  ShowBookedOrdersModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    records = json['Records'];
    orders = <Orders>[];
    if (json['Orders'] != null) {
      json['Orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }
}

class Orders {
  String? slNo;
  String? vchNo;
  String? vchDate;
  String? orderNo;
  String? prefixCode;
  String? prefixName;
  String? dBName;
  String? customerCode;
  String? customerName;
  String? subPartyCode;
  String? subPartyName;
  String? branchCode;
  String? branchName;
  String? method;
  String? givenBy;
  String? deliveryDate;
  String? transportCode;
  String? transportName;
  String? booking;
  String? marka;
  String? remark;
  String? billingFirmCode;
  String? shippingFirmCode;
  String? billingFirmName;
  String? shippingFirmName;
  String? oRP;
  String? oRPMobile;
  String? userName;
  String? isBilling;
  String? salesmanCode;
  String? salesmanName;
  String? supplierCode;
  String? supplierName;
  String? brandCode;
  String? brandName;
  String? isComplete;
  String? isItems;
  String? billing;
  String? isScheme;
  String? cases;
  String? isLoose;
  String? pcs;
  String? amount;
  String? detailRemark;
  String? packing;
  String? freight;
  String? tax;
  String? totalAmt;
  String? exportTo;
  String? items;
  String? fromDate;
  String? toDate;

  Orders(
      {this.slNo,
        this.vchNo,
        this.vchDate,
        this.orderNo,
        this.prefixCode,
        this.prefixName,
        this.dBName,
        this.customerCode,
        this.customerName,
        this.subPartyCode,
        this.subPartyName,
        this.branchCode,
        this.branchName,
        this.method,
        this.givenBy,
        this.deliveryDate,
        this.transportCode,
        this.transportName,
        this.booking,
        this.marka,
        this.remark,
        this.billingFirmCode,
        this.shippingFirmCode,
        this.billingFirmName,
        this.shippingFirmName,
        this.oRP,
        this.oRPMobile,
        this.userName,
        this.isBilling,
        this.salesmanCode,
        this.salesmanName,
        this.supplierCode,
        this.supplierName,
        this.brandCode,
        this.brandName,
        this.isComplete,
        this.isItems,
        this.billing,
        this.isScheme,
        this.cases,
        this.isLoose,
        this.pcs,
        this.amount,
        this.detailRemark,
        this.packing,
        this.freight,
        this.tax,
        this.totalAmt,
        this.exportTo,
        this.items,
        this.fromDate,
        this.toDate});

  Orders.fromJson(Map<String, dynamic> json) {
    slNo = json['SlNo']??'';
    vchNo = json['VchNo']??'';
    vchDate = json['VchDate']??'';
    orderNo = json['OrderNo']??'';
    prefixCode = json['PrefixCode']??'';
    prefixName = json['PrefixName']??'';
    dBName = json['DBName']??'';
    customerCode = json['CustomerCode']??'';
    customerName = json['CustomerName']??'';
    subPartyCode = json['SubPartyCode']??'';
    subPartyName = json['SubPartyName']??'';
    branchCode = json['BranchCode']??'';
    branchName = json['BranchName']??'';
    method = json['Method']??'';
    givenBy = json['GivenBy']??'';
    deliveryDate = json['DeliveryDate']??'';
    transportCode = json['TransportCode']??'';
    transportName = json['TransportName']??'';
    booking = json['Booking']??'';
    marka = json['Marka']??'';
    remark = json['Remark']??'';
    billingFirmCode = json['BillingFirmCode']??'';
    shippingFirmCode = json['ShippingFirmCode']??'';
    billingFirmName = json['BillingFirmName']??'';
    shippingFirmName = json['ShippingFirmName']??'';
    oRP = json['ORP']??'';
    oRPMobile = json['ORPMobile']??'';
    userName = json['UserName']??'';
    isBilling = json['IsBilling']??'';
    salesmanCode = json['SalesmanCode']??'';
    salesmanName = json['SalesmanName']??'';
    supplierCode = json['SupplierCode']??'';
    supplierName = json['SupplierName']??'';
    brandCode = json['BrandCode']??'';
    brandName = json['BrandName']??'';
    isComplete = json['IsComplete']??'';
    isItems = json['IsItems']??'';
    billing = json['Billing']??'';
    isScheme = json['IsScheme']??'';
    cases = json['Cases']??'';
    isLoose = json['IsLoose']??'';
    pcs = json['Pcs']??'';
    amount = json['Amount']??'';
    detailRemark = json['DetailRemark']??'';
    packing = json['Packing']??'';
    freight = json['Freight']??'';
    tax = json['Tax']??'';
    totalAmt = json['TotalAmt']??'';
    exportTo = json['ExportTo']??'';
    items = json['Items']??'';
    fromDate = json['FromDate']??'';
    toDate = json['ToDate']??'';
  }

}
