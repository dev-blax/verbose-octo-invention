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
      body: const Column(
        children: [Expanded(child: ChatWidget()), ChatInput()],
      ),
    );
  }
}

class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController chatInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(.30)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: chatInputController,
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Implement sending message functionality here
              print('Sending message: ${chatInputController.text}');
              chatInputController.clear();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    chatInputController.dispose();
    super.dispose();
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 40,
        itemBuilder: (BuildContext context, int index) {
          String message = "this is message $index";
          bool isSentByMe = index % 2 == 0;
          return ChatBubble(message: message, isSentByMe: isSentByMe);
        });
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;
  const ChatBubble(
      {super.key, required this.message, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: isSentByMe ? Colors.blue : Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          message,
          style: TextStyle(color: isSentByMe ? Colors.white : Colors.black),
        ),
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

class StatusSpace extends StatelessWidget {
  const StatusSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          StatusCard(),
          StatusCard(),
          StatusCard(),
          StatusCard(),
          StatusCard(),
          StatusCard(),
          StatusCard(),
        ],
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 100.0, // Adjust this according to your design
      height: 150.0, // Adjust this according to your design
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Center(
        child: Text(
          'Status',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
