import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final List<String> tags = ['Vacation', 'Hotels', 'Burger'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: [
          // New Post Button and Image
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/milk7.jpg',
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LarosaColors.blueGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.add,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),

          // Description
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              minLines: 3,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Enter your text here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ), // Border around the input field
              ),
            ),
          ),

          // Tags
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: tags
                  .map(
                    (tag) => TagItem(
                      text: tag,
                      onPressed: () {
                        setState(() {
                          tags.remove(tag);
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),

          // Location

          // Related Business
        ],
      ),
    );
  }
}

class TagItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const TagItem({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: LarosaColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              SvgIconsPaths.crossCircle,
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                Colors.red,
                BlendMode.srcIn,
              ),
              semanticsLabel: 'Like icon',
            ),
          ),
        ],
      ),
    );
  }
}
