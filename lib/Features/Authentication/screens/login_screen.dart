import 'dart:ui';
import 'package:explore_larosa_mobile/Features/Authentication/screens/forgot_password.dart';
import 'package:explore_larosa_mobile/Features/Authentication/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconsax/iconsax.dart';

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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.asset(
                                              'assets/icons/icons8-google-48.png'),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.asset(
                                              'assets/icons/icons8-tiktok-48.png'),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.asset(
                                              'assets/icons/icons8-facebook-48.png'),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Image.asset(
                                              'assets/icons/icons8-instagram-48.png'),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),

                                    // Divider
                                    const Row(
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Flexible(
                                            child: Divider(
                                          color: Colors.white,
                                          thickness: 3,
                                          indent: 5,
                                          endIndent: 10,
                                        )),
                                      ],
                                    ),
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
                                    TextFormField(
                                      controller: usernamController,
                                      validator: (value) {
                                        if (value != null && value.isEmpty) {
                                          return 'Please enter your Username';
                                        }
                                        return null;
                                      },
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: const Icon(
                                          Iconsax.user_square,
                                          color: Colors.grey,
                                        ),
                                        hintText: 'Username',
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

                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: RichText(
                                            text: TextSpan(
                                                text: 'Forgot Password',
                                                style: const TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Colors.blue),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // to register
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const ForgotPassword()));
                                                      }))),

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
                                              end: Alignment.bottomRight),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
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
                                            : () => submitForm(),
                                        child: isLoading
                                            ? const SpinKitChasingDots(
                                                color: Colors.white,
                                                size: 25,
                                              )
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
                                                              const SignupScreen()));
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

      await Future.delayed(const Duration(seconds: 5));

      setState(() {
        isLoading = false;
      });

      print('success');
    }
  }
}
