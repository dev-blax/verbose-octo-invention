import 'package:explore_larosa_mobile/Features/Authentication/screens/business_signup.dart';
import 'package:explore_larosa_mobile/Features/Authentication/screens/login_screen.dart';
import 'package:explore_larosa_mobile/Features/Authentication/screens/signup_screen.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/Onboarding_one.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/account_type.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/onboarding_three.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/onboarding_two.dart';
import 'package:explore_larosa_mobile/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: LarosaAppTheme.lightTheme,
      darkTheme: LarosaAppTheme.darkTheme,
      home: BusinessSignupScreen(),
    );
  }
}
