import 'package:explore_larosa_mobile/Components/onboarding_dot_navigation.dart';
import 'package:explore_larosa_mobile/Components/onboarding_skip.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/controllers/onboarding_controller.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/onboarding_one.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/onboarding_three.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/onboarding_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingOne(),
              OnboardingTwo(),
              OnboardingThree()
            ],
          ),
          const OnboardingSkip(),
          const OnboardingDotNavigation()
        ],
      ),
    );
  }
}
