import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LikeHeart extends StatelessWidget {
  const LikeHeart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Iconsax.heart5,
      color: Colors.red,
    );
  }
}
