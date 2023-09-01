import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/screen/new-order/product-list.dart';
import '../../Component/custom-button.dart';
import '../../Component/image-uploader.dart';
import '../../Component/input-field.dart';
import '../../Component/roundInputField.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import '../../controller/allApiData.dart';
import '../../model/new-order-view-model.dart';
import '../../utils/lotOfThemes.dart';
import '../orderNewEntryScreen/checkboxes.dart';

class OrderForm extends StatefulWidget {
  final Function(NewOrderModel model) getBillingFirm;
  final AllApiData allApiData;
  final Function(Map<String, dynamic> map) onSubmit;
  final bool submitLoading;

  const OrderForm(
      {Key? key,
      required this.allApiData,
      required this.getBillingFirm,
      required this.onSubmit,
      required this.submitLoading})
      : super(key: key);

  @override
  State<OrderForm> createState() => _OrderFormState();
}

enum Place { yes, no }

class _OrderFormState extends State<OrderForm> {
  NewOrderModel model = NewOrderModel();
  String? prefix;
  String? selectFinancialYear;
  String? _chosenValue1;
  String? branch;
  String? _chosenValue2;
  String? _chosenValue3;
  String? _chosenValue4;
  String? _chosenValue5;
  String? _chosenValue6;
  String? _chosenValue7;
  String? customer;
  String? subparty;
  String? supplier;
  String? dateValue;
  String? transport;
  String? deliveryDate;
  String? brand;
  Place? _place;
  bool _homeFieldVisible = false;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();

  void handleSelection(Place? value) {
    setState(() {
      _place = value;
      _homeFieldVisible = value == Place.no;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.selectFinancialYear,
            style: LotOfThemes.textText12,
          ),
          SizedBox(
            height: 8.h,
          ),
          Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.w),
                  borderRadius: BorderRadius.circular(5)),
              child: DropdownSearch<String>(
                popupProps: const PopupProps.dialog(
                    showSearchBox: true, showSelectedItems: true),
                items: widget?.allApiData?.finanicalData?.searchModel?.nameList
                        ?.toList() ??
                    [],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: StringConstants.selectFinancialYear)),
                onChanged: (val) {
                  selectFinancialYear = val;
                },
                selectedItem: _chosenValue1,
              )),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              StringConstants.prefix,
              style: LotOfThemes.textText12,
            ),
          ),
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.w),
                  borderRadius: BorderRadius.circular(5)),
              child: DropdownSearch<String>(
                popupProps: const PopupProps.dialog(
                    showSearchBox: true, showSelectedItems: true),
                items:
                    widget?.allApiData?.prefixData?.searchModel?.nameList ?? [],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: StringConstants.selectPrefix)),
                onChanged: (val) {
                  prefix = val;
                },
                selectedItem: _chosenValue1,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 6.0),
            child: Text(
              StringConstants.branch,
              style: LotOfThemes.textText12,
            ),
          ),
          Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.w),
                  borderRadius: BorderRadius.circular(5)),
              child: DropdownSearch<String>(
                popupProps: const PopupProps.dialog(
                    showSearchBox: true, showSelectedItems: true),
                items: widget?.allApiData?.branchesData?.searchModel?.nameList
                        ?.toList() ??
                    [],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: StringConstants.selectBranch)),
                onChanged: (val) {
                  branch = val;
                },
                selectedItem: _chosenValue2,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 6.0),
            child: Text(
              StringConstants.customer,
              style: LotOfThemes.textText12,
            ),
          ),
          Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.w),
                  borderRadius: BorderRadius.circular(5)),
              child: DropdownSearch<String>(
                popupProps: const PopupProps.dialog(
                    showSearchBox: true, showSelectedItems: true),
                items: widget?.allApiData?.supplierData?.searchModel?.nameList
                        ?.toList() ??
                    [],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: StringConstants.selectCustomer)),
                onChanged: (val) {
                  customer = val;
                },
                selectedItem: _chosenValue3,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 6.0),
            child: Text(
              StringConstants.subParty,
              style: LotOfThemes.textText12,
            ),
          ),
          Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.w),
                  borderRadius: BorderRadius.circular(5)),
              child: DropdownSearch<String>(
                popupProps: const PopupProps.dialog(
                    showSearchBox: true, showSelectedItems: true),
                items:
                    widget.allApiData.supplierData?.searchModel?.nameList ?? [],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: StringConstants.selectSubParty)),
                onChanged: (val) {
                  subparty = val;
                },
                selectedItem: _chosenValue4,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 6.0),
            child: Text(
              StringConstants.supplier,
              style: LotOfThemes.textText12,
            ),
          ),
          Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.w),
                  borderRadius: BorderRadius.circular(5)),
              child: DropdownSearch<String>(
                popupProps: const PopupProps.dialog(
                  showSearchBox: true, showSelectedItems: true,
                  // dialogProps: DialogProps(
                  //   shape:
                  // )
                ),
                items: widget?.allApiData?.supplierAcData?.searchModel?.nameList
                        ?.toList() ??
                    [],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: StringConstants.selectSupplier)),
                onChanged: (val) {
                  supplier = val;
                },
                selectedItem: _chosenValue5,
              )),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 6.0),
                      child: Text(
                        StringConstants.scheme,
                      ),
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.20,
                          child: Radio<bool>(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.black),
                            value: model.selectedScheme,
                            groupValue: true,
                            onChanged: (value) {
                              setState(() {
                                model.selectedScheme = true;
                              });
                            },
                          ),
                        ),
                        Text('Yes', style: LotOfThemes.light14),
                        Transform.scale(
                          scale: 1.20,
                          child: Radio<bool>(
                            activeColor: ColorConstants.secondary,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => ColorConstants.black),
                            value: model.selectedScheme,
                            groupValue: false,
                            onChanged: (value) {
                              setState(() {
                                model.selectedScheme = false;
                              });
                            },
                          ),
                        ),
                        Text('No', style: LotOfThemes.light14),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 6.0),
                      child: Text("Loose", style: LotOfThemes.light14),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: Text('yes'),
                            value: Place.yes,
                            groupValue: _place,
                            onChanged: handleSelection,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: const Text('no'),
                            value: Place.no,
                            groupValue: _place,
                            onChanged: handleSelection,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                    value: model.isBilling,
                    // fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
                    // checkColor: ColorConstants.black,
                    // focusColor: Colors.white,
                    // activeColor: ColorConstants.white,
                    onChanged: (bool? value) {
                      setState(() {
                        model.isBilling = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Billing',
                    style: LotOfThemes.light14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 6.0),
            child: Text(
              StringConstants.selectDate,
              style: LotOfThemes.textText12,
            ),
          ),
          TextFormField(
            onChanged: (val) {
              dateValue = val;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select date';
              }
              return null;
            },
            controller: dateinput,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: StringConstants.enterDate,
              suffixIcon: Icon(Icons.calendar_today_outlined),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));
              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                setState(() {
                  dateinput.text = formattedDate;
                });
              } else {
                const Text(StringConstants.dateIsNotSelected);
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 6.0),
            child: Text(
              StringConstants.deliveryDate,
              style: LotOfThemes.textText12,
            ),
          ),
          TextFormField(
            onChanged: (val) {
              deliveryDate = val;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select date';
              }
              return null;
            },
            controller: dateinput1,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: StringConstants.deliveryDate,
              suffixIcon: Icon(Icons.calendar_today_outlined),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));
              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                setState(() {
                  dateinput1.text = formattedDate;
                });
              } else {
                const Text(StringConstants.dateIsNotSelected);
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text("Case", style: LotOfThemes.light14),
                      ),
                      RoundedInputField(
                        hintText: StringConstants.cases,
                        keyboardType: TextInputType.text,
                        type: StringConstants.userId,
                        onChanged: (val) {
                          model.caseValue = val;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text("Marka", style: LotOfThemes.light14),
                      ),
                      RoundedInputField(
                        hintText: StringConstants.marka,
                        keyboardType: TextInputType.text,
                        type: StringConstants.userId,
                        onChanged: (val) {
                          model.markaValue = val;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text("Pieces", style: LotOfThemes.light14),
                      ),
                      RoundedInputField(
                        hintText: StringConstants.pcs,
                        keyboardType: TextInputType.text,
                        type: StringConstants.userId,
                        onChanged: (val) {
                          model.piecesValue = val;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text("Amount", style: LotOfThemes.light14),
                      ),
                      RoundedInputField(
                        hintText: StringConstants.amount,
                        keyboardType: TextInputType.text,
                        type: StringConstants.userId,
                        onChanged: (val) {
                          model.amountValue = val;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          if (_homeFieldVisible)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 6.0),
                  child: Text(
                    StringConstants.selectTransport,
                    style: LotOfThemes.textText12,
                  ),
                ),
                Container(
                    height: 50.h,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.w),
                        borderRadius: BorderRadius.circular(5)),
                    child: DropdownSearch<String>(
                      popupProps: const PopupProps.dialog(
                          showSearchBox: true, showSelectedItems: true),
                      items: widget
                              ?.allApiData?.transportData?.searchModel?.nameList
                              ?.toList() ??
                          [],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: StringConstants.selectTransport)),
                      onChanged: (val) {
                        transport = val;
                      },
                      selectedItem: _chosenValue6,
                    )),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(StringConstants.bookingStation,
                      style: LotOfThemes.light14),
                ),
                RoundedInputField(
                  hintText: StringConstants.bookingStation,
                  keyboardType: TextInputType.text,
                  type: StringConstants.userId,
                  onChanged: (val) {
                    model.bookingStationValue = val;
                  },
                ),
              ],
            ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child:
                Text(StringConstants.marketerName, style: LotOfThemes.light14),
          ),
          RoundedInputField(
            hintText: StringConstants.marketerName,
            keyboardType: TextInputType.text,
            type: StringConstants.userId,
            onChanged: (val) {
              model.marketerName = val;
            },
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(StringConstants.marketerMobileNo,
                style: LotOfThemes.light14),
          ),
          RoundedInputField(
            hintText: StringConstants.marketerMobileNo,
            keyboardType: TextInputType.phone,
            type: StringConstants.mobile,
            maxLength: 10,
            counterText: '',
            onChanged: (val) {
              model.marketerMobile = val;
            },
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(StringConstants.billing, style: LotOfThemes.light14),
          ),
          RoundedInputField(
            hintText: StringConstants.billing,
            keyboardType: TextInputType.text,
            type: StringConstants.userId,
            onChanged: (val) {
              model.billingValue = val;
            },
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(StringConstants.exportTo, style: LotOfThemes.light14),
          ),
          RoundedInputField(
            hintText: StringConstants.exportTo,
            keyboardType: TextInputType.text,
            type: StringConstants.userId,
            onChanged: (val) {
              model.exportToValue = val;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 6.0),
            child: Text(
              StringConstants.brand,
              style: LotOfThemes.textText12,
            ),
          ),
          Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.w),
                  borderRadius: BorderRadius.circular(5)),
              child: DropdownSearch<String>(
                popupProps: const PopupProps.dialog(
                    showSearchBox: true, showSelectedItems: true),
                items: widget?.allApiData?.brandData?.searchModel?.nameList
                        ?.toList() ??
                    [],
                dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: StringConstants.selectBrand)),
                onChanged: (val) {
                  brand = val;
                },
                selectedItem: _chosenValue7,
              )),
          const CheckBoxes(),
          ImageUploader(
              lightTheme: false,
              label: "Supplier Order Form",
              callback: (base64Str) => {
                    model.supplierDoc = base64Str,
                  }),
          const SizedBox(height: 30),
          CustomButton(
              buttonColor: ColorConstants.primaryColor,
              onPress: () =>
                  widget.onSubmit(model.orderToJson(widget.allApiData)),
              isLoading: widget.submitLoading,
              buttonText: "Submit")
        ],
      ),
    );
  }
}
