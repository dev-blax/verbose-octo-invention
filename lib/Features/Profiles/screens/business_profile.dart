import 'package:explore_larosa_mobile/Components/liked_heart.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BusinessProfile extends StatefulWidget {
  const BusinessProfile({super.key});

  @override
  State<BusinessProfile> createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Profile Background Image
              Image.asset(
                'assets/images/pizza.jpg',
                height: 250,
                width: LarosaHelperFunction.screenWidth(),
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                  child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              )),
              const Positioned(
                  bottom: 5,
                  left: 10,
                  child: Text(
                    "400 Monthly Orders",
                    style: TextStyle(color: Colors.white),
                  )),

              // Profile Image
              Positioned(
                  right: 12,
                  bottom: -70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.asset(
                      'assets/images/lady-nice-hair.jpg',
                      fit: BoxFit.cover,
                      height: 140,
                      width: 140,
                    ),
                  ))
            ],
          ),

          // Business Details
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ANGIE SNACKS BAR'),
                Text('Restaurant & Bar'),
                Row(
                  children: [
                    Icon(
                      Iconsax.star,
                      color: Colors.orange,
                    ),
                    Icon(
                      Iconsax.star,
                      color: Colors.orange,
                    ),
                    Icon(
                      Iconsax.star,
                      color: Colors.orange,
                    ),
                    Icon(
                      Iconsax.star,
                      color: Colors.orange,
                    ),
                    Icon(
                      Iconsax.star,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '4.8',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
          ),

          // Stats
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Powersize',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                      '1.2 M',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.blue),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('Strings'),
                    Text(
                      '250',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('Following'),
                    Text(
                      '25',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('Followers'),
                    Text(
                      '256k',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ],
            ),
          ),

          // action buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  decoration: BoxDecoration(
                      color: LarosaColors.softGrey,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.add_circle5,
                          color: LarosaColors.primary,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Follow',
                          style: TextStyle(
                              color: LarosaColors.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  decoration: BoxDecoration(
                      //color: Colors.grey.withOpacity(0.4),
                      border: Border.all(color: LarosaColors.primary, width: 2),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.message5,
                          color: LarosaColors.primary,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Chat',
                          style: TextStyle(
                              color: LarosaColors.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            LarosaColors.primary,
                            LarosaColors.secondary
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.send_2,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Share',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 500, child: TabTest()),
        ],
      ),
    );
  }
}

class CardGrid extends StatelessWidget {
  const CardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 2,
      physics:
          const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true, // You won't see infinite size error
      children: const <Widget>[
        BusinssProfilePostCard(
          imagePath: 'assets/images/mik4.jpg',
          isLiked: true,
        ),
        BusinssProfilePostCard(
          imagePath: 'assets/images/milk6.jpg',
          isLiked: false,
        ),
        BusinssProfilePostCard(
          imagePath: 'assets/images/milkshake1.jpg',
          isLiked: false,
        ),
        BusinssProfilePostCard(
          imagePath: 'assets/images/hotel-wine.jpg',
          isLiked: true,
        ),
        BusinssProfilePostCard(
          imagePath: 'assets/images/milk7.jpg',
          isLiked: true,
        ),
        BusinssProfilePostCard(
          imagePath: 'assets/images/milkshake3.jpg',
          isLiked: true,
        ),
      ],
    );
  }
}

class TabTest extends StatelessWidget {
  const TabTest({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints.expand(height: 50),
            child: const TabBar(
              tabs: [
                Tab(text: 'Posts'),
                Tab(text: 'Services'),
                Tab(text: 'About'),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                // Content for Tab 1
                CardGrid(),

                // Content for Tab 2
                Center(child: Text('Tab 2 content')),

                // Content for Tab 3
                Center(child: Text('Tab 3 content')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BusinssProfilePostCard extends StatelessWidget {
  final bool isLiked;
  final String imagePath;
  const BusinssProfilePostCard(
      {super.key, required this.isLiked, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          height: 240,
          width: MediaQuery.of(context).size.width / 2 - 5,
          imagePath,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
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
    );
  }
}
