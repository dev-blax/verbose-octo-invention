import 'package:explore_larosa_mobile/Components/post_card.dart';
import 'package:flutter/material.dart';
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
        children: const [
          PostCard(
            postImageString: 'assets/images/happy-couple.jpg',
            username: 'Fredrick Shayo',
            isVerified: false,
            location: 'Mlimani City, Dar',
            profilePictureString: 'assets/images/happy-couple.jpg',
          ),
          PostCard(
            postImageString: 'assets/images/hotel-wine.jpg',
            username: 'Julius Mushi',
            isVerified: false,
            location: 'Rock City Mall',
            profilePictureString: 'assets/images/ladyInBlack.jpg',
          ),
          PostCard(
            postImageString: 'assets/images/beautiful-dog.jpg',
            username: 'Dwight Danda',
            isVerified: false,
            location: 'Morena Hotel, Dodoma',
            profilePictureString: 'assets/images/lady-nice-hair.jpg',
          ),
          PostCard(
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
