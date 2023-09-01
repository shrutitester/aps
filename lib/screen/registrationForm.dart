import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/Model/addCustomerModel.dart';
import 'package:untitled1/controller/registrationForm_controller.dart';
// import 'package:untitled1/route/routes.dart';

import '../../component/roundButton.dart';
import '../../component/roundInputField.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstant.dart';
import '../../utils/lotOfThemes.dart';
import 'LoginPage.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  bool agree = false;
  bool _agree = false;
  String? _chosenValue1;
  FilePickerResult? result;
  File? image;
  String firmName = '';
  String ownerName = '';
  String whatsappNumber = '';
  String email = '';
  String address = '';
  String pinCode = '';
  String state = '';
  String city = '';
  String district = '';
  String transport = '';
  String booking = '';
  String booking2 = '';
  String rfdby = '';
  String crdays = '';
  String crlimit = '';

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print(StringConstants.failedToPickImage + '$e');
    }
  }

  RegistrationController controller = RegistrationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder:
                        (BuildContext context) {
                      return const LoginPage();
                    }));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 22.sp,
              )),
          title: Text(
            StringConstants.registrationForm,
            style:
                TextStyle(color: ColorConstants.mainBgColor, fontSize: 22.sp),
          ),
          backgroundColor: ColorConstants.primaryColor,
        ),
        key: _globalKey,
        backgroundColor: ColorConstants.primaryColor,
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 20.h,
                    left: 16.w,
                    right: 15.w,
                  ),
                  height: 220.h,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstants.firmName,
                              style: LotOfThemes.textText12,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RoundedInputField(
                              hintText: StringConstants.enterFirmName,
                              keyboardType: TextInputType.name,
                              type: StringConstants.username,
                              onChanged: (value){
                                firmName = value;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.ownerName,
                              style: LotOfThemes.textText12,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RoundedInputField(
                              hintText: StringConstants.enterOwnerName,
                              keyboardType: TextInputType.name,
                              type: StringConstants.username,
                              onChanged: (value){
                                ownerName = value;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.whatsappNo,
                              style: LotOfThemes.textText12,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RoundedInputField(
                              hintText: StringConstants.enterWhatsAppNumber,
                              maxLength: 10,
                              counterText: '',
                              keyboardType: TextInputType.phone,
                              type: StringConstants.mobile,
                              onChanged: (value){
                                whatsappNumber = value;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.emailAdress,
                              style: LotOfThemes.textText12,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RoundedInputField(
                              hintText: StringConstants.enterEmailAdress,
                              keyboardType: TextInputType.emailAddress,
                              type: StringConstants.username,
                              onChanged: (value){
                                email = value;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.typeOfBusiness,
                              style: LotOfThemes.textText12,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                                height: 50.h,
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownSearch<String>(
                                  // validator: (v) =>
                                  //     v == null ? 'required field' : null,
                                  popupProps: const PopupProps.dialog(
                                      showSearchBox: true,
                                      showSelectedItems: true),
                                  items: const ['ABC', 'XYZ', 'OPQ', 'STU'],
                                  dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                                border: InputBorder.none,
                                                  hintText: StringConstants
                                                      .selectBusinessType)),
                                  onChanged: (val) {
                                    print(val);
                                  },
                                  selectedItem: _chosenValue1,
                                )),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.addressOfFirm,
                              style: LotOfThemes.textText12,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RoundedInputField(
                              hintText: StringConstants
                                  .pleaseEnterCompleteAddressOfFirm,
                              keyboardType: TextInputType.text,
                              type: StringConstants.username,
                              onChanged: (value){
                                address = value;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstants.pinCode,
                                          style: LotOfThemes.textText12,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        RoundedInputField(
                                          hintText:
                                              StringConstants.enterPinCode,
                                          maxLength: 6,
                                          counterText: '',
                                          keyboardType: TextInputType.number,
                                          type: StringConstants.username,
                                          onChanged: (value){
                                            pinCode = value;
                                          },
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstants.state,
                                          style: LotOfThemes.textText12,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        RoundedInputField(
                                          hintText: StringConstants.enterState,
                                          keyboardType: TextInputType.text,
                                          type: StringConstants.username,
                                          onChanged: (value){
                                            state = value;
                                          },
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstants.city,
                                          style: LotOfThemes.textText12,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        RoundedInputField(
                                          hintText: StringConstants.enterCity,
                                          keyboardType: TextInputType.text,
                                          type: StringConstants.username,
                                          onChanged: (value){
                                            city = value;
                                          },
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          StringConstants.district,
                                          style: LotOfThemes.textText12,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        RoundedInputField(
                                          hintText:
                                              StringConstants.enterDistrict,
                                          keyboardType: TextInputType.text,
                                          type: StringConstants.username,
                                          onChanged: (value){
                                            district = value;
                                          },
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.transportName,
                              style: LotOfThemes.textText12,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RoundedInputField(
                              hintText: StringConstants.enter_transport,
                              keyboardType: TextInputType.text,
                              type: StringConstants.username,
                              onChanged: (value){
                                transport = value;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.bookingStation,
                              style: LotOfThemes.textText12,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RoundedInputField(
                              hintText: StringConstants.enterBookingStation,
                              keyboardType: TextInputType.text,
                              type: StringConstants.username,
                              onChanged: (value){
                                booking = value;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.bookingStationExportTo,
                              style: LotOfThemes.textText12,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RoundedInputField(
                              hintText:
                                  StringConstants.enterBookingStationExportTo,
                              keyboardType: TextInputType.text,
                              type: StringConstants.username,
                              onChanged: (value){
                                booking2 = value;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.referenceByName,
                              style: LotOfThemes.textText12,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            RoundedInputField(
                              hintText: StringConstants.enterReferenceName,
                              keyboardType: TextInputType.text,
                              type: StringConstants.username,
                              onChanged: (value){
                                rfdby = value;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.creditLimit,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                                height: 50.h,
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.only(left: 16.w, right: 16.w),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1.w),
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownSearch<String>(
                                  popupProps: const PopupProps.dialog(
                                      showSearchBox: true,
                                      showSelectedItems: true),
                                  items: const ['ABC', 'XYZ', 'OPQ', 'STU'],
                                  dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                                border: InputBorder.none,
                                                  hintText: StringConstants
                                                      .selectCreditLimit)),
                                  onChanged: (value) {
                                    crlimit = value!;
                                  },
                                  selectedItem: _chosenValue1,
                                )),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.creditDays,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                                height: 50.h,
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.only(left: 16.w, right: 16.w),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1.w),
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownSearch<String>(
                                  popupProps: const PopupProps.dialog(
                                      showSearchBox: true,
                                      showSelectedItems: true),
                                  items: const ['ABC', 'XYZ', 'OPQ', 'STU'],
                                  dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration(
                                                border: InputBorder.none,
                                                  hintText: StringConstants
                                                      .selectCreditDays)
                                                  ),
                                  onChanged: (val) {
                                    crdays = val!;
                                    },
                                  selectedItem: _chosenValue1,
                                )),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              StringConstants.pleaseUploadAadharCardOfOwner,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            image != null
                                ? Container(
                                    height:
                                        MediaQuery.of(context).size.height / 5,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Image.file(image!),
                                  )
                                : SizedBox.shrink(),
                            SizedBox(
                              height: 8.h,
                            ),
                            SizedBox(
                              height: 80.h,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFE4E4E4)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFE4E4E4)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: const BorderSide(
                                                color: Color(0xFE4E4E4))))),
                                onPressed: () {
                                  pickImage();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.upload_file_rounded,
                                      color: Color(0xFF2C2C2C),
                                    ),
                                    Text(
                                      StringConstants.uploadDocument,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Color(0xFF2C2C2C)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Material(
                                  child: Checkbox(
                                    value: agree,
                                    onChanged: (value) {
                                      setState(() {
                                        agree = value ?? false;
                                      });
                                    },
                                  ),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(StringConstants.itsNotOurLiability),
                                    Text(StringConstants.transportDelays),
                                    Text(StringConstants.anyShortage)
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Material(
                                  child: Checkbox(
                                    value: _agree,
                                    onChanged: (value) {
                                      setState(() {
                                        _agree = value ?? false;
                                      });
                                    },
                                  ),
                                ),
                                const Text(
                                  StringConstants.termConditions,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                                const Text(StringConstants.pleaseReadCarefully)
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            SizedBox(
                                height: 50.h,
                                width: MediaQuery.of(context).size.width,
                                child: RoundedButton(
                                    text: StringConstants.submitTxt,
                                    btnColor: ColorConstants.primaryColor,
                                    btnWidth: 300,
                                    press: () async {
                                      if (_formKey.currentState?.validate() ==
                                          true) {
                                        if (agree == true && _agree == true) {
                                          AddCustomerModel addCustomerModel = await controller.registrationForm(
                                            firmName, ownerName, whatsappNumber, email, address, pinCode, state, city,
                                            district, transport, booking, booking2, rfdby, crdays, crlimit
                                          );
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('${addCustomerModel.message}'))
                                          );
                                          Navigator.push(context,
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                            return  LoginPage(
                                                // addCustomerModel : addCustomerModel,
                                            );
                                          }));
                                        } else {
                                          alertDialog(context);
                                        }
                                      } else {
                                        showAlertDialog(context);
                                      }
                                    })),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: const Text(StringConstants.alert),
    content: const Text(StringConstants.invalid_allfields),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: const Text(StringConstants.ok)),
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

alertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: const Text((StringConstants.alert)),
    content: const Text(StringConstants.pleaseCheckTermConditions),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(StringConstants.ok))
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
