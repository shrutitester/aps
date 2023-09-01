import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colorConstants.dart';
import '../constants/stringConstant.dart';

class LotOfThemes {
  static heightMargin(double height) => SizedBox(
        height: height,
      );

  static widthMargin(double width) => SizedBox(
        height: width,
      );

  static googleFont({style}) => GoogleFonts.robotoMono(
        textStyle: style,
      );

  static final googleFontHeading4 = GoogleFonts.robotoMono(
    textStyle: heading4,
  );

  static final googleFontTxt14DarkBold = GoogleFonts.robotoMono(
    textStyle: txt14DarkBold,
  );

  static TextStyle heading1 = TextStyle(
      color: Colors.black,
      fontFamily: StringConstants.gilroyFontFamily,
      fontWeight: FontWeight.w800,
      fontSize: 28.sp);

  static TextStyle heading2 = TextStyle(
      color: Colors.black,
      fontFamily: StringConstants.gilroyFontFamily,
      fontWeight: FontWeight.w800,
      fontSize: 22.sp);

  static TextStyle heading3 = TextStyle(
      color: Colors.black,
      fontFamily: StringConstants.gilroyFontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 18.sp);

  static TextStyle heading4 = TextStyle(
      color: Colors.black,
      fontFamily: StringConstants.gilroyFontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp);

  static final editHeading = TextStyle(
    color: ColorConstants.textDark,
    fontWeight: FontWeight.w600,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14.sp,
  );

  static title(color) => TextStyle(
        color: color ?? ColorConstants.grey,
        fontWeight: FontWeight.w400,
        fontFamily: StringConstants.gilroyFontFamily,
        fontSize: 25.sp,
      );

  static subtitle(color) => TextStyle(
        color: color ?? ColorConstants.grey,
        fontWeight: FontWeight.w400,
        fontFamily: StringConstants.gilroyFontFamily,
        fontSize: 12.sp,
      );

  static txt14(color) => TextStyle(
        color: color ?? ColorConstants.grey,
        fontWeight: FontWeight.w400,
        fontFamily: StringConstants.gilroyFontFamily,
        fontSize: 14.sp,
      );

  static txt16(color) => TextStyle(
        color: color ?? ColorConstants.grey,
        fontWeight: FontWeight.w700,
        fontFamily: StringConstants.gilroyFontFamily,
        fontSize: 16.sp,
      );

  static final txt14GreenBold = TextStyle(
    color: ColorConstants.green,
    fontWeight: FontWeight.w700,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 15.sp,
  );

  static TextStyle txt14DarkBold = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 15.sp,
  );

  static TextStyle txt14BlueBold = TextStyle(
    color: Color(0xFFFF4A52),
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 15.sp,
  );

  static final txt14DarkSmall = TextStyle(
    color: ColorConstants.txtColorDark,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 11.sp,
  );
  static final txt14WhiteSmall = TextStyle(
    color: ColorConstants.white,
    // fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 12.sp,
  );
  static final txt14Dark = TextStyle(
    color: ColorConstants.txtColorDark,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14.sp,
  );

  static final txt14Light = TextStyle(
    color: ColorConstants.txtColorLight,
    fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 10.sp,
  );
  static TextStyle txt14primary = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14.sp,
  );
  static final txt14Yellow = TextStyle(
    color: ColorConstants.yellowColor,
    fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14.sp,
  );

  static final editHint = TextStyle(
    color: ColorConstants.black,
    fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14.sp,
  );

  static final text16Heading = TextStyle(
    color: ColorConstants.textDark,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 16.sp,
  );

  static final text16HeadingBlue = TextStyle(
    color: ColorConstants.black,
    fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 16.sp,
  );

  static TextStyle text16HeadingRed = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w500,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14.sp,
  );

  static TextStyle textHeading14 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: StringConstants.gilroyFontFamily,
    fontSize: 14.sp,
  );
  static TextStyle textText12 = TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: StringConstants.gilroyFontFamily,
      fontSize: 12.sp);

  static final dark14 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 14));

  static final dark13 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 13));

  static final hint = GoogleFonts.rubik(
      textStyle: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorConstants.midGrey,
  ));

  static textBold(Color color, double size) => GoogleFonts.rubik(
      color: color, fontWeight: FontWeight.w500, fontSize: size);

  static final heading17 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: 17));

  static final dark15 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.blackColor,
          fontWeight: FontWeight.w400,
          fontSize: 15));
  static final darkBold15 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: 15));

  static final grey15 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.midGrey,
          fontWeight: FontWeight.w400,
          fontSize: 15));

  // static final grey12 = GoogleFonts.rubik(
  //     textStyle: TextStyle(
  //         color: ColorConstants.midGrey,
  //         fontWeight: FontWeight.w400,
  //         fontSize: 12));

  static textSize(Color color, double size) => GoogleFonts.rubik(
      color: color, fontWeight: FontWeight.w400, fontSize: size);
  // static textBold (Color color,double size) => GoogleFonts.rubik(
  //     color: color,
  //     fontWeight: FontWeight.w500,
  //     fontSize: size);

  static final primary14 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.primary,
          fontWeight: FontWeight.w400,
          fontSize: 14));

  // static txt14 (Color color) => GoogleFonts.rubik(
  //     textStyle: TextStyle(
  //         color: color,
  //         fontWeight: FontWeight.w400,
  //         fontSize: 14)
  // );

  // static final dark14 = GoogleFonts.rubik(
  //     textStyle: TextStyle(
  //         color: AppColors.blackColor,
  //         fontWeight: FontWeight.w400,
  //         fontSize: 14)
  // );
  static final light14 = GoogleFonts.rubik(
      textStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14));

  // static final hint =GoogleFonts.rubik(
  //     textStyle: TextStyle(
  //       fontSize: 15,
  //       fontWeight: FontWeight.w400,
  //       color: AppColors.midGrey,
  //     ));

  static final black10 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: 10));

  static final grey10 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.valueColor,
          fontWeight: FontWeight.w400,
          fontSize: 10));

  static smallHeading(String value) => Text(value, style: black10);
  static smallTxt(String value) => Text(value, style: grey10);

  static final black12 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: 12));

  static final grey12 = GoogleFonts.rubik(
      textStyle: TextStyle(
          color: ColorConstants.valueColor,
          fontWeight: FontWeight.w400,
          fontSize: 12));

  static smallHeading1(String value) => Text(value, style: black12);
  static smallTxt1(String value) => Text(value, style: grey12);
}
