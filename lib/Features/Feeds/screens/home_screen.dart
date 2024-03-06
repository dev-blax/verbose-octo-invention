import 'package:explore_larosa_mobile/Components/post_card.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Iconsax.messages_35,
                  size: 30,
                  color: LarosaColors.primary,
                ),
                Text(
                  'Explore Larosa',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Icon(Iconsax.firstline)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(LarosaImages.boldFireballIconPath,
                    width: 40,
                    height: 40,
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    semanticsLabel: 'Like icon'),
                ClipOval(
                    child: Image.asset(
                  'assets/images/portrait1.jpg',
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                )),
                SvgPicture.asset('assets/icons/IonFireball.svg',
                    width: 40,
                    height: 40,
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    semanticsLabel: 'Like icon'),
              ],
            ),
          ),
          const PostCard(
            postImageString: 'assets/images/happy-couple.jpg',
            username: 'Fredrick Shayo',
            isVerified: false,
            location: 'Mlimani City, Dar',
            profilePictureString: 'assets/images/happy-couple.jpg',
          ),
          const PostCard(
            postImageString: 'assets/images/hotel-wine.jpg',
            username: 'Julius Mushi',
            isVerified: false,
            location: 'Rock City Mall',
            profilePictureString: 'assets/images/ladyInBlack.jpg',
          ),
          const PostCard(
            postImageString: 'assets/images/beautiful-dog.jpg',
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
          )
        ],
      ),
    );
  }
}

class LarosaBotttomNavigation extends StatelessWidget {
  const LarosaBotttomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(
              Iconsax.truck,
            ),
            label: 'Delivery'),
        BottomNavigationBarItem(icon: Icon(Iconsax.add_circle5), label: 'Post'),
      ],
    );
  }
}
