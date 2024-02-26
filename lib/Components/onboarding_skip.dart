import 'package:explore_larosa_mobile/Features/Onboarding/controllers/onboarding_controller.dart';
import 'package:explore_larosa_mobile/utils/constants/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: LarosaDeviceUtility.getAppBarHeight(),
        right: 20,
        child: TextButton(
            onPressed: () {
              OnboardingController.instance.skipPage();
            },
            child: const Row(
              children: [
                Text(
                  'Skip',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Iconsax.arrow_circle_right5,
                  color: Colors.white,
                )
              ],
            )));
  }
}
