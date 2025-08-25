import 'package:event_demo_mac/features/splashscreen/presentation/controller/bloc/splash_bloc.dart';
import 'package:event_demo_mac/features/auth/presentation/screens/email_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   context.read<SplashBloc>().add(Appstarted());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is Splashloaded) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => EmailLogin()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                 height: 200, 
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Event Hub",
                  style: TextStyle(
                    color: Color(0xff1C0D0D),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10), // keep or remove as you wish

              const Text(
                "Connecting Events with Talent",
                style: TextStyle(
                  color: Color(0xff1C0D0D),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),

              // ↓ This chunk centres the logo without a SizedBox
            ],
          ),
        ),
      ),
    );
  }
}
