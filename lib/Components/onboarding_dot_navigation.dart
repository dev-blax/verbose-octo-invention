import 'package:explore_larosa_mobile/Features/Onboarding/controllers/onboarding_controller.dart';
import 'package:explore_larosa_mobile/utils/constants/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    return Positioned(
        bottom: LarosaDeviceUtility.getBottomNavigationBarHeight(),
        left: 20,
        child: SmoothPageIndicator(
          effect: const ExpandingDotsEffect(
              activeDotColor: Colors.blue, dotColor: Colors.blueGrey),
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
        ));
  }
}
