import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class VerifiedArtistProfile extends StatefulWidget {
  const VerifiedArtistProfile({super.key});

  @override
  State<VerifiedArtistProfile> createState() => _VerifiedArtistProfileState();
}

class _VerifiedArtistProfileState extends State<VerifiedArtistProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                'assets/images/dog.jpg',
                height: 300,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ),
              ),
              const Positioned(
                  bottom: 10,
                  left: 10,
                  child: Row(
                    children: [
                      Text(
                        'Diamond Platnumz',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
              Positioned(
                  bottom: -100,
                  right: 10,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const ProfileImageWithRing(
                        imageUrl: 'assets/images/lady-nice-hair.jpg',
                      )))
            ],
          )
        ],
      ),
    );
  }
}

class ProfileImageWithRing extends StatelessWidget {
  final String imageUrl;

  const ProfileImageWithRing({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            height: 120,
            width: 120,
            // Adjust the size of the circular overlay
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 4, color: LarosaColors.primary)),
          ),
        ),
        SizedBox(
          width: 100, // Adjust the size of the square image
          height: 100, // Adjust the size of the square image
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
