import 'package:explore_larosa_mobile/Components/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      body: const PostCard(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Iconsax.truck,
              ),
              label: 'Delivery'),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.add_circle5), label: 'Post'),
        ],
      ),
    );
  }
}
