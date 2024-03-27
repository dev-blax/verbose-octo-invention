import 'dart:typed_data';

import 'package:explore_larosa_mobile/Components/gradient_button.dart';
import 'package:explore_larosa_mobile/Features/Feeds/controllers/files_controller.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class NewStringScreen extends StatefulWidget {
  const NewStringScreen({super.key});

  @override
  State<NewStringScreen> createState() => _NewStringScreenState();
}

class _NewStringScreenState extends State<NewStringScreen> {
  final List<Uint8List> _files = [];
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Media Selection
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            ),

            // Caption
            Padding(
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
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            // location
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.3),
                  prefixIcon: const Icon(Iconsax.location),
                  hintText: 'Location',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            // business
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.3),
                  prefixIcon: const Icon(Iconsax.shop),
                  hintText: 'Business Brand',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),

            // Submit Button
            Container(
              decoration: const BoxDecoration(
                gradient: LarosaColors.blueGradient,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                child: const Text(
                  'Upload New Post',
                  style: TextStyle(
                    color: LarosaColors.light,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _removeFile(int index) {
    setState(() {
      _files.removeAt(index);
    });
  }
}
