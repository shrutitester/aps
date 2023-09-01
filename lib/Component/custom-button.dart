import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomButton extends StatelessWidget {
  Function onPress;
  String buttonText;
  bool isLoading;
  bool isDisabled;
  Color buttonColor;

  CustomButton(
      {Key? key,
        required this.onPress,
        required this.buttonText,
        this.isLoading = false,
        this.buttonColor=const Color(0xFF6376FD),
        this.isDisabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isDisabled || isLoading ? null: onPress();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: buttonColor.withOpacity(0.5), //New

              ),],
            color: isDisabled || isLoading
                ? buttonColor.withOpacity(0.4):buttonColor,
            border: Border.all(
              color: isDisabled || isLoading
                  ? buttonColor.withOpacity(0.4):buttonColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: Text(
            isLoading ? "Loading ..." : buttonText,
            style: GoogleFonts.rubik(
                textStyle: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
