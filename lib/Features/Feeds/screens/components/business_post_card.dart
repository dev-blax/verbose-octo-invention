import 'package:cached_network_image/cached_network_image.dart';
import 'package:explore_larosa_mobile/Features/Chat/convo_screen.dart';
import 'package:explore_larosa_mobile/Features/Profiles/screens/business_profile.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/image_strings.dart';
import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessPostCard extends StatefulWidget {
  final String username;
  final bool isVerified;
  final String location;
  final String profilePictureString;
  final String postImageString;
  final double price;
  final String businessLocation;
  final double rating;

  const BusinessPostCard({
    super.key,
    required this.postImageString,
    required this.username,
    required this.isVerified,
    required this.profilePictureString,
    required this.location,
    required this.price,
    required this.businessLocation,
    required this.rating,
  });

  @override
  State<BusinessPostCard> createState() => _BusinessPostCardState();
}

class _BusinessPostCardState extends State<BusinessPostCard> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Stack
          ImageSection(
            postImagePath: widget.postImageString,
            isLiked: isLiked,
            username: widget.username,
            location: widget.location,
            profilePictureString: widget.profilePictureString,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () async {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      icon: !isLiked

                          // outlinedLike button
                          ? SvgPicture.asset(
                              LarosaImages.outlineHeartIconPth,
                              width: 30,
                              height: 30,
                              colorFilter: const ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcIn,
                              ),
                              semanticsLabel: 'Like icon',
                            )
                          : SvgPicture.asset(
                              iconName,
                              width: 30,
                              height: 30,
                              colorFilter: const ColorFilter.mode(
                                  Colors.red, BlendMode.srcIn),
                              semanticsLabel: 'Like icon',
                            ),
                    ),
                    const Text(
                      '128k',
                      style: TextStyle(
                          color: LarosaColors.dark,
                          fontWeight: FontWeight.w600),
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
                          SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: const BoxDecoration(
                                  color: LarosaColors.light,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
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
                                  ChatInput(),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Iconsax.message, size: 30),
                    ),
                    const Text(
                      '200',
                      style: TextStyle(
                          color: LarosaColors.dark,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),

                // Share
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.send_2,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const PostDetails(),

          // Location & Rating and Price
          SizedBox(
            height: 80,
            child: Column(
              children: [
                // TODO: Location
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg_icons/locationBold.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.businessLocation,
                      ),
                    ],
                  ),
                ),

                // TODO: Rating and Price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // rating
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg_icons/StarBold.svg',
                            colorFilter: const ColorFilter.mode(
                              LarosaColors.gold,
                              BlendMode.srcIn,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/svg_icons/StarBold.svg',
                            colorFilter: const ColorFilter.mode(
                              LarosaColors.gold,
                              BlendMode.srcIn,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/svg_icons/StarBold.svg',
                            colorFilter: const ColorFilter.mode(
                              LarosaColors.gold,
                              BlendMode.srcIn,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/svg_icons/StarBold.svg',
                            colorFilter: const ColorFilter.mode(
                              LarosaColors.gold,
                              BlendMode.srcIn,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/svg_icons/StarBold.svg',
                            colorFilter: const ColorFilter.mode(
                              LarosaColors.gold,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(
                            width: 05,
                          ),
                          const Text(
                            '4.8',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),

                      // price
                      Text(
                        'Tsh ${widget.price}  /=',
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PostDetails extends StatelessWidget {
  const PostDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: RichText(
        text: TextSpan(
          text: 'Post Details ',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
                text:
                    'Life is a ride, Take the front seat. In a hundred year, Everybody is gonna die, nobody is gonna remember you. So F it',
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // to register
                  })
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
        CachedNetworkImage(
          imageUrl: postImagePath,
          placeholder: (context, url) => Image.asset(
            LarosaImages.loadingGif,
            height: 500,
            width: MediaQuery.of(context).size.width,
          ),
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 300),
          fadeOutDuration: const Duration(milliseconds: 100),
          height: 500,
          width: MediaQuery.of(context).size.width,
          errorWidget: (context, url, error) => Image.asset(
            LarosaImages.AvatarPlaceholder,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // profile picture
                  // Container(
                  //   width: 50,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //       image: const DecorationImage(
                  //           image: NetworkImage(
                  //             'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBvcnRyYWl0fGVufDB8fDB8fHww',
                  //           ),
                  //           fit: BoxFit.cover),
                  //       borderRadius: BorderRadius.circular(25)),
                  // ),
                  CachedNetworkImage(
                    imageUrl: profilePictureString,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey, // Placeholder color
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons
                        .error), // Error widget, you can customize as needed
                    fit: BoxFit.cover,
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
                          GestureDetector(
                            onTap: () {
                              Get.to(const BusinessProfile());
                            },
                            child: Text(
                              username,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.shopping_cart5,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
