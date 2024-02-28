import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PostCard extends StatefulWidget {
  final String username;
  final bool isVerified;
  final String location;
  final String profilePictureString;
  final String postImageString;

  const PostCard(
      {super.key,
      required this.postImageString,
      required this.username,
      required this.isVerified,
      required this.profilePictureString,
      required this.location});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  bool isStarred = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageSection(
            postImagePath: widget.postImageString,
            isLiked: isLiked,
            username: widget.username,
            location: widget.location,
            profilePictureString: widget.profilePictureString),
        //Text(widget.username),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: !isLiked
                    ? const Icon(
                        Iconsax.heart,
                        size: 40,
                      )
                    : const Icon(
                        Iconsax.heart5,
                        color: Colors.red,
                        size: 40,
                      ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isStarred = !isStarred;
                    });
                  },
                  icon: !isStarred
                      ? const Icon(
                          Iconsax.star,
                          size: 40,
                        )
                      : const Icon(
                          Iconsax.star5,
                          color: Colors.blue,
                          size: 40,
                        )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.message, size: 40)),
              IconButton(
                  onPressed: () {}, icon: const Icon(Iconsax.send_2, size: 40)),
            ],
          ),
        ),
        const PostDetails(),
        const SizedBox(
          height: 20,
        )
      ],
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
          ])),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection(
      {super.key,
      required this.profilePictureString,
      required this.isLiked,
      required this.username,
      required this.location,
      required this.postImagePath});

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
                  image: AssetImage(postImagePath), fit: BoxFit.cover)),
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
                          ? Colors.red.withOpacity(0.9)
                          : Colors.black.withOpacity(0.8),
                      Colors.transparent
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            )),
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
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.shopping_cart5,
                      color: Colors.white,
                      size: 35,
                    ))
              ],
            ))
      ],
    );
  }
}
