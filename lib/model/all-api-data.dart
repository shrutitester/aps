
import '../../../model/data.dart';

class AllApiData {
  Data? _prefixData;
  Data? _branchesData;
  Data? _brandData;
  Data? _customerData;
  Data? _supplierData;
  Data? _transportData;
  Data? _billingShippingFirmData;

  Data? get prefixData => _prefixData;

  set prefixData(Data? value) {
    _prefixData = value;
  }

  Data? get branchesData => _branchesData;

  set branchesData(Data? value) {
    _branchesData = value;
  }

  Data? get brandData => _brandData;

  set brandData(Data? value) {
    _brandData = value;
  }

  Data? get customerData => _customerData;

  set customerData(Data? value) {
    _customerData = value;
  }

  Data? get supplierData => _supplierData;

  set supplierData(Data? value) {
    _supplierData = value;
  }

  Data? get transportData => _transportData;

  set transportData(Data? value) {
    _transportData = value;
  }

  Data? get billingShippingFirmData => _billingShippingFirmData;

  set billingShippingFirmData(Data? value) {
    _billingShippingFirmData = value;
  }



}