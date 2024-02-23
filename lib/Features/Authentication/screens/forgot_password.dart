import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: const Icon(Iconsax.arrow_circle_left5)),
          title: const Text('Back'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          child: Form(
              child: Column(
            children: [
              const Text(
                'Forgot Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
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
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.magic_star),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.grey)),
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
                  onPressed: isLoading ? null : () {},
                  child: isLoading
                      ? const SpinKitChasingDots(
                          color: Colors.white,
                          size: 25,
                        )
                      : const Center(
                          child: Text(
                            'SEND LINK',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                ),
              ),
            ],
          )),
        ));
  }
}
