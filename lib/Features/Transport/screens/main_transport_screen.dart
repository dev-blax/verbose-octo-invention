import 'package:explore_larosa_mobile/Components/search_input.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class MainTransportScreen extends StatefulWidget {
  const MainTransportScreen({super.key});

  @override
  State<MainTransportScreen> createState() => _MainTransportScreenState();
}

class _MainTransportScreenState extends State<MainTransportScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MapSection(),

        // categories Buttons
        Positioned(
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: LarosaColors.lightGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: LarosaColors.light.withOpacity(.7),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Center(
                      child: Icon(Iconsax.arrow_up_2),
                    ),
                  ),
                ),
                const SearchInput(),
                // Container(
                //   padding: const EdgeInsets.all(8),
                //   height: 50,
                //   child: ListView.builder(
                //       itemCount: 6,
                //       shrinkWrap: true,
                //       itemBuilder: (_, index) {
                //         return Container(
                //           height: 50,
                //           width: 50,
                //           color: LarosaColors.light,
                //         );
                //       }),
                // ),

                // TODO: SOMETHING
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     vertical: 8.0,
                //     horizontal: 10,
                //   ),
                //   child: SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: Row(
                //       children: [
                //         ElevatedButton(
                //           onPressed: () {},
                //           child: const Row(
                //             children: [
                //               Icon(
                //                 Iconsax.home_25,
                //                 size: 20,
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: 8.0),
                //                 child: Text(
                //                   'Hotels',
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         const SizedBox(
                //           width: 10,
                //         ),
                //         ElevatedButton(
                //           onPressed: () {},
                //           child: Row(
                //             children: [
                //               SvgPicture.asset(
                //                 'assets/icons/kitchen.svg',
                //                 width: 20,
                //                 height: 20,
                //                 colorFilter: const ColorFilter.mode(
                //                     LarosaColors.darkerGrey, BlendMode.srcIn),
                //                 semanticsLabel: 'Like icon',
                //               ),
                //               const Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: 8.0),
                //                 child: Text(
                //                   'Restaurants',
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         const SizedBox(
                //           width: 10,
                //         ),
                //         ElevatedButton(
                //           onPressed: () {},
                //           child: const Row(
                //             children: [
                //               Icon(
                //                 Iconsax.home_25,
                //                 size: 20,
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: 8.0),
                //                 child: Text(
                //                   'Hotels',
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         const SizedBox(
                //           width: 10,
                //         ),
                //         ElevatedButton(
                //           onPressed: () {},
                //           child: const Row(
                //             children: [
                //               Icon(
                //                 Iconsax.home_25,
                //                 size: 20,
                //               ),
                //               Padding(
                //                 padding: EdgeInsets.symmetric(horizontal: 8.0),
                //                 child: Text(
                //                   'Hotels',
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //         const SizedBox(
                //           width: 10,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryElement extends StatelessWidget {
  const CategoryElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: LarosaColors.primary,
        ),
        onPressed: () {},
        child: const Row(
          children: [
            Icon(
              Iconsax.medal_star5,
              color: LarosaColors.light,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Hotel',
              style: TextStyle(
                color: LarosaColors.light,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewBuilderLearning extends StatelessWidget {
  const ListViewBuilderLearning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 12,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: LarosaColors.primary,
            ),
            onPressed: () {},
            child: const Row(
              children: [
                Icon(
                  Iconsax.medal_star5,
                  color: LarosaColors.light,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Hotel',
                  style: TextStyle(
                    color: LarosaColors.light,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MapSection extends StatelessWidget {
  const MapSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/map.PNG',
        fit: BoxFit.cover,
      ),
    );
  }
}
