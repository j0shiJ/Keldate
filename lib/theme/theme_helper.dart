import 'package:flutter/material.dart';
import 'package:keldate/utils/pref_utils.dart';
import 'package:sizer/sizer.dart';

ColorScheme get appColorScheme => ThemeHelper().colorScheme();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  var _appTheme = PrefUtils().getThemeData();

  // Correctly define the ColorScheme here
  ColorScheme _getColorScheme() {
    switch (_appTheme) {
      case 'lightCode':
        return ColorSchemes.lightCodeColorScheme;
      default:
        return ColorSchemes.lightCodeColorScheme; // Default to lightCode
    }
  }

  LightCodeColors _getThemeColors() {
    return LightCodeColors(); // Return the colors directly
  }

  ThemeData _getThemeData() {
    var colorScheme = _getColorScheme();
    return ThemeData(
      colorScheme: colorScheme,
      visualDensity: VisualDensity.standard,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: _getThemeColors().gray100,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
    );
  }

  LightCodeColors themeColor() => _getThemeColors();
  ColorScheme colorScheme() => _getColorScheme();
  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: LightCodeColors().whiteA700,
          fontSize: 16.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: LightCodeColors().gray500,
          fontSize: 14.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.secondaryContainer.withOpacity(1),
          fontSize: 11.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: LightCodeColors().whiteA700,
          fontSize: 24.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: LightCodeColors().gray500,
          fontSize: 14.sp,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: LightCodeColors().gray500,
          fontSize: 14.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        titleMedium: TextStyle(
          color: LightCodeColors().gray500,
          fontSize: 14.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: LightCodeColors().gray500,
          fontSize: 14.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      );
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0xff006ebc),
    secondaryContainer: Color(0X3F000000),
    onPrimary: Color(0xff16192c),
    onPrimaryContainer: Color(0xff3AD29f),
    onSecondaryContainer: const Color(0xff292d32),
  );
}

class LightCodeColors {
  Color get blue50 => Color(0xffE9ECFF);
  Color get blueA200 => Color(0xff4D81E7);
  Color get blueGray100 => Color(0xffD9D9D9);
  Color get blueGray700 => Color(0xff435466);
  Color get blueOrange100 => Color(0xffFFCBB3);
  Color get gray100 => Color(0xffF4F7FB);
  Color get gray300 => Color(0xffdddddd);
  Color get gray30001 => Color(0xffdbdbdb);
  Color get gray500 => Color(0xff91929f);
  Color get gray800 => Color(0xff3a3a3a);
  Color get indigoA700 => Color(0xff1D3BFF);
  Color get lightBlue900 => Color(0xff055196);
  Color get lightBlue90001 => Color(0xff004f92);
  Color get whiteA700 => Color(0xffffffff);
}
