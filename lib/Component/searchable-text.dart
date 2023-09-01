import 'package:flutter/material.dart';
import 'package:untitled1/Component/searchable-List.dart';
import '../constants/colorConstants.dart';
import '../model/search-model.dart';
import '../utils/lotOfThemes.dart';

class SearchableText extends StatefulWidget {
  final Function onChanged;
  final String hint;
  SearchModel? model;

  SearchableText({
    Key? key,
    required this.onChanged,
    required this.hint,
    this.model,
  }) : super(key: key);

  @override
  State<SearchableText> createState() => _SearchableTextState();
}

class _SearchableTextState extends State<SearchableText> {
  String? textValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.model != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SearchableList(model: widget.model!))).then((index) => {
                if (index != null)
                  {
                    setState(() =>
                        textValue = widget.model?.nameList![index as int]),
                    widget.onChanged(widget.model?.codeList![index as int])
                  }
              });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: ColorConstants.midGrey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textValue ?? widget.hint,
              style: textValue != null ? LotOfThemes.dark14 : LotOfThemes.hint,
            ),
            Icon(Icons.search_sharp, color: ColorConstants.midGrey)
          ],
        ),
      ),
    );
  }
}
