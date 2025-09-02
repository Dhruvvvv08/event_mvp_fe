import 'package:event_demo_mac/features/auth/presentation/screens/email_login.dart';
import 'package:event_demo_mac/features/intro/presentation/widgets/images.dart';
import 'package:event_demo_mac/features/intro/presentation/widgets/photogrid.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Dark background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Images Section
                Column(
                  children: [
                    Container(
                      color: Colors.white, //same dark background
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 32,
                      ),
                      child: const Center(child: AsymmetricPhotoCollage()),
                    ),
                    const SizedBox(height: 30),

                    // Title
                    Container(
                      //  color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Get started",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Subtitle
                          const Text(
                            "Register for events and create images of the activities you plan to attend.",
                            //  textAlign: TextAlign.,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),

                // Buttons Section
                Column(
                  children: [
                    // Google Sign Up
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.network(
                        "https://img.icons8.com/color/48/000000/google-logo.png",
                        height: 20,
                      ),
                      label: const Text(
                        "Sign up with Google",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[900],
                        foregroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Email Sign Up
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        EmailLogin(),
                        ));
                      },
                      icon: const Icon(Icons.email_outlined),
                      label: const Text("Sign up with email"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[900],
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Phone Sign Up
                    // ElevatedButton.icon(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.phone_android_outlined),
                    //   label: const Text("Sign up with phone number"),
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.grey[900],
                    //     foregroundColor: Colors.white,
                    //     minimumSize: const Size(double.infinity, 50),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 15),
                    Text(
                      "Already have an account? Log in",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
