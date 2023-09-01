import 'package:flutter/material.dart';

import '../../constants/colorConstants.dart';
import '../../model/ledgerModel.dart';
import '../../utils/lotOfThemes.dart';

class LedgerListItem extends StatefulWidget {
  final PartyLedger order;
  const LedgerListItem({Key? key,required this.order}) : super(key: key);

  @override
  State<LedgerListItem> createState() => _LedgerListItemState();
}

class _LedgerListItemState extends State<LedgerListItem> {
  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 10));
  bool open = false;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: index!%2!=0?Colors.white:Colors.grey.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
      child: Column(
        children: [
          Row(children: [
            Expanded( flex:1,child: Text(widget.order.bLDATE!,style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
            Expanded( flex:1,child: Text(widget.order.accountId!,style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
            Expanded( flex:2,child: Text(widget.order.description!,
              textAlign: TextAlign.center,
              style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
            Expanded( flex:1,child: Text(widget.order.debitAmt!,
              textAlign: TextAlign.center,
              style: LotOfThemes.textBold(ColorConstants.blackColor.withOpacity(0.8), 11),)),
          ],),
          Divider()
        ],
      ),
    );
  }

}
