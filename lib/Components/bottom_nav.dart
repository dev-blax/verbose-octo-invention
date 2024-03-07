import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(destinations: const [
      NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
      NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
      NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
      NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
    ]);
  }
}
