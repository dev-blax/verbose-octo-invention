import 'package:explore_larosa_mobile/Features/Onboarding/controllers/account_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AccountType extends StatefulWidget {
  const AccountType({super.key});

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/lady-nice-hair.jpg'),
              fit: BoxFit.cover,
            )),
          ),

          // black wall
          Positioned(
              bottom: 0,
              left: 0,
              top: 0,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              )),

          Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  // AccountTypeController.instance.toSignIn();
                  Get.put(AccountTypeController.instance.toSignIn());
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SIGN IN',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Iconsax.arrow_circle_right,
                      color: Colors.white,
                    )
                  ],
                ),
              )),

          Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elevate Every Moment:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Social Meets Culinary Discovery',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // Divider
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Flexible(
                            child: Divider(
                          color: Colors.white,
                          thickness: 2,
                          indent: 5,
                          endIndent: 10,
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xff34a4f9), Color(0xff0a1282)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(50)),
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: Colors.transparent),
                      onPressed: () {
                        AccountTypeController.instance.toBusinessRegistration();
                      },
                      child: const Text(
                        'Business Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.black, Colors.black],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(50)),
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: Colors.transparent),
                      onPressed: () {
                        AccountTypeController.instance.toPersonalRegistration();
                      },
                      child: const Text(
                        'Personal Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
