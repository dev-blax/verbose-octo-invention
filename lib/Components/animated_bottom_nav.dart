import 'package:explore_larosa_mobile/Models/nav_item_model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

const Color bottomNavBgColor = Color(0xff17203a);

class AnimatedBottomNav extends StatefulWidget {
  const AnimatedBottomNav({super.key});

  @override
  State<AnimatedBottomNav> createState() => _AnimatedBottomNavState();
}

class _AnimatedBottomNavState extends State<AnimatedBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
          color: bottomNavBgColor.withOpacity(.8),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: bottomNavBgColor.withOpacity(.3),
              offset: const Offset(0, 20),
              blurRadius: 20,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          bottomNavItems.length,
          (index) => SizedBox(
            height: 36,
            width: 36,
            child: RiveAnimation.asset(
              bottomNavItems[index].rive.src,
              artboard: bottomNavItems[index].rive.artboard,
            ),
          ),
        ),
      ),
    );
  }
}
