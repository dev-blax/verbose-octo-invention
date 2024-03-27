import 'dart:convert';

import 'package:explore_larosa_mobile/Components/spiner.dart';
import 'package:explore_larosa_mobile/utils/constants/links.dart';
import 'package:explore_larosa_mobile/utils/constants/svg_icons_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Iconsax.arrow_circle_left,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                const Text(
                  'Please enter your email, we will send you a link to create a new password',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),

                const SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // Sign in button
                Container(
                  height: 65,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xff34a4f9), Color(0xff0a1282)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        backgroundColor: Colors.transparent),
                    onPressed: isLoading
                        ? null
                        : () {
                            handleForgotPassword();
                          },
                    child: isLoading
                        ? const Spinner()
                        : const Center(
                            child: Text(
                              'SEND LINK',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          )),
        ));
  }

  void handleForgotPassword() async {
    if (emailController.text == '') return;

    try {
      setState(() {
        isLoading = true;
      });

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*"
      };

      print('sending forgot req');

      var uri = Uri.http(LarosaLinks.baseurl, LarosaLinks.forgetPassword);

      var response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(
          {
            "email": emailController.text,
          },
        ),
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          'Explore Larosa',
          'success',
        );
      } else {
        Get.snackbar(
          'Explore Larosa',
          'non 200 code',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Explore Larosa',
        'An error occured. Please try again later',
      );
    }
  }
}
