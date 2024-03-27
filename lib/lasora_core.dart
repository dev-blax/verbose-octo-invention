import 'package:explore_larosa_mobile/Features/Feeds/screens/home_screen.dart';
import 'package:explore_larosa_mobile/Features/Feeds/screens/new_post_screen.dart';
import 'package:explore_larosa_mobile/Features/Feeds/screens/new_string_screen.dart';
import 'package:explore_larosa_mobile/Features/Profiles/screens/verified_artist_profile.dart';
import 'package:explore_larosa_mobile/Features/Search/screens/main_search_screen.dart';
import 'package:explore_larosa_mobile/Features/Transport/screens/main_transport_screen.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LarosaCore extends StatefulWidget {
  const LarosaCore({super.key});

  @override
  State<LarosaCore> createState() => _LarosaCoreState();
}

class _LarosaCoreState extends State<LarosaCore> {
  final controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => controller.screens[controller.selectedIndex.value],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Obx(
              () => NavigationBar(
                backgroundColor: LarosaColors.grey.withOpacity(.2),
                indicatorColor: Colors.transparent,
                height: 80,
                elevation: 0,
                selectedIndex: controller.selectedIndex.value,
                onDestinationSelected: (index) => index != 2
                    ? controller.selectedIndex.value = index
                    : Get.to(
                        const NewStringScreen(),
                        transition: Transition.topLevel,
                      ),
                destinations: [
                  NavigationDestination(
                    selectedIcon: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        SvgIconsPaths.homeBold,
                        height: 23,
                        width: 23,
                      ),
                    ),
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        SvgIconsPaths.homeOutline,
                        height: 23,
                        width: 23,
                      ),
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        SvgIconsPaths.searchBold,
                        height: 23,
                        width: 23,
                      ),
                    ),
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        SvgIconsPaths.searchOutline,
                        height: 23,
                        width: 23,
                      ),
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        SvgIconsPaths.addBold,
                        height: 23,
                        width: 23,
                      ),
                    ),
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        SvgIconsPaths.addOutline,
                        height: 23,
                        width: 23,
                      ),
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        SvgIconsPaths.transportBold,
                        height: 23,
                        width: 23,
                      ),
                    ),
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        SvgIconsPaths.transportOutline,
                        height: 23,
                        width: 23,
                      ),
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    selectedIcon: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        SvgIconsPaths.userBold,
                        height: 23,
                        width: 23,
                      ),
                    ),
                    icon: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        SvgIconsPaths.userOutline,
                        height: 23,
                        width: 23,
                      ),
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          )
        ],
      ),

      // bottomNavigationBar: Obx(
      //   () => NavigationBar(
      //     backgroundColor: LarosaColors.darkerGrey.withOpacity(.1),
      //     indicatorColor: Colors.transparent,
      //     height: 80,
      //     elevation: 0,
      //     selectedIndex: controller.selectedIndex.value,
      //     onDestinationSelected: (index) => index != 2
      //         ? controller.selectedIndex.value = index
      //         : Get.to(
      //             const NewStringScreen(),
      //             transition: Transition.topLevel,
      //           ),
      //     destinations: [
      //       NavigationDestination(
      //         selectedIcon: Container(
      //           margin: const EdgeInsets.only(top: 20),
      //           child: SvgPicture.asset(
      //             SvgIconsPaths.homeBold,
      //             height: 23,
      //             width: 23,
      //           ),
      //         ),
      //         icon: Container(
      //           margin: const EdgeInsets.only(top: 20),
      //           child: SvgPicture.asset(
      //             SvgIconsPaths.homeOutline,
      //             height: 23,
      //             width: 23,
      //           ),
      //         ),
      //         label: '',
      //       ),
      //       NavigationDestination(
      //         selectedIcon: Container(
      //           margin: const EdgeInsets.only(top: 20),
      //           child: SvgPicture.asset(
      //             SvgIconsPaths.searchBold,
      //             height: 23,
      //             width: 23,
      //           ),
      //         ),
      //         icon: Container(
      //           margin: const EdgeInsets.only(top: 20),
      //           child: SvgPicture.asset(
      //             SvgIconsPaths.searchOutline,
      //             height: 23,
      //             width: 23,
      //           ),
      //         ),
      //         label: '',
      //       ),
      //       NavigationDestination(
      //         selectedIcon: Container(
      //           margin: const EdgeInsets.only(top: 20),
      //           child: SvgPicture.asset(
      //             SvgIconsPaths.addBold,
      //             height: 23,
      //             width: 23,
      //           ),
      //         ),
      //         icon: Container(
      //           margin: const EdgeInsets.only(top: 20),
      //           child: SvgPicture.asset(
      //             SvgIconsPaths.addOutline,
      //             height: 23,
      //             width: 23,
      //           ),
      //         ),
      //         label: '',
      //       ),
      //       NavigationDestination(
      //         selectedIcon: Container(
      //           margin: const EdgeInsets.only(top: 20),
      //           child: SvgPicture.asset(
      //             SvgIconsPaths.transportBold,
      //             height: 23,
      //             width: 23,
      //           ),
      //         ),
      //         icon: Container(
      //           margin: const EdgeInsets.only(top: 20),
      //           child: SvgPicture.asset(
      //             SvgIconsPaths.transportOutline,
      //             height: 23,
      //             width: 23,
      //           ),
      //         ),
      //         label: '',
      //       ),
      //       NavigationDestination(
      //         selectedIcon: Container(
      //           margin: const EdgeInsets.only(top: 20),
      //           child: SvgPicture.asset(
      //             SvgIconsPaths.userBold,
      //             height: 23,
      //             width: 23,
      //           ),
      //         ),
      //         icon: Container(
      //           margin: const EdgeInsets.only(top: 20),
      //           child: SvgPicture.asset(
      //             SvgIconsPaths.userOutline,
      //             height: 23,
      //             width: 23,
      //           ),
      //         ),
      //         label: '',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = <Widget>[
    const HomeScreen(),
    const MainSearchScreen(),
    Container(
      color: Colors.red,
    ),
    const MainTransportScreen(),
    const VerifiedArtistProfile(),
  ];
}
