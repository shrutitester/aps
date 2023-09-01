import 'package:flutter/material.dart';

import '../constants/colorConstants.dart';
import '../utils/lotOfThemes.dart';


class ListItem extends StatelessWidget {
  final int index;
  const ListItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index%2!=0?Colors.white:Colors.grey.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
      child: Row(children: [
        Expanded( flex:1,child: Text("01/04/2018",style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
        Expanded( flex:1,child: Text("18-19/DLS 45",style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
        Expanded( flex:2,child: Text("DLP 127",
          textAlign: TextAlign.center,
          style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
        Expanded( flex:1,child: Text("Dl28 Jai Ambey Enterprises",
          textAlign: TextAlign.center,
          style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
      ],),
    );
  }
}
