import 'package:explore_larosa_mobile/Features/Onboarding/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                    colors: [Color(0xff34a4f9), Color(0xff0a1282)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.transparent),
              onPressed: () {
                OnboardingController.instance.nextPage();
              },
              child: const Row(
                children: [
                  Text(
                    'NEXT',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Iconsax.arrow_circle_right,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
