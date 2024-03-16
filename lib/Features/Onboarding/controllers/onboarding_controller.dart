import 'package:explore_larosa_mobile/Features/Authentication/screens/login_screen.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/account_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // update page index when scroll
  void updatePageIndicator(index) => currentPageIndex = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      //print('going to login screen because ${currentPageIndex.value}');
      Get.to(const LoginScreen());
    } else {
      //print('previous page ${currentPageIndex.value}');
      currentPageIndex.value = currentPageIndex.value + 1;
      //print('previous page ${currentPageIndex.value}');
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
