import 'package:explore_larosa_mobile/Components/liked_heart.dart';
import 'package:explore_larosa_mobile/Features/Profiles/screens/business_profile.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: LarosaSizes.DefaultSpace),
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
          ),
          const SearchGrid(),
        ],
      ),
    );
  }
}

class SearchPostCard extends StatelessWidget {
  final bool isLiked;
  final String imagePath;
  const SearchPostCard(
      {super.key, required this.isLiked, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              height: 240,
              width: MediaQuery.of(context).size.width / 2 - 5,
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    LarosaColors.black.withOpacity(0.6),
                    Colors.transparent
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            ),
          ),

          // actions
          Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  isLiked
                      ? const LikeHeart()
                      : const Icon(
                          Iconsax.heart,
                          color: Colors.white,
                        ),
                  const Icon(
                    Iconsax.message,
                    color: LarosaColors.light,
                  ),
                  const Icon(
                    Iconsax.send_2,
                    color: LarosaColors.light,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class SearchGrid extends StatelessWidget {
  const SearchGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GridView.count(
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 2,
        shrinkWrap: true,
        children: const <Widget>[
          SearchPostCard(
            imagePath: 'assets/images/mik4.jpg',
            isLiked: true,
          ),
          SearchPostCard(
            imagePath: 'assets/images/milk6.jpg',
            isLiked: false,
          ),
          SearchPostCard(
            imagePath: 'assets/images/milkshake1.jpg',
            isLiked: false,
          ),
          SearchPostCard(
            imagePath: 'assets/images/hotel-wine.jpg',
            isLiked: true,
          ),
          SearchPostCard(
            imagePath: 'assets/images/milk7.jpg',
            isLiked: true,
          ),
          SearchPostCard(
            imagePath: 'assets/images/milkshake3.jpg',
            isLiked: true,
          ),
          SearchPostCard(
            imagePath: 'assets/images/milkshake1.jpg',
            isLiked: false,
          ),
          SearchPostCard(
            imagePath: 'assets/images/hotel-wine.jpg',
            isLiked: true,
          ),
          SearchPostCard(
            imagePath: 'assets/images/milk7.jpg',
            isLiked: true,
          ),
          SearchPostCard(
            imagePath: 'assets/images/milkshake3.jpg',
            isLiked: true,
          ),
          SizedBox(
            height: 800,
          )
        ],
      ),
    );
  }
}
