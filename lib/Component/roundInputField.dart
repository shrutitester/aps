import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/Component/textFieldContainer.dart';

import '../constants/colorConstants.dart';
import '../constants/stringConstant.dart';
import '../utils/lotOfThemes.dart';
import '../utils/upperCaseTextFormatter.dart';


class RoundedInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? isEnable;
  final bool? obscureText;
  final FocusNode? focusNode;
  final String? label;
  final IconData? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? type;
  final ValueChanged<String>? onChanged;
  String? saveValue;
  String? initialValue;
  List<TextInputFormatter>? inputFormatters;
  // final textCapitalization;
  final keyboardType;
  final textinputAction;
  final maxLength;
  final maxLines;
  final counterText;

  RoundedInputField(
      {Key? key,
      this.controller,
      this.hintText,
      this.inputFormatters,
      // this.textCapitalization,
      this.isEnable,
      this.obscureText,
      this.focusNode,
      this.label,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.suffix,
      this.onChanged,
      this.keyboardType,
      this.textinputAction,
      this.type,
      this.counterText,
      this.maxLength,
      this.maxLines,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Center(
        child: TextFormField(
          obscureText: type == StringConstants.password ? true : false,
          onChanged: onChanged,
          keyboardType: keyboardType,
          textInputAction: textinputAction,
          focusNode: focusNode,
          enabled: isEnable,
          maxLength: maxLength,
          maxLines: maxLines,
          initialValue: initialValue,
          inputFormatters: [UpperCaseTextFormatter()],
          // textCapitalization: textCapitalization,
          cursorColor: ColorConstants.lightBlack,
          style: LotOfThemes.txt14Dark,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0.w),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              suffix: suffix,
              hintStyle: LotOfThemes.txt14primary,
              counterText: counterText,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: ColorConstants.textDark,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: ColorConstants.grey,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: ColorConstants.grey,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: ColorConstants.grey,
                  width: 1.0,
                ),
              ),
              labelText: label,
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: StringConstants.gilroyFontFamily,
                  fontSize: 14.sp),
              hintText: hintText),
          validator: (input) => validate(input!),
          onSaved: (input) => saveValue = input,
          controller: controller,
        ),
      ),
    );
  }

  validate(String input) {
    if (type == StringConstants.username) {
      return input.isNotEmpty ? null : StringConstants.username;
    }
    if (type == StringConstants.password) {
      return input.isNotEmpty ? null : StringConstants.password;
    }
    if (type == StringConstants.enterQty) {
      return input.isNotEmpty ? null : StringConstants.invalid_qty;
    }
    if (type == StringConstants.packer) {
      return input.isNotEmpty ? null : StringConstants.enter_packer;
    }
    if (type == StringConstants.mobile) {
      return input.length == 10 ? null : StringConstants.invalid_mobile;
    }
  }
}
