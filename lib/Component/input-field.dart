import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colorConstants.dart';
import '../constants/stringConstant.dart';
import '../utils/lotOfThemes.dart';



class InputField extends StatefulWidget {
  final String? hintText;
  final IconData? icon;
  String? type;
  int maxLines;
  int? maxLength;
  final ValueChanged<String>? onChanged;
  Function? validate;
  String initialValue = '';
  bool showPasswordIcon;
  bool readOnly;
  String? counterText;

  InputField({
    Key? key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.type,
    this.validate,
    this.readOnly=false,
    this.initialValue = '',
    this.maxLines = 1,
    this.maxLength,
    this.counterText,
    this.showPasswordIcon = false,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String? saveValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        readOnly: widget.readOnly,
        textInputAction: TextInputAction.done,

        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        keyboardType: widget.type == StringConstants.NUMBER
            ? TextInputType.number
            : widget.type == StringConstants.EMAIL
                ? TextInputType.emailAddress
                : TextInputType.text,
        obscureText: widget.type == StringConstants.PASSWORD ? true : false,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        cursorColor: ColorConstants.primaryColor,
        style: LotOfThemes.dark14,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(),
           // labelText: widget.hintText,
            hintText: widget.hintText,
            suffixIcon: widget.showPasswordIcon
                ? IconButton(
                    icon: Icon(
                      widget.type == StringConstants.PASSWORD
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: ColorConstants.primaryColor,
                    ),
                    onPressed: _toggle,
                  )
                : null),
        validator: (input) => widget.validate!(input!),
        onSaved: (input) => saveValue = input,
      ),
    );
  }

  void _toggle() {
    setState(() {
      if (widget.type == StringConstants.PASSWORD) {
        widget.type = '';
      } else {
        widget.type = StringConstants.PASSWORD;
      }
    });
  }
}
