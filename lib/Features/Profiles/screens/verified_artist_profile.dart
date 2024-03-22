import 'package:explore_larosa_mobile/Features/Profiles/screens/business_profile.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class VerifiedArtistProfile extends StatefulWidget {
  const VerifiedArtistProfile({super.key});

  @override
  State<VerifiedArtistProfile> createState() => _VerifiedArtistProfileState();
}

class _VerifiedArtistProfileState extends State<VerifiedArtistProfile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            // Profile Background Image
            Image.asset(
              'assets/images/diamond2.jpg',
              height: 250,
              width: LarosaHelperFunction.screenWidth(),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            const Positioned(
                bottom: 5,
                left: 10,
                child: Row(
                  children: [
                    Text(
                      "Diamond Platnumz",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Iconsax.verify5,
                      color: LarosaColors.primary,
                    )
                  ],
                )),

            // Profile Image
            const ProfileImageWithStatusRing(),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verified Artist',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text('CEO @wasafi @WasafiFm'),
              Text('I believe in GOD')
            ],
          ),
        ),

        // Divider
        const Divider(
          thickness: 2,
          color: LarosaColors.grey,
          indent: 20,
          endIndent: 20,
          height: 40,
        ),

        // Stats: Powersize, Strings, Following, Followers
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Powersize',
                    style: TextStyle(
                      color: LarosaColors.primary,
                    ),
                  ),
                  Text(
                    '1.2 M',
                    style: TextStyle(
                      color: LarosaColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text('Strings'),
                  Text(
                    '250',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text('Following'),
                  Text(
                    '25',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text('Followers'),
                  Text(
                    '19.2 M',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

        // Actions buttton: Following, Text, Share
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LarosaColors.blueGradient,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: const Center(
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.user_add,
                        color: LarosaColors.light,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                          color: LarosaColors.light,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                    color: LarosaColors.primary,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(13),
                child: const Center(
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.message_favorite5,
                        color: LarosaColors.secondary,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Message',
                        style: TextStyle(
                          color: LarosaColors.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    width: 2,
                    color: LarosaColors.primary,
                  ),
                ),
                child: const Center(
                  child: Row(
                    children: [
                      Icon(Iconsax.send_2),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Tab
        SizedBox(
          height: MediaQuery.of(context).size.width,
          child: const TabTest(),
        ),
      ],
    );
  }
}

class ProfileImageWithStatusRing extends StatelessWidget {
  const ProfileImageWithStatusRing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12,
      bottom: -70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 148,
          height: 148,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.blue, // Set border color to blue
              width: 4, // Set border width to 4
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/diamond4.jpg',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
            ),
          ),
        ),
      ),
    );
  }
}

class VerfiedTab extends StatelessWidget {
  const VerfiedTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints.expand(height: 50),
                child: const TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Iconsax.image),
                    ),
                    Tab(
                      icon: Icon(Iconsax.image),
                    ),
                    Tab(
                      icon: Icon(Iconsax.image),
                    ),
                  ],
                ),
              ),
              const TabBarView(children: [
                CardGrid(),
                Center(
                  child: Text('Videos'),
                ),
                Center(
                  child: Text('About'),
                )
              ])
            ],
          )),
    );
  }
}
