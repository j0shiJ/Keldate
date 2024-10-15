import 'package:flutter/material.dart';
import 'package:keldate/theme/theme_helper.dart';
import 'package:sizer/sizer.dart';

class AppDecoration {
  static BoxDecoration get fillGray => BoxDecoration(
        color: LightCodeColors().gray100,
      );
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: LightCodeColors().lightBlue90001,
      );
  static BoxDecoration get fillLightBlue90001 => BoxDecoration(
        color: LightCodeColors().lightBlue900,
      );
  static BoxDecoration get fillLightblue900 => BoxDecoration(
        color: LightCodeColors().lightBlue900.withOpacity(0.16),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: LightCodeColors().whiteA700,
      );

  static BoxDecoration get gradientWhiteAToGray => BoxDecoration(
        gradient: LinearGradient(
          colors: [LightCodeColors().whiteA700, LightCodeColors().gray100],
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
        ),
      );

  static BoxDecoration get outlineLightBlue => BoxDecoration(
        color: LightCodeColors().whiteA700,
      );

  static BoxDecoration get outlineLightblue900 => BoxDecoration(
        color: LightCodeColors().whiteA700,
        border: Border.all(
          color: LightCodeColors().lightBlue900,
          width: 0.5.h,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      );

  static BoxDecoration get outlineLightblue90001 => BoxDecoration(
        color: LightCodeColors().whiteA700,
        border: Border.all(
          color: LightCodeColors().lightBlue900,
          width: 0.2.h,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      );

  static BoxDecoration get outlineSecondaryContainer => BoxDecoration(
        color: LightCodeColors().lightBlue900,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(0, 4),
          ),
        ],
      );
}
