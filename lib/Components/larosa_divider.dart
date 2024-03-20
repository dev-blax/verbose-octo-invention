import 'package:flutter/material.dart';

class LarosaDivider extends StatelessWidget {
  const LarosaDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Flexible(
            child: Divider(
          color: Colors.white,
          thickness: 3,
          indent: 10,
          endIndent: 5,
        )),
        Text(
          'OR',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        Flexible(
            child: Divider(
          color: Colors.white,
          thickness: 3,
          indent: 5,
          endIndent: 10,
        )),
      ],
    );
  }
}
