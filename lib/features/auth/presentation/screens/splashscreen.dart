
import 'package:event_demo_mac/features/auth/presentation/controller/splash_controller.dart';
import 'package:event_demo_mac/features/auth/presentation/widgets/animated_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AnimatedLogo(),
                    const SizedBox(height: 20),
                    const Text(
                      "EventLancer",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Connecting Events with Talent",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    Obx(() {
                      return Container(
                        width: 250,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: controller.progress.value,
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "Loading your event experience...",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
