class ListBrandsModel {
  bool? status;
  String? message;
  Brands? brands;

  ListBrandsModel(this.status, this.message, this.brands);

  ListBrandsModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    brands = json['brands'] != null ? Brands.fromJson(json['brands']) : null;
  }
}

class Brands {
  String? brandCode;
  String? brandName;

  Brands(this.brandCode, this.brandName);

  Brands.fromJson(Map<String, dynamic> json) {
    brandCode = json['BrandCode'];
    brandName = json['BrandName'];
  }
}
