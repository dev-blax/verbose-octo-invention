import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: LarosaColors.light,
          hintText: 'Search here...',
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Iconsax.search_normal_1),
          ),
        ),
      ),
    );
  }
}
