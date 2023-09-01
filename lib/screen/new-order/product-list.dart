// import 'package:flutter/material.dart';
//
// import '../../constants/colorConstants.dart';
// import '../../model/new-order-view-model.dart';
// import '../../utils/lotOfThemes.dart';
//
// class ProductList extends StatelessWidget {
//   final Function onDelete;
//   final List<Product> list;
//
//   const ProductList(
//       {Key? key, required this.onDelete, required this.list})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           color: ColorConstants.secondary,
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//           child: Row(
//             children: [
//               Expanded(
//                   flex: 1,
//                   child: Text(
//                     "Design",
//                     textAlign: TextAlign.center,
//                     style: LotOfThemes.textBold(Colors.white, 14),
//                   )),
//               Expanded(
//                   flex: 1,
//                   child: Text(
//                     "Size",
//                     textAlign: TextAlign.center,
//                     style: LotOfThemes.textBold(Colors.white, 14),
//                   )),
//               Expanded(
//                   flex: 1,
//                   child: Text(
//                     "Color",
//                     textAlign: TextAlign.center,
//                     style: LotOfThemes.textBold(Colors.white, 14),
//                   )),
//               Expanded(
//                   flex: 1,
//                   child: Text(
//                     "Pcs",
//                     textAlign: TextAlign.center,
//                     style: LotOfThemes.textBold(Colors.white, 14),
//                   )),
//               Expanded(
//                   flex: 2,
//                   child: Text(
//                     "Rate",
//                     textAlign: TextAlign.start,
//                     style: LotOfThemes.textBold(Colors.white, 14),
//                   ))
//             ],
//           ),
//         ),
//         ListView.builder(
//           primary: false,
//           itemCount: list.length,
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return Container(
//               color: ColorConstants.bgGray,
//               padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
//               child: Row(
//                 children: [
//                   Expanded(
//                       flex: 1,
//                       child: Text(
//                         list[index].design ?? '',
//                         textAlign: TextAlign.center,
//                         style: LotOfThemes.textSize(ColorConstants.blackColor, 14),
//                       )),
//                   Expanded(
//                       flex: 1,
//                       child: Text(
//                         list[index].size ?? '',
//                         textAlign: TextAlign.center,
//                         style: LotOfThemes.textSize(ColorConstants.blackColor, 14),
//                       )),
//                   Expanded(
//                       flex: 1,
//                       child: Text(
//                         list[index].color ?? '',
//                         textAlign: TextAlign.center,
//                         style: LotOfThemes.textSize(ColorConstants.blackColor, 14),
//                       )),
//                   Expanded(
//                       flex: 1,
//                       child: Text(
//                         list[index].pcs ?? '',
//                         textAlign: TextAlign.center,
//                         style: LotOfThemes.textSize(ColorConstants.blackColor, 14),
//                       )),
//                   Expanded(
//                       flex: 2,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '${list[index].rate} Rs' ?? '',
//                             style: LotOfThemes.textSize(ColorConstants.blackColor, 14),
//                           ),
//                           InkWell(
//                             onTap: onDelete(index),
//                             child: const Icon(
//                               Icons.delete,
//                               color: Colors.red,
//                             ),
//                           )
//                         ],
//                       ))
//                 ],
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
