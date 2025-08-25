import 'package:event_demo_mac/core/constants/colors.dart';
import 'package:event_demo_mac/core/constants/shared_pref.dart';
import 'package:event_demo_mac/features/auth/presentation/controller/bloc/auth_bloc.dart';
import 'package:event_demo_mac/features/profile/presentation/screens/profile_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpVerify extends StatefulWidget {
  final String email;
  const OtpVerify({super.key, required this.email});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  final TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is otpverifyloading) {
              Center(child: CircularProgressIndicator());

            } else if (state is otpverified) {
              print("OTP verified successfully");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileInfo()));
              // );
            } else if (state is otpverifyfailed) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
             final userid =SharedPref.prefs?.getString(Prefrences.userId);
                          print("User ID from Shared Preferences: $userid");

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 16),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //  Image.asset(
                    //     'assets/images/updatedLogo.png',
                    //     height: 300,
                    //   ),
                    SizedBox(height: 30),
                    Text(
                      "Welcome to Eventify",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Text(
                    //   "Log in or create an account to access your wellness benefits.",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.w500,
                    //     color: Color(0xff1C0D0D),
                    //   ),
                    // ),
                    SizedBox(height: 50),
                
                    //  Text(
                    //   "Enter the OTP sent to your email: ${widget.email}",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.w500,
                    //     color: Color(0xff1C0D0D),
                    //   ),
                    // ),
                    Center(
                      child: Pinput(
                        controller: otpcontroller,
                        length: 6,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                          width: 50,
                          height: 56,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 50,
                          height: 56,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onCompleted: (pin) {
                          context.read<AuthBloc>().add(VerifyOtpEvent(userid: "${userid}", otp: otpcontroller.text));
                           //  context.read<AuthBloc>().add(VerifyOtpEvent(widget.email, pin));
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.k0165ff,
                          ),
                        ),
                        onPressed: () {
                          final userid =SharedPref.prefs?.getString(Prefrences.userId);
                          print("User ID from Shared Preferences: $userid");
                          // Trigger OTP verification
                          final otp =
                              otpcontroller
                                  .text; // Get the OTP from the input field
                
                                  context.read<AuthBloc>().add(VerifyOtpEvent(userid: userid.toString(), otp: otp));
                          //   context.read<AuthBloc>().add(VerifyOtpEvent(widget.email, otp));
                        },
                        child: const Text(
                          "Verify OTP",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
