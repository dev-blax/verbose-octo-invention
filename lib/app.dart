import 'package:explore_larosa_mobile/Components/animated_bottom_nav.dart';
import 'package:explore_larosa_mobile/Features/Authentication/screens/business_signup.dart';
import 'package:explore_larosa_mobile/Features/Authentication/screens/login_screen.dart';
import 'package:explore_larosa_mobile/Features/Authentication/screens/signup_screen.dart';
import 'package:explore_larosa_mobile/Features/Chat/chat_space.dart';
import 'package:explore_larosa_mobile/Features/Chat/convo_screen.dart';
import 'package:explore_larosa_mobile/Features/Feeds/screens/home_screen.dart';
import 'package:explore_larosa_mobile/Features/Feeds/screens/new_post_screen.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/controllers/account_type_controller.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/onboarding_one.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/account_type.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/interests.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/onboarding_screen.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/onboarding_three.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/onboarding_two.dart';
import 'package:explore_larosa_mobile/Features/Profiles/screens/business_profile.dart';
import 'package:explore_larosa_mobile/Features/Profiles/screens/verified_artist_profile.dart';
import 'package:explore_larosa_mobile/core.dart';
import 'package:explore_larosa_mobile/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  App({super.key});

  final appRoutes = [
    GetPage(
      name: '/chatspace',
      page: () => const ChatSpace(),
    ),
    GetPage(
      name: '/convo',
      page: () => const ConvoScreen(),
    ),
    GetPage(
      name: '/new_post',
      page: () => const NewPostScreen(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(
      AccountTypeController(),
    );
    return GetMaterialApp(
      getPages: appRoutes,
      defaultTransition: Transition.leftToRight,
      themeMode: ThemeMode.system,
      theme: LarosaAppTheme.lightTheme,
      darkTheme: LarosaAppTheme.darkTheme,
      home: const Core(),
    );
  }
}
