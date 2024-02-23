import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class LarosaTextTheme {
  LarosaTextTheme._();

  // customizable light text theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: LarosaColors.dark ),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: LarosaColors.dark),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: LarosaColors.dark),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: LarosaColors.dark),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: LarosaColors.dark),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: LarosaColors.dark),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: LarosaColors.dark),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: LarosaColors.dark),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: LarosaColors.dark.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: LarosaColors.dark),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: LarosaColors.dark.withOpacity(0.5)),
  );


  // customizable dark theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: LarosaColors.light),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: LarosaColors.light),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: LarosaColors.light),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: LarosaColors.light),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: LarosaColors.light),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: LarosaColors.light),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: LarosaColors.light),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: LarosaColors.light),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: LarosaColors.light.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: LarosaColors.light),
    labelMedium: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: LarosaColors.light.withOpacity(0.5)),
  );
}