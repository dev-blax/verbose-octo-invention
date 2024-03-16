import 'dart:convert';

import 'package:explore_larosa_mobile/Components/oauth_buttons.dart';
import 'package:explore_larosa_mobile/Features/Authentication/screens/login_screen.dart';
import 'package:explore_larosa_mobile/core.dart';
import 'package:explore_larosa_mobile/utils/constants/links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernamController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  bool isLoading = false;

  List<String> dropdownItems = ['Tanzania', 'Kenya', 'Uganda', 'Rwanda'];
  String selectedValue = 'Tanzania';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/dog-and-flower.jpg'),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    top: 50,
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
                                            color:
                                                Colors.white.withOpacity(0.7),
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
                                              'SIGN UP TO EXPLORE LAROSA',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const OauthButtons(),

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
                                            'Sign up with Email and Password',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),

                                          // Countries
                                          DropdownButtonFormField<String>(
                                            value: selectedValue,
                                            items: dropdownItems
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: const TextStyle(
                                                      color: Colors.blueGrey),
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon:
                                                  const Icon(Iconsax.flag),
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 20,
                                          ),

                                          // name input
                                          TextFormField(
                                            controller: nameController,
                                            validator: (value) {
                                              if (value != null &&
                                                  value.isEmpty) {
                                                return 'Please enter your Name';
                                              }
                                              return null;
                                            },
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon: const Icon(
                                                Iconsax.user_square,
                                                color: Colors.grey,
                                              ),
                                              hintText: 'Name',
                                              hintStyle: const TextStyle(
                                                  color: Colors.grey),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  borderSide: const BorderSide(
                                                      width: 0.0,
                                                      color:
                                                          Colors.transparent)),
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 20,
                                          ),

                                          // email Input
                                          TextFormField(
                                            controller: emailController,
                                            validator: (value) {
                                              if (value != null &&
                                                  value.isEmpty) {
                                                return 'Please enter your Email';
                                              } else if (value != null &&
                                                  !isValidEmail(value)) {
                                                return 'Please Enter a valid email';
                                              }
                                              return null;
                                            },
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon: const Icon(
                                                Iconsax.direct_inbox,
                                                color: Colors.grey,
                                              ),
                                              hintText: 'Email',
                                              hintStyle: const TextStyle(
                                                  color: Colors.grey),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  borderSide: const BorderSide(
                                                      width: 0.0,
                                                      color:
                                                          Colors.transparent)),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),

                                          // Username Input
                                          TextFormField(
                                            controller: usernamController,
                                            validator: (value) {
                                              if (value != null &&
                                                  value.isEmpty) {
                                                return 'Please enter your Username';
                                              }
                                              return null;
                                            },
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon: const Icon(
                                                Iconsax.user_square,
                                                color: Colors.grey,
                                              ),
                                              hintText: 'Username',
                                              hintStyle: const TextStyle(
                                                  color: Colors.grey),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  borderSide: const BorderSide(
                                                      width: 0.0,
                                                      color:
                                                          Colors.transparent)),
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
                                              if (value != null &&
                                                  value.isEmpty) {
                                                return 'Please enter your password';
                                              }
                                              return null;
                                            },
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon: const Icon(
                                                Iconsax.key5,
                                                color: Colors.grey,
                                              ),
                                              hintText: 'Password',
                                              hintStyle: const TextStyle(
                                                  color: Colors.grey),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  borderSide: const BorderSide(
                                                      width: 0.0,
                                                      color:
                                                          Colors.transparent)),
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 10,
                                          ),

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
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  backgroundColor:
                                                      Colors.transparent),
                                              onPressed: isLoading
                                                  ? null
                                                  : () => submitForm(),
                                              child: isLoading
                                                  ? const SpinKitWave(
                                                      color: Colors.white,
                                                      size: 25,
                                                    )
                                                  : const Center(
                                                      child: Text(
                                                        'REGISTER NOW',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 16,
                                          ),

                                          // To login
                                          RichText(
                                              text: TextSpan(
                                                  text:
                                                      'Already have an account? ',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                  children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Go to Login',
                                                    style: const TextStyle(
                                                        decoration:
                                                            TextDecoration
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
                                                                            const LoginScreen()));
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
          ),
        ],
      ),
    );
  }

  void submitForm() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> headers = {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      };
      // var headers = {
      //   'Content-Type': 'application/json',
      //   "Access-Control-Allow-Origin": "*"
      // };

      Map<String, dynamic> bodyContent = {
        "accountTypeId": 1,
        "username": usernamController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "name": nameController.text
      };

      try {
        print('sending reg request ');
        var uri = Uri.http(
          LarosaLinks.baseurl,
          LarosaLinks.registrationEndpoint,
        );
        var response = await http.post(uri,
            headers: headers, body: json.encode(bodyContent));

        if (response.statusCode == 201) {
          //print('success');
          Get.to(const Core());
          // print('response ${response.body}');
        } else {
          print(
              'got a ${response.statusCode} status response: ${response.body} ');
        }
      } catch (e) {
        //print('request failed');
        throw Exception(e);
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
