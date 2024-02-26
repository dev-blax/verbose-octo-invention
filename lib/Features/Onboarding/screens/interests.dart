import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  List<String> dropdownItems = ['Tanzania', 'Kenya', 'Uganda', 'Rwanda'];
  String selectedValue = 'Tanzania';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                children: [Icon(Iconsax.arrow_circle_left5), Text('GO BACK')],
              ),
            ),

            // Country
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Country of Origin',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Countries
                DropdownButtonFormField<String>(
                  value: selectedValue,
                  items: dropdownItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.blueGrey),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    //suffixIcon: const Icon(Iconsax.arrow_circle_down)
                  ),
                ),
              ],
            ),

            // Interests LIst
            const SizedBox(
              height: 20,
            ),
            const Text('something here')
          ],
        ),
      ),
    );
  }
}
