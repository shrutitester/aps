class RptSaleReport{
  bool? status;
  String? message;
  List<SaleReport>? saleReport;

  RptSaleReport(
      this.status,
      this.message,
      this.saleReport
      );

  RptSaleReport.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    saleReport = <SaleReport>[];
    if (json['SaleReport'] != null) {
      json['SaleReport'].forEach((v){
        saleReport?.add(SaleReport.fromJson(v));
      });
    }
  }
}

class SaleReport{
  String? id;
  String? billNo;
  String? billCode;
  String? billDate;
  String? salesParty;
  String? totalPcs;
  String? grossAmt;
  String? finalAmt;
  String? netAmt;
  String? marka;
  String? supplierName;
  String? items;
  String? pieces;
  String? discount;
  String? discountStatus;
  String? amount;
  String? transport;
  String? station;
  String? lrNumber;
  String? lrDate;
  String? pDFFilePath;
  String? saleBillPath;

  SaleReport(
      this.id,
      this.billNo,
      this.billCode,
      this.billDate,
      this.salesParty,
      this.totalPcs,
      this.grossAmt,
      this.finalAmt,
      this.netAmt,
      this.marka,
      this.supplierName,
      this.items,
      this.pieces,
      this.discount,
      this.discountStatus,
      this.amount,
      this.transport,
      this.station,
      this.lrNumber,
      this.lrDate,
      this.pDFFilePath,
      this.saleBillPath
      );

  SaleReport.fromJson(Map<String, dynamic> json){
    id = json['ID'];
    billNo = json['BillNo'];
    billCode = json['BillCode'];
    billDate = json['BillDate'];
    salesParty = json['SalesParty'];
    totalPcs = json['TotalPcs'];
    grossAmt = json['GrossAmt'];
    finalAmt = json['FinalAmt'];
    netAmt = json['NetAmt'];
    marka = json['Marka'];
    supplierName = json['SupplierName'];
    items = json['Items'];
    pieces = json['Pieces'];
    discount = json['Discount'];
    discountStatus = json['DiscountStatus'];
    amount = json['Amount'];
    transport = json['Transport'];
    station = json['Station'];
    lrNumber = json['LrNumber'];
    lrDate = json['LrDate'];
    pDFFilePath = json['PDFFilePath'];
    saleBillPath = json['SaleBillPath'];
  }
}