import 'dart:typed_data';
import 'package:explore_larosa_mobile/Features/Feeds/controllers/files_controller.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final List<String> tags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Iconsax.arrow_circle_left,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // New Post Button and Image
            SelectedMediaSection(),

            // Description
            DescriptionSection(),
          ],
        ),
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        minLines: 3,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: 'Caption here...',
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10),
          ), // Border around the input field
        ),
      ),
    );
  }
}

class SelectedMediaSection extends StatefulWidget {
  const SelectedMediaSection({
    super.key,
  });

  @override
  State<SelectedMediaSection> createState() => _SelectedMediaSectionState();
}

class _SelectedMediaSectionState extends State<SelectedMediaSection> {
  final List<Uint8List> _files = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _files.asMap().entries.map(
                (entry) {
                  final int index = entry.key;
                  final Uint8List file = entry.value;
                  return Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(file),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            _removeFile(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
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
              onPressed: () async {
                Uint8List? file = await pickImage(ImageSource.gallery);
                if (file != null) {
                  setState(() {
                    _files.add(file);
                  });
                }
              },
              icon: const Icon(
                Iconsax.add,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _removeFile(int index) {
    setState(() {
      _files.removeAt(index);
    });
  }
}
