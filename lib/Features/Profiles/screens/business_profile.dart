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
                          style: TextStyle(color: LarosaColors.primary),
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
                          style: TextStyle(color: LarosaColors.primary),
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
                          'Follow',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Tabs
        ],
      ),
    );
  }
}
