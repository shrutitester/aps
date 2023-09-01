import 'package:flutter/material.dart';

import '../constants/colorConstants.dart';
import '../model/search-model.dart';
import '../utils/lotOfThemes.dart';

class SearchableList extends StatefulWidget {
  final SearchModel model;

  const SearchableList({Key? key, required this.model}) : super(key: key);

  @override
  State<SearchableList> createState() => _SearchableListState();
}

class _SearchableListState extends State<SearchableList> {
  List<String>? list;
  List<String> sortedList = [];
  int selectedIndex = -1;

  @override
  void initState() {
    list = widget.model.nameList!;
    sortedList.clear();
    sortedList.addAll(list!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          maxLines: 1,
          decoration: const InputDecoration.collapsed(
              border: InputBorder.none,
              hintText: 'Search ...',
              hintStyle: TextStyle(color: Colors.white)),
          cursorColor: Colors.white,
          style: const TextStyle(color: Colors.white),
          onChanged: (value) => {
            setState(() {
              sortedList.clear();
              if (value.isEmpty) {
                sortedList.addAll(list!);
              } else {
                var sorted = list?.where((element) =>
                    element.toLowerCase().contains(value.toLowerCase()));
                if (sorted != null) {
                  sortedList.addAll(sorted);
                }
              }
            })
          },
        ),
        actions: const [
          IconButton(
              onPressed: null, icon: Icon(Icons.search, color: Colors.white))
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: sortedList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () => {
                          setState(() => selectedIndex = index),
                          Navigator.pop(
                              context,
                              widget.model.nameList!.indexWhere(
                                  (element) => element == sortedList[index]))
                        },
                        child: Container(
                          height: 50,
                          color: index == selectedIndex
                              ? ColorConstants.midGrey.withOpacity(0.4)
                              : Colors.white,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16, top: 18.0),
                            child: Text(
                              sortedList[index],
                              style: LotOfThemes.dark14,
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 1, color: ColorConstants.midGrey)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
