// import 'package:explore_larosa_mobile/Features/Feeds/screens/home_screen.dart';
// import 'package:explore_larosa_mobile/Features/Feeds/screens/new_post_screen.dart';
// import 'package:explore_larosa_mobile/Features/Profiles/screens/verified_artist_profile.dart';
// import 'package:explore_larosa_mobile/Features/Search/screens/main_search_screen.dart';
// import 'package:explore_larosa_mobile/Features/Transport/screens/main_transport_screen.dart';
// import 'package:explore_larosa_mobile/utils/constants/colors.dart';
// import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class Core extends StatefulWidget {
//   const Core({super.key});

//   @override
//   State<Core> createState() => _CoreState();
// }

// class _CoreState extends State<Core> {
//   final NavigationController _navigationController = NavigationController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<NavigationController>(
//         init: _navigationController,
//         builder: (controller) =>
//             controller.screens[controller.selectedIndex.value],
//       ),
//       bottomNavigationBar: GetBuilder<NavigationController>(
//         init: _navigationController,
//         builder: (controller) => NavigationBar(
//           indicatorColor: Colors.transparent,
//           backgroundColor: LarosaColors.lightContainer.withOpacity(.2),
//           height: 50,
//           elevation: 0,
//           selectedIndex: controller.selectedIndex.value,
//           onDestinationSelected: (index) {
//             index != 2
//                 ? controller.selectedIndex.value = index
//                 : Get.to(
//                     const NewPostScreen(),
//                     transition: Transition.downToUp,
//                   );
//           },
//           destinations: [
//             NavigationDestination(
//               icon: Padding(
//                 padding: const EdgeInsets.only(top: 12.0),
//                 child: SvgPicture.asset(
//                   SvgIconsPaths.homeOutline,
//                 ),
//               ),
//               label: '',
//               selectedIcon: Padding(
//                 padding: const EdgeInsets.only(top: 12.0),
//                 child: SvgPicture.asset(
//                   SvgIconsPaths.homeBold,
//                 ),
//               ),
//             ),
//             NavigationDestination(
//               icon: Padding(
//                 padding: const EdgeInsets.only(top: 12.0),
//                 child: SvgPicture.asset(
//                   SvgIconsPaths.searchOutline,
//                 ),
//               ),
//               label: '',
//               selectedIcon: Padding(
//                 padding: const EdgeInsets.only(top: 12.0),
//                 child: SvgPicture.asset(
//                   SvgIconsPaths.searchBold,
//                   height: 20,
//                   width: 20,
//                 ),
//               ),
//             ),
//             NavigationDestination(
//               icon: Padding(
//                 padding: const EdgeInsets.only(top: 12.0),
//                 child: SvgPicture.asset(
//                   SvgIconsPaths.addOutline,
//                 ),
//               ),
//               label: '',
//               selectedIcon: Padding(
//                 padding: const EdgeInsets.only(top: 12.0),
//                 child: SvgPicture.asset(
//                   SvgIconsPaths.addOutline,
//                 ),
//               ),
//             ),
//             NavigationDestination(
//               icon: Padding(
//                 padding: const EdgeInsets.only(top: 12.0),
//                 child: SvgPicture.asset(
//                   SvgIconsPaths.transportOutline,
//                 ),
//               ),
//               label: '',
//               selectedIcon: Padding(
//                 padding: const EdgeInsets.only(top: 12.0),
//                 child: SvgPicture.asset(
//                   SvgIconsPaths.transportBold,
//                 ),
//               ),
//             ),
//             NavigationDestination(
//               icon: Padding(
//                 padding: const EdgeInsets.only(top: 12.0),
//                 child: SvgPicture.asset(
//                   SvgIconsPaths.userOutline,
//                 ),
//               ),
//               label: '',
//               selectedIcon: Padding(
//                 padding: const EdgeInsets.only(top: 12.0),
//                 child: SvgPicture.asset(
//                   SvgIconsPaths.userBold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NavigationController extends GetxController {
//   final Rx<int> selectedIndex = 0.obs;

//   final List<Widget> screens = [
//     const HomeScreen(),
//     const MainSearchScreen(),
//     Container(
//       color: Colors.orange,
//     ),
//     const MainTransportScreen(),
//     const VerifiedArtistProfile(),
//   ];
// }

// import 'package:explore_larosa_mobile/Features/Feeds/screens/home_screen.dart';
// import 'package:explore_larosa_mobile/Features/Profiles/screens/verified_artist_profile.dart';
// import 'package:explore_larosa_mobile/Features/Search/screens/main_search_screen.dart';
// import 'package:explore_larosa_mobile/Features/Transport/screens/main_transport_screen.dart';
// import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class LarosaCore extends StatefulWidget {
//   const LarosaCore({super.key});

//   @override
//   State<LarosaCore> createState() => _LarosaCoreState();
// }

// class _LarosaCoreState extends State<LarosaCore> {
//   @override
//   Widget build(BuildContext context) {
//     int currentIndex = 0;
//     // screens
//     final List screens = [
//       const HomeScreen(),
//       const MainSearchScreen(),
//       const HomeScreen(),
//       const MainTransportScreen(),
//       const VerifiedArtistProfile(),
//     ];

//     // return
//     return Scaffold(
//       body: screens[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (value) {
//           setState(() {
//             currentIndex = value;
//           });
//           print('current indext $currentIndex');
//         },
//         items: [
//           BottomNavigationBarItem(
//             label: 'Home',
//             activeIcon: SvgPicture.asset(
//               SvgIconsPaths.homeBold,
//             ),
//             icon: SvgPicture.asset(
//               SvgIconsPaths.homeOutline,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: 'Search',
//             icon: SvgPicture.asset(
//               SvgIconsPaths.searchOutline,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: 'Post',
//             icon: SvgPicture.asset(
//               SvgIconsPaths.addBold,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: '',
//             icon: SvgPicture.asset(
//               SvgIconsPaths.transportOutline,
//             ),
//           ),
//           BottomNavigationBarItem(
//             label: '',
//             icon: SvgPicture.asset(
//               SvgIconsPaths.userOutline,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:explore_larosa_mobile/Features/Feeds/screens/home_screen.dart';
import 'package:explore_larosa_mobile/Features/Search/screens/main_search_screen.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: LarosaColors.darkerGrey.withOpacity(.1),
          indicatorColor: Colors.transparent,
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              selectedIcon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Icon(Iconsax.home5),
              ),
              icon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Icon(Iconsax.home),
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Icon(Iconsax.home5),
              ),
              icon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Icon(Iconsax.home),
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Icon(Iconsax.home5),
              ),
              icon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Icon(Iconsax.home),
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Icon(Iconsax.home5),
              ),
              icon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Icon(Iconsax.home),
              ),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Icon(Iconsax.home5),
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
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
}