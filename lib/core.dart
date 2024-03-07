import 'package:explore_larosa_mobile/Features/Feeds/screens/home_screen.dart';
import 'package:explore_larosa_mobile/Features/Profiles/screens/business_profile.dart';
import 'package:explore_larosa_mobile/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Core extends StatefulWidget {
  const Core({super.key});

  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: [
              const NavigationDestination(
                  icon: Icon(Iconsax.home), label: 'Home'),
              const NavigationDestination(
                  icon: Icon(Iconsax.search_normal), label: 'Search'),
              const NavigationDestination(
                  icon: Icon(Iconsax.add_circle), label: 'New Post'),
              const NavigationDestination(
                  icon: Icon(Iconsax.truck), label: 'Delivery'),
              NavigationDestination(
                  icon: SvgPicture.asset(LarosaImages.accountIconPath),
                  label: 'Account'),
            ]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.purple,
    ),
    const BusinessProfile(),
  ];
}
