import 'dart:io';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  File? image;
  void GetImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void GetImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
        centerTitle: true,
        leading: const Icon(
          Iconsax.arrow_circle_left5,
          color: LarosaColors.primary,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            image == null
                ? Column(
                    children: [
                      MaterialButton(
                        color: LarosaColors.primaryBackground,
                        onPressed: GetImageFromGallery,
                        child: const Text(
                          'Pick image from Gallery',
                        ),
                      ),
                      MaterialButton(
                        color: LarosaColors.primaryBackground,
                        onPressed: GetImageFromCamera,
                        child: const Text('pick from camera'),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 400,
                              child: Image.file(
                                File(image!.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Text('Cathy Madrid'),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            clipBehavior: Clip.hardEdge,
                            // decoration: const InputDecoration(
                            //     // border: OutlineInputBorder(
                            //     //     borderRadius: BorderRadius.circular(20)),
                            //     hintText: 'Description',
                            //     focusedBorder: OutlineInputBorder(
                            //         borderSide:
                            //             BorderSide(color: Colors.transparent)),
                            //     enabledBorder: OutlineInputBorder(
                            //         borderSide:
                            //             BorderSide(color: Colors.transparent)),
                            //     filled: true,
                            //     fillColor: LarosaColors.primaryBackground
                            //     ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                filled: true,
                                fillColor: LarosaColors.primaryBackground),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            clipBehavior: Clip.hardEdge,
                            decoration: InputDecoration(
                                icon: const Icon(Iconsax.edit),
                                hintText: 'Decoration',
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                filled: true,
                                fillColor: LarosaColors.primary),
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
