import 'package:explore_larosa_mobile/Features/Feeds/screens/components/business_post_card.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/image_strings.dart';
import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class PersonalPostCard extends StatefulWidget {
  const PersonalPostCard({super.key});

  @override
  State<PersonalPostCard> createState() => _PersonalPostCardState();
}

class _PersonalPostCardState extends State<PersonalPostCard> {
  bool isLiked = false;
  bool isStarred = false;
  final String iconName = 'assets/icons/SolarHeartAngleBold.svg';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Column(
        children: [
          // Todo: image section
          ImageSection(
            profilePictureString: 'assets/images/portrait2.jpg',
            isLiked: isLiked,
            username: 'James One',
            location: 'New York, USA',
            postImagePath: 'assets/images/beach.jpg',
          ),

          // like , message, star and send
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Like button
                    IconButton(
                      onPressed: () async {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      icon: !isLiked
                          ? SvgPicture.asset(
                              LarosaImages.outlineHeartIconPth,
                              width: 30,
                              height: 30,
                              colorFilter: const ColorFilter.mode(
                                LarosaColors.darkGrey,
                                BlendMode.srcIn,
                              ),
                              semanticsLabel: 'Like icon',
                            )
                          : SvgPicture.asset(
                              iconName,
                              width: 30,
                              height: 30,
                              colorFilter: const ColorFilter.mode(
                                Colors.red,
                                BlendMode.srcIn,
                              ),
                              semanticsLabel: 'Like icon',
                            ),
                    ),
                    const Text(
                      '128k',
                      style: TextStyle(
                        color: LarosaColors.dark,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),

                // Star Button
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isStarred = !isStarred;
                        });

                        // Get.defaultDialog();
                      },
                      icon: !isStarred
                          ? SvgPicture.asset(
                              SvgIconsPaths.starOutline,
                              width: 30,
                              height: 30,
                              colorFilter: const ColorFilter.mode(
                                LarosaColors.darkGrey,
                                BlendMode.srcIn,
                              ),
                              semanticsLabel: 'Like icon',
                            )
                          : SvgPicture.asset(
                              SvgIconsPaths.starBold,
                              width: 30,
                              height: 30,
                              colorFilter: const ColorFilter.mode(
                                LarosaColors.gold,
                                BlendMode.srcIn,
                              ),
                              semanticsLabel: 'Like icon',
                            ),
                    ),
                    const Text(
                      '503',
                      style: TextStyle(
                          color: LarosaColors.dark,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),

                // comment icon
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.bottomSheet(
                          const PostComments(),
                        );
                      },
                      icon: SvgPicture.asset(
                        SvgIconsPaths.chatOutline,
                        width: 30,
                        height: 30,
                        colorFilter: const ColorFilter.mode(
                          LarosaColors.darkGrey,
                          BlendMode.srcIn,
                        ),
                        semanticsLabel: 'Like icon',
                      ),
                    ),
                    const Text(
                      '200',
                      style: TextStyle(
                        color: LarosaColors.dark,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),

                // Share
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    SvgIconsPaths.sendArrowOutline,
                    width: 30,
                    height: 30,
                    colorFilter: const ColorFilter.mode(
                      LarosaColors.darkGrey,
                      BlendMode.srcIn,
                    ),
                    semanticsLabel: 'Like icon',
                  ),
                ),
              ],
            ),
          ),

          const PostDetails(),

          // space below
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class PostComments extends StatelessWidget {
  const PostComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
            color: LarosaColors.light,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: const Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Iconsax.message,
                color: LarosaColors.primary,
              ),
              title: Text('Comment 1'),
            ),
            ListTile(
              leading: Icon(
                Iconsax.message,
                color: LarosaColors.primary,
              ),
              title: Text('Comment 2'),
            ),
            ListTile(
              leading: Icon(
                Iconsax.message,
                color: LarosaColors.primary,
              ),
              title: Text('Comment 3'),
            ),
            ListTile(
              leading: Icon(
                Iconsax.message,
                color: LarosaColors.primary,
              ),
              title: Text('Comment 4'),
            ),
            ListTile(
              leading: Icon(
                Iconsax.message,
                color: LarosaColors.primary,
              ),
              title: Text('Comment 5'),
            ),
            //ChatInput(),
          ],
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.profilePictureString,
    required this.isLiked,
    required this.username,
    required this.location,
    required this.postImagePath,
  });

  final String postImagePath;
  final bool isLiked;
  final String username;
  final String location;
  final String profilePictureString;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                postImagePath,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    isLiked
                        ? Colors.red.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5),
                    Colors.transparent
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: Row(
            children: [
              Row(
                children: [
                  // profile picture
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(profilePictureString),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  // Name and Location
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            username,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Iconsax.verify5,
                            size: 25,
                            color: Colors.blue,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Iconsax.location5,
                            color: Colors.white,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            location,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
