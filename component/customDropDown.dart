// import 'package:flutter/material.dart';
// import '../constants/colorConstants.dart';
// import '../constants/iconConstants.dart';
// import '../utils/lotOfThemes.dart';
//
// class DropDown extends StatelessWidget {
//   final String hint;
//   final dynamic selectedValue;
//   final ValueChanged<dynamic>? onChanged;
//   final List<DropdownMenuItem> menuItem;
//
//   const DropDown(
//       {Key? key,
//         required this.hint,
//         required this.selectedValue,
//         required this.onChanged,
//         required this.menuItem})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(4),
//           border: Border.all(color: ColorConstants.grey)),
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButtonFormField(
//           isExpanded: true,
//           decoration: const InputDecoration(
//             border: InputBorder.none,
//           ),
//           hint: Text(
//             hint,
//             style: LotOfThemes.googleFontHeading4,
//             overflow: TextOverflow.ellipsis,
//           ),
//           items: menuItem,
//           value: selectedValue,
//           onChanged: onChanged,
//           icon: const Icon(IconConstants.down),
//           iconEnabledColor: ColorConstants.grey,
//           iconDisabledColor: Colors.grey,
//           focusColor: ColorConstants.grey,
//         ),
//       ),
//     );
//   }
// }
