import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class LarosaAppTheme {
  LarosaAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: LarosaColors.grey,
    brightness: Brightness.light,
    textTheme: LarosaTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: LarosaColors.primary,
    textTheme: LarosaTextTheme.darkTextTheme,
  );
}
