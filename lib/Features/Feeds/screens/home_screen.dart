import 'package:explore_larosa_mobile/Features/Feeds/screens/components/business_post_card.dart';
import 'package:explore_larosa_mobile/Features/Feeds/screens/components/personal_post_card.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/image_strings.dart';
import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
                icon: SvgPicture.asset(
                  SvgIconsPaths.chatOutline,
                  width: 40,
                  height: 40,
                  colorFilter: const ColorFilter.mode(
                    LarosaColors.darkerGrey,
                    BlendMode.srcIn,
                  ),
                  semanticsLabel: 'chat icon',
                ),
              ),
              const Text(
                'Explore Larosa',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  SvgIconsPaths.notificationOutline,
                  width: 40,
                  height: 40,
                  colorFilter: const ColorFilter.mode(
                    LarosaColors.darkerGrey,
                    BlendMode.srcIn,
                  ),
                  semanticsLabel: 'notification icon',
                ),
              ),
            ],
          ),
        ),
        const TopBar2(),
        const BusinessPostCard(
          rating: 4.6,
          price: 6500.50,
          businessLocation: 'Post, Dar-es-salaam',
          postImageString:
              'https://images.pexels.com/photos/2233348/pexels-photo-2233348.jpeg?auto=compress&cs=tinysrgb&w=600',
          username: 'Johari Rotana',
          isVerified: false,
          profilePictureString:
              'https://images.pexels.com/photos/20230203/pexels-photo-20230203/free-photo-of-an-old-camera-sitting-on-top-of-a-newspaper.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
          location: 'Santori, Greece',
        ),
        const PersonalPostCard(),
        const BusinessPostCard(
          rating: 4.2,
          price: 42000,
          businessLocation: 'Kisasa, Dodoma',
          postImageString:
              'https://images.pexels.com/photos/1199957/pexels-photo-1199957.jpeg?auto=compress&cs=tinysrgb&w=600',
          username: 'KFC',
          isVerified: false,
          location: 'Mlimani City, Dar',
          profilePictureString:
              'https://images.pexels.com/photos/18818714/pexels-photo-18818714/free-photo-of-gallery-in-italy.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
        ),
        const PersonalPostCard(),
        const BusinessPostCard(
          rating: 3.5,
          price: 21000,
          businessLocation: 'Capital City Mall, Dodoma',
          postImageString:
              'https://images.pexels.com/photos/2120483/pexels-photo-2120483.jpeg?auto=compress&cs=tinysrgb&w=600',
          username: 'Rhobaika',
          isVerified: false,
          location: 'Rock City Mall',
          profilePictureString:
              'https://images.pexels.com/photos/13562058/pexels-photo-13562058.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
        ),
        const PersonalPostCard(),
        const BusinessPostCard(
          rating: 4.2,
          price: 42000,
          businessLocation: 'Kisasa, Dodoma',
          postImageString:
              'https://images.pexels.com/photos/6529599/pexels-photo-6529599.jpeg?auto=compress&cs=tinysrgb&w=600',
          username: 'Stancer Fame',
          isVerified: false,
          location: 'Morena Hotel, Dodoma',
          profilePictureString:
              'https://images.pexels.com/photos/16563297/pexels-photo-16563297/free-photo-of-hermitage-of-saint-john-in-montserrat.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
        ),
        const PersonalPostCard(),
        const BusinessPostCard(
          rating: 4.2,
          price: 42000,
          businessLocation: 'Kisasa, Dodoma',
          postImageString:
              'https://images.pexels.com/photos/3323687/pexels-photo-3323687.jpeg?auto=compress&cs=tinysrgb&w=600',
          username: 'James Mbogo',
          isVerified: true,
          location: 'Rafiki Hotel, Dodoma',
          profilePictureString:
              'https://images.pexels.com/photos/20523844/pexels-photo-20523844/free-photo-of-a-vintage-telephone-on-a-table-with-a-clock.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
        ),
      ],
    );
  }
}

class TopBar2 extends StatelessWidget {
  const TopBar2({
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
            SvgIconsPaths.fireOutline,
            width: 40,
            height: 40,
            colorFilter: const ColorFilter.mode(
              LarosaColors.darkerGrey,
              BlendMode.srcIn,
            ),
            semanticsLabel: 'Fire icon',
          ),
          ClipOval(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/placeholder.png'),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    LarosaImages.AvatarPlaceholder,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  );
                },
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                image: const NetworkImage(
                  'https://images.pexels.com/photos/18325432/pexels-photo-18325432/free-photo-of-hiker-and-a-camera-standing-by-a-lake-in-the-forest-with-her-arms-spread.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgIconsPaths.locationOutline,
              width: 40,
              height: 40,
              colorFilter: const ColorFilter.mode(
                LarosaColors.darkerGrey,
                BlendMode.srcIn,
              ),
              semanticsLabel: 'location icon',
            ),
          ),
        ],
      ),
    );
  }
}
