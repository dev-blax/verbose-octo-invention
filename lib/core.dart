import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
import 'package:flutter/material.dart';
import 'package:explore_larosa_mobile/Features/Feeds/screens/home_screen.dart';
import 'package:explore_larosa_mobile/Features/Search/screens/main_search_screen.dart';
import 'package:explore_larosa_mobile/Features/Transport/screens/main_transport_screen.dart';
import 'package:explore_larosa_mobile/Features/Feeds/screens/new_post_screen.dart';
import 'package:explore_larosa_mobile/Features/Profiles/screens/verified_artist_profile.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/image_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Core extends StatefulWidget {
  const Core({super.key});

  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: LarosaColors.lightContainer,
        selectedItemColor: LarosaColors.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: controller.selectedIndex.value,
        onTap: (index) {
          print('index clicked $index');
          controller.selectedIndex.value = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgIconsPaths.homeOutline,
              width: 30,
              height: 30,
              colorFilter: const ColorFilter.mode(
                LarosaColors.darkerGrey,
                BlendMode.srcIn,
              ),
              semanticsLabel: 'location icon',
            ),
            label: '', // Empty label to hide it
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgIconsPaths.searchOutline,
              width: 30,
              height: 30,
              colorFilter: const ColorFilter.mode(
                LarosaColors.darkerGrey,
                BlendMode.srcIn,
              ),
              semanticsLabel: 'location icon',
            ),
            label: '', // Empty label to hide it
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgIconsPaths.addOutline,
              width: 30,
              height: 30,
              colorFilter: const ColorFilter.mode(
                LarosaColors.darkerGrey,
                BlendMode.srcIn,
              ),
              semanticsLabel: 'location icon',
            ),
            label: '', // Empty label to hide it
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgIconsPaths.transportOutline,
              width: 30,
              height: 30,
              colorFilter: const ColorFilter.mode(
                LarosaColors.darkerGrey,
                BlendMode.srcIn,
              ),
              semanticsLabel: 'location icon',
            ),
            label: '', // Empty label to hide it
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgIconsPaths.userOutline,
              width: 30,
              height: 30,
              colorFilter: const ColorFilter.mode(
                LarosaColors.darkerGrey,
                BlendMode.srcIn,
              ),
              semanticsLabel: 'location icon',
            ),
            label: '', // Empty label to hide it
          ),
        ],
      ),
    );
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
    const VerifiedArtistProfile(),
  ];
}







// import 'package:explore_larosa_mobile/Features/Feeds/screens/home_screen.dart';
// import 'package:explore_larosa_mobile/Features/Feeds/screens/new_post_screen.dart';
// import 'package:explore_larosa_mobile/Features/Profiles/screens/business_profile.dart';
// import 'package:explore_larosa_mobile/Features/Profiles/screens/verified_artist_profile.dart';
// import 'package:explore_larosa_mobile/Features/Search/screens/main_search_screen.dart';
// import 'package:explore_larosa_mobile/Features/Transport/screens/main_transport_screen.dart';
// import 'package:explore_larosa_mobile/utils/constants/colors.dart';
// import 'package:explore_larosa_mobile/utils/constants/image_strings.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class Core extends StatefulWidget {
//   const Core({super.key});

//   @override
//   State<Core> createState() => _CoreState();
// }

// class _CoreState extends State<Core> {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(
//       NavigationController(),
//     );

//     return Scaffold(
//       body: Obx(() => controller.screens[controller.selectedIndex.value]),
//       bottomNavigationBar: Obx(
//         () => NavigationBar(
//             backgroundColor: LarosaColors.lightContainer,
//             height: 50,
//             elevation: 0,
//             selectedIndex: controller.selectedIndex.value,
//             onDestinationSelected: (index) {
//               index != 2
//                   ? controller.selectedIndex.value = index
//                   : Get.to(const NewPostScreen(),
//                       transition: Transition.downToUp);
//             },
//             destinations: [
//               const NavigationDestination(
//                 icon: Icon(Iconsax.home),
//                 label: '',
//                 selectedIcon: Icon(Iconsax.home5),
//               ),
//               const NavigationDestination(
//                 icon: Icon(Iconsax.search_normal),
//                 label: '',
//                 selectedIcon: Icon(
//                   Iconsax.search_favorite,
//                 ),
//               ),
//               const NavigationDestination(
//                   icon: Icon(
//                     Iconsax.add_circle,
//                   ),
//                   label: ''),
//               const NavigationDestination(
//                 icon: Icon(
//                   Iconsax.truck,
//                 ),
//                 label: '',
//               ),
//               NavigationDestination(
//                 icon: SvgPicture.asset(
//                   LarosaImages.accountIconPath,
//                 ),
//                 label: '',
//               ),
//             ]),
//       ),
//     );
//   }
// }

// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;

//   final screens = [
//     const HomeScreen(),
//     const MainSearchScreen(),
//     Container(
//       color: Colors.orange,
//     ),
//     // Container(
//     //   color: Colors.purple,
//     // ),
//     const MainTransportScreen(),
//     //const BusinessProfile(),
//     const VerifiedArtistProfile()
//   ];
// }
