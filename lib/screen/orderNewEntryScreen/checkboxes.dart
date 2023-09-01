import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/new-order-view-model.dart';
import 'articleBox.dart';


class MyAppState extends ChangeNotifier {
  List<String> bhkOptions = [];

  bhkOptionsAdd(String s) {
    bhkOptions.add(s);
    notifyListeners();
  }

  bhkOptionsRemove(String s) {
    bhkOptions.remove(s);
    notifyListeners();
  }
}

class CheckBoxes extends StatelessWidget {
  const CheckBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<MyAppState>(context);

    List<Widget> bhkOptions = <Widget>[
      MyCustomCheckbox(
        text: const Text('Article Wise'),
        value: appState.bhkOptions.contains('Article Wise'),
        onChanged: (bool? value) {
          if (value!) {
            //myAppState.selectedBhkOptions
            appState.bhkOptionsAdd('Article Wise');
          } else {
            appState.bhkOptionsRemove('Article Wise');
          }
        },
      ),
    ];

    return Column(
      children: bhkOptions,
    );
  }
}

class MyCustomCheckbox extends StatefulWidget {
  const MyCustomCheckbox(
      {super.key,
        required this.text,
        required this.value,
        required this.onChanged,
        this.padding = const EdgeInsets.symmetric(vertical: 8)});

  final Text text;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<MyCustomCheckbox> createState() => _MyCustomCheckboxState();
}

class _MyCustomCheckboxState extends State<MyCustomCheckbox> {
  NewOrderModel model = NewOrderModel();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Padding(
        padding: widget.padding,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                widget.text,
                Checkbox(
                  value: widget.value,
                  onChanged: (bool? newValue) {
                    widget.onChanged(newValue!);
                  },
                ),
              ],
            ),
            widget.value ? const ArticleBox() : const SizedBox()
          ],
        ),
      ),
    );
  }
}