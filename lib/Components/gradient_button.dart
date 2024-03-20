import 'package:explore_larosa_mobile/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String textString;
  const GradientButton({super.key, required this.textString});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LarosaColors.blueGradient,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        onPressed: () {},
        child: Text(
          textString,
          style: const TextStyle(
            color: LarosaColors.light,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
