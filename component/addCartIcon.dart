import 'package:flutter/material.dart';

class AddCartIcon extends StatelessWidget {
  final double? cartWidth;
  final Icon? icon;
  final Function? press;
  final Color? cartColor;
  final bool? isLoading;
  final double? height;

  const AddCartIcon({
    Key? key,
    this.icon,
    this.cartColor,
    this.cartWidth,
    this.press,
    this.isLoading = false,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: cartWidth,
      height: height,
      child: isLoading == true
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : InkWell(
        onTap: () {
          press!();
        },
        child: const Center(
          child: Icon(
            Icons.edit,
            size: 30,
            textDirection: TextDirection.ltr,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
