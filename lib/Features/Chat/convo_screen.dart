import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ConvoScreen extends StatefulWidget {
  const ConvoScreen({super.key});

  @override
  State<ConvoScreen> createState() => _ConvoScreenState();
}

class _ConvoScreenState extends State<ConvoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ConvoTopBar(),
      ),
    );
  }
}

class ConvoTopBar extends StatelessWidget {
  const ConvoTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/portrait1.jpg',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Halsey',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Iconsax.verify5,
                      color: Colors.blue,
                    )
                  ],
                ),
                Text(
                  'Online',
                  style: TextStyle(color: LarosaColors.primary),
                )
              ],
            )
          ],
        ),
        const Row(
          children: [
            Icon(
              Iconsax.call5,
              size: 40,
            ),
            SizedBox(
              width: 18,
            ),
            Icon(
              Iconsax.camera5,
              size: 40,
            )
          ],
        )
      ],
    );
  }
}
