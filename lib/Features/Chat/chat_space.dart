import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatSpace extends StatefulWidget {
  const ChatSpace({super.key});

  @override
  State<ChatSpace> createState() => _ChatSpaceState();
}

class _ChatSpaceState extends State<ChatSpace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.arrow_left_2),
        ),
        title: const Text('Chat Space'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          ChatCard(
            lastText: 'Check me soon, I will handle it',
            name: 'Halsey',
            imagePath: 'assets/images/portrait1.jpg',
          ),
          ChatCard(
            lastText: 'Hi James, am gonna',
            name: 'Selena Gomez',
            imagePath: 'assets/images/portrait2.jpg',
          )
        ],
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String lastText;

  const ChatCard(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.lastText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  imagePath,
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              name,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(
                              Iconsax.verify5,
                              color: LarosaColors.primary,
                            )
                          ],
                        ),
                        const Text('05 Jan')
                      ],
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    // Last Message
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lastText,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.grey),
                        ),
                        Center(
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: LarosaColors.primary, // Background color
                            ),
                            child: const Center(
                              child: Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
