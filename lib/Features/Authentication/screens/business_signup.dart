import 'package:flutter/material.dart';

class BusinessSignupScreen extends StatefulWidget {
  const BusinessSignupScreen({super.key});

  @override
  State<BusinessSignupScreen> createState() => _BusinessSignupScreenState();
}

class _BusinessSignupScreenState extends State<BusinessSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // top image and overlay
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/beautiful-dog.jpg'),
                          fit: BoxFit.cover)),
                ),
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
                              Colors.black.withOpacity(0.6),
                              Colors.transparent
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    )),
                const Positioned(
                    bottom: 10,
                    left: 10,
                    child: Center(
                      child: Text(
                        'New Business Account',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ))
              ],
            ),
          ),

          Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Business Name',
                    labelStyle: const TextStyle(color: Colors.black),
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                            width: 0, color: Colors.transparent))),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
