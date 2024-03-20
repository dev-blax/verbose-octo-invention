import 'package:explore_larosa_mobile/Components/post_card.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLiked = false;
  bool isStarred = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Get.toNamed('/chatspace'),
                icon: const Icon(
                  Iconsax.messages,
                  size: 30,
                  color: LarosaColors.darkerGrey,
                ),
              ),
              const Text(
                'Explore Larosa',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.notification,
                    size: 30,
                    color: LarosaColors.darkerGrey,
                  ))
            ],
          ),
        ),
        const TransportFilters(),
        const PostCard(
          postImageString: 'assets/images/swim.jpg',
          username: 'Vanessa',
          isVerified: false,
          profilePictureString: 'assets/images/portrait1.jpg',
          location: 'Santori, Greece',
        ),
        const PostCard(
          postImageString: 'assets/images/dinner-2.jpg',
          username: 'Fredrick Shayo',
          isVerified: false,
          location: 'Mlimani City, Dar',
          profilePictureString: 'assets/images/happy-couple.jpg',
        ),
        const PostCard(
          postImageString: 'assets/images/pizza.jpg',
          username: 'Julius Mushi',
          isVerified: false,
          location: 'Rock City Mall',
          profilePictureString: 'assets/images/ladyInBlack.jpg',
        ),
        const PostCard(
          postImageString: 'assets/images/portrait1.jpg',
          username: 'Dwight Danda',
          isVerified: false,
          location: 'Morena Hotel, Dodoma',
          profilePictureString: 'assets/images/lady-nice-hair.jpg',
        ),
        const PostCard(
          postImageString: 'assets/images/ladyInBlack.jpg',
          username: 'James Mbogo',
          isVerified: true,
          location: 'Rafiki Hotel, Dodoma',
          profilePictureString: 'assets/images/ladyInBlack.jpg',
        ),
      ],
    );
  }
}

class TransportFilters extends StatelessWidget {
  const TransportFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            LarosaImages.boldFireballIconPath,
            width: 40,
            height: 40,
            colorFilter: const ColorFilter.mode(
                LarosaColors.darkerGrey, BlendMode.srcIn),
            semanticsLabel: 'Like icon',
          ),
          ClipOval(
            child: Image.asset(
              'assets/images/portrait1.jpg',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.location5,
              size: 30,
              color: LarosaColors.darkerGrey,
            ),
          ),
        ],
      ),
    );
  }
}
