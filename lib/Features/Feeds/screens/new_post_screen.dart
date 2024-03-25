import 'dart:convert';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:explore_larosa_mobile/Models/user.dart';
import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:http/http.dart' as http;

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final List<String> tags = ['Vacation', 'Hotels', 'Burger'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: [
          // New Post Button and Image
          const SelectedMediaSection(),

          // Description
          const DescriptionSection(),

          // Searchable Dropdown (if applicable)

          // Tags
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TagItemsPage(tags: tags),
          ),

          // Location

          // Related Business
        ],
      ),
    );
  }
}

class TagItemsPage extends StatefulWidget {
  final List<String> tags;

  const TagItemsPage({super.key, required this.tags});

  @override
  State<TagItemsPage> createState() => _TagItemsPageState();
}

class _TagItemsPageState extends State<TagItemsPage> {
  String currentText = '';
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    AutoCompleteTextField<String> textField = AutoCompleteTextField<String>(
      key: key,
      decoration: const InputDecoration(
        hintText: 'Add Tag',
        suffixIcon: Icon(Icons.add),
      ),
      controller: TextEditingController(text: currentText),
      suggestions: suggestions,
      clearOnSubmit: true,
      itemSubmitted: (text) {
        setState(() {
          if (text.isNotEmpty) {
            widget.tags.add(text);
            currentText = '';
          }
        });
      },
      itemFilter: (item, query) {
        return item.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemBuilder: (context, item) {
        return ListTile(
          title: Text(item),
        );
      },
    );

    Column body = Column(
      children: [
        ListTile(
          title: textField,
        ),
      ],
    );

    body.children.addAll(widget.tags.map((tag) {
      return ListTile(
        title: Text(tag),
        trailing: IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              widget.tags.remove(tag);
            });
          },
        ),
      );
    }));

    return body;
  }

  List<String> suggestions = [
    "Vacation",
    "Hotels",
    "Burger",
    "Travel",
    "Food",
    "Beach",
    "Adventure",
    "Shopping",
    "Nature",
    "City",
    "Exploration",
    "Culture",
    "Family",
    "Friends",
  ];
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
          hintText: 'Enter your text here...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ), // Border around the input field
        ),
      ),
    );
  }
}

class SelectedMediaSection extends StatelessWidget {
  const SelectedMediaSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/milk7.jpg',
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
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
            onPressed: () {},
            icon: const Icon(
              Iconsax.add,
              size: 40,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class TagItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const TagItem({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: LarosaColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              SvgIconsPaths.crossCircle,
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                Colors.red,
                BlendMode.srcIn,
              ),
              semanticsLabel: 'Like icon',
            ),
          ),
        ],
      ),
    );
  }
}
