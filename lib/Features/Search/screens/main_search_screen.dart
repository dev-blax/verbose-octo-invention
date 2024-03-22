import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class MainSearchScreen extends StatefulWidget {
  const MainSearchScreen({super.key});

  @override
  State<MainSearchScreen> createState() => _MainSearchScreenState();
}

class _MainSearchScreenState extends State<MainSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchContainer(),
          ],
        ),
      ),
    );
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: LarosaSizes.DefaultSpace),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: LarosaColors.light,
          borderRadius: BorderRadius.circular(LarosaSizes.CardRadiuslg),
          border: Border.all(color: LarosaColors.grey),
        ),
        child: const Row(
          children: [
            Icon(
              Iconsax.search_normal,
              color: LarosaColors.darkGrey,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Search in Store',
            )
          ],
        ),
      ),
    );
  }
}
