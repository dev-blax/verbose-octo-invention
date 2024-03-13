import 'package:flutter/material.dart';

class OauthButtons extends StatelessWidget {
  const OauthButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Image.asset('assets/icons/icons8-google-48.png'),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Image.asset('assets/icons/icons8-tiktok-48.png'),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Image.asset('assets/icons/icons8-facebook-48.png'),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Image.asset('assets/icons/icons8-instagram-48.png'),
        ),
      ],
    );
  }
}
