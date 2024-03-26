import 'dart:convert';
import 'dart:ui';
import 'package:explore_larosa_mobile/Components/larosa_divider.dart';
import 'package:explore_larosa_mobile/Components/oauth_buttons.dart';
import 'package:explore_larosa_mobile/Components/spiner.dart';
import 'package:explore_larosa_mobile/Features/Authentication/screens/forgot_password.dart';
import 'package:explore_larosa_mobile/Features/Authentication/screens/signup_screen.dart';
import 'package:explore_larosa_mobile/Features/Onboarding/screens/account_type.dart';
import 'package:explore_larosa_mobile/lasora_core.dart';
import 'package:explore_larosa_mobile/utils/constants/links.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernamController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/ladyInBlack.jpg'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

                        // Form starts here
                        child: Column(
                          children: [
                            Form(
                              key: formKey,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white.withOpacity(0.7),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 40),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Center(
                                      child: Text(
                                        'Sign in to Explore Larosa',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceAround,
                                    //   children: [
                                    //     Container(
                                    //       padding: const EdgeInsets.all(5),
                                    //       decoration: BoxDecoration(
                                    //           color: Colors.white,
                                    //           borderRadius:
                                    //               BorderRadius.circular(10)),
                                    //       child: Image.asset(
                                    //           'assets/icons/icons8-google-48.png'),
                                    //     ),
                                    //     Container(
                                    //       padding: const EdgeInsets.all(5),
                                    //       decoration: BoxDecoration(
                                    //           color: Colors.white,
                                    //           borderRadius:
                                    //               BorderRadius.circular(10)),
                                    //       child: Image.asset(
                                    //           'assets/icons/icons8-tiktok-48.png'),
                                    //     ),
                                    //     Container(
                                    //       padding: const EdgeInsets.all(5),
                                    //       decoration: BoxDecoration(
                                    //           color: Colors.white,
                                    //           borderRadius:
                                    //               BorderRadius.circular(10)),
                                    //       child: Image.asset(
                                    //           'assets/icons/icons8-facebook-48.png'),
                                    //     ),
                                    //     Container(
                                    //       padding: const EdgeInsets.all(5),
                                    //       decoration: BoxDecoration(
                                    //           color: Colors.white,
                                    //           borderRadius:
                                    //               BorderRadius.circular(10)),
                                    //       child: Image.asset(
                                    //           'assets/icons/icons8-instagram-48.png'),
                                    //     ),
                                    //   ],
                                    // ),

                                    const OauthButtons(),

                                    const SizedBox(
                                      height: 20,
                                    ),

                                    // Divider
                                    const LarosaDivider(),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Sign in with Email and Password',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),

                                    // Username Input
                                    UsernameInput(
                                        usernamController: usernamController),
                                    const SizedBox(
                                      height: 20,
                                    ),

                                    // Password Input
                                    TextFormField(
                                      controller: passwordController,
                                      obscureText: true,
                                      validator: (value) {
                                        if (value != null && value.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: const Icon(
                                          Iconsax.key5,
                                          color: Colors.grey,
                                        ),
                                        hintText: 'Password',
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: const BorderSide(
                                                width: 0.0,
                                                color: Colors.transparent)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    // forgot password
                                    const ForgotPassword(),

                                    const SizedBox(
                                      height: 20,
                                    ),

                                    // Sign in button
                                    Container(
                                      height: 65,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xff34a4f9),
                                            Color(0xff0a1282)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.transparent,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: const EdgeInsets.all(16.0),
                                            backgroundColor:
                                                Colors.transparent),
                                        onPressed: isLoading
                                            ? null
                                            : () {
                                                //Get.to(const Core());
                                                submitForm();
                                              },
                                        child: isLoading
                                            ? const Spinner()
                                            : const Center(
                                                child: Text(
                                                  'LOGIN',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                              ),
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 16,
                                    ),

                                    RichText(
                                        text: TextSpan(
                                            text: 'Dont have an account? ',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: 'Register now',
                                              style: const TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.blue),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  // to register
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AccountType(),
                                                    ),
                                                  );
                                                })
                                        ]))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void submitForm() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      // show loading
      setState(() {
        isLoading = true;
      });

      //
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Access-Control-Allow-Origin": "*"
      };

      Map<String, dynamic> bodyContent = {
        "username": usernamController.text,
        "password": passwordController.text,
      };

      try {
        print('sending login req');
        var uri = Uri.http(LarosaLinks.baseurl, LarosaLinks.loginEndpoint);

        var response = await http.post(uri,
            headers: headers, body: jsonEncode(bodyContent));

        if (response.statusCode == 200) {
          Get.snackbar('Explore Larosa', 'Successful Login');
          Get.offAll(const LarosaCore());
        }
        print(response.body);
      } catch (e) {
        print('error $e');
      }

      setState(() {
        isLoading = false;
      });
    }
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        text: TextSpan(
          text: 'Forgot Password',
          style: const TextStyle(
              decoration: TextDecoration.underline, color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // to register
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPassword()));
            },
        ),
      ),
    );
  }
}

class UsernameInput extends StatelessWidget {
  const UsernameInput({
    super.key,
    required this.usernamController,
  });

  final TextEditingController usernamController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernamController,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Please enter your Username';
        }
        return null;
      },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(
          Iconsax.user_square,
          color: Colors.grey,
        ),
        hintText: 'Username',
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide:
                const BorderSide(width: 0.0, color: Colors.transparent)),
      ),
    );
  }
}
