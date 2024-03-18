import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rive/rive.dart';

class MainTransportScreen extends StatefulWidget {
  const MainTransportScreen({super.key});

  @override
  State<MainTransportScreen> createState() => _MainTransportScreenState();
}

class _MainTransportScreenState extends State<MainTransportScreen> {
  // late RiveAnimationController _btnAnimationController;
  // @override
  // void initState() {
  //   _btnAnimationController = OneShotAnimation('active', autoplay: false);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // return RiveTestOne(btnAnimationController: _btnAnimationController);
    return Container(
      color: Colors.deepPurpleAccent,
    );
  }
}

class RiveTestOne extends StatelessWidget {
  const RiveTestOne({
    super.key,
    required RiveAnimationController btnAnimationController,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const RiveAnimation.asset('assets/riv_assets/shapes.riv'),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const SizedBox(),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width * 1.7,
          bottom: 200,
          left: 100,
          child: Image.asset("assets/images/Spline.png"),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            child: const SizedBox(),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const SizedBox(
                  width: 260,
                  child: Column(
                    children: [
                      Text(
                        "Learn design & code",
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: "Poppins",
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
                GestureDetector(
                  onTap: () {
                    _btnAnimationController.isActive = true;
                  },
                  child: SizedBox(
                    height: 64,
                    width: 260,
                    child: Stack(
                      children: [
                        RiveAnimation.asset(
                          "assets/riv_assets/button.riv",
                          controllers: [_btnAnimationController],
                        ),
                        const Positioned.fill(
                          top: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Iconsax.arrow_circle_right5),
                              SizedBox(width: 8),
                              Text(
                                "Start the course",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
