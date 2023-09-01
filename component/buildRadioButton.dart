import 'package:flutter/material.dart';

import '../constants/stringConstant.dart';

class BuildRadioButton extends StatefulWidget {
  const BuildRadioButton({super.key});

  @override
  State<BuildRadioButton> createState() => _BuildRadioButtonState();
}

class _BuildRadioButtonState extends State<BuildRadioButton> {
  String? scheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
              children: [
                Radio(
                    value: 'all',
                    groupValue: scheme,
                    onChanged: (value) {
                      setState(() {
                        scheme = value.toString();
                      });
                    }),
                const Text(
                  StringConstants.all,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
        ),
        Expanded(
          child: Row(
              children: [
                Radio(
                    value: 'tick',
                    groupValue: scheme,
                    onChanged: (value) {
                      setState(() {
                        scheme = value.toString();
                      });
                    }),
                const Text(
                  StringConstants.tick,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),

        ),
        Expanded(
          child:
             Row(
              children: [
                Radio(
                    value: 'untick',
                    groupValue: scheme,
                    onChanged: (value) {
                      setState(() {
                        scheme = value.toString();
                      });
                    }),
                const Text(
                  StringConstants.untick,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),

        ),
      ],
    );
  }
}
