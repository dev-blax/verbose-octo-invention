import 'package:explore_larosa_mobile/Features/Feeds/screens/home_screen.dart';
import 'package:explore_larosa_mobile/Features/Feeds/screens/new_post_screen.dart';
import 'package:explore_larosa_mobile/Features/Profiles/screens/verified_artist_profile.dart';
import 'package:explore_larosa_mobile/Features/Search/screens/main_search_screen.dart';
import 'package:explore_larosa_mobile/Features/Transport/screens/main_transport_screen.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Core extends StatefulWidget {
  const Core({super.key});

  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationController>(
        builder: (controller) =>
            controller.screens[controller.selectedIndex.value],
      ),
      bottomNavigationBar: GetBuilder<NavigationController>(
        builder: (controller) =>
            LarosaBottomNavigationComponent(controller: controller),
      ),
    );
  }
}

class LarosaBottomNavigationComponent extends StatelessWidget {
  const LarosaBottomNavigationComponent({
    super.key,
    required this.controller,
  });

  final NavigationController controller;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        indicatorColor: Colors.transparent,
        backgroundColor: LarosaColors.lightContainer,
        height: 50,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) {
          index != 2
              ? controller.selectedIndex.value = index
              : Get.to(const NewPostScreen(), transition: Transition.downToUp);
        },
        destinations: [
          NavigationDestination(
            icon: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SvgPicture.asset(
                SvgIconsPaths.homeOutline,
              ),
            ),
            label: '',
            selectedIcon: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SvgPicture.asset(
                SvgIconsPaths.homeBold,
              ),
            ),
          ),
          NavigationDestination(
            icon: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SvgPicture.asset(
                SvgIconsPaths.searchOutline,
              ),
            ),
            label: '',
            selectedIcon: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SvgPicture.asset(
                SvgIconsPaths.searchBold,
                height: 20,
                width: 20,
              ),
            ),
          ),
          NavigationDestination(
            icon: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SvgPicture.asset(
                SvgIconsPaths.addOutline,
              ),
            ),
            label: '',
            selectedIcon: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SvgPicture.asset(
                SvgIconsPaths.addOutline,
              ),
            ),
          ),
          NavigationDestination(
            icon: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SvgPicture.asset(
                SvgIconsPaths.transportOutline,
              ),
            ),
            label: '',
            selectedIcon: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SvgPicture.asset(
                SvgIconsPaths.transportBold,
              ),
            ),
          ),
          NavigationDestination(
            icon: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SvgPicture.asset(
                SvgIconsPaths.userOutline,
              ),
            ),
            label: '',
            selectedIcon: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SvgPicture.asset(
                SvgIconsPaths.userBold,
              ),
            ),
          ),
        ]);
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const MainSearchScreen(),
    Container(
      color: Colors.orange,
    ),
    const MainTransportScreen(),
    //const BusinessProfile(),
    const VerifiedArtistProfile()
  ];
}
