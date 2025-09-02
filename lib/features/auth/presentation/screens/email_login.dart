import 'package:event_demo_mac/core/constants/colors.dart';
import 'package:event_demo_mac/features/auth/presentation/controller/bloc/auth_bloc.dart';
import 'package:event_demo_mac/features/auth/presentation/screens/otp_screen.dart';
import 'package:event_demo_mac/features/auth/presentation/screens/verify_otp.dart';
import 'package:event_demo_mac/features/auth/presentation/widgets/Titledinputfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  bool isloading = false;
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is Otpsending) {
          isloading=true;
          // Show loading indicator or any other UI change when OTP is being sent
        
        } else
        if(state is otpsended){
           Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OtpVerify(email: emailController.text,)),
                );
          // Handle the state when OTP is sent successfully
        
        } else if (state is otpsendingerror) {
          // Handle the error state
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
          
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector
            
            (
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Illustration
                  // Center(
                  //   child: Image.asset(
                  //     "assets/login.png", // Add your illustration here
                  //     height: 200,
                  //   ),
                  // ),
                  const SizedBox(height: 30),

                  // Title
                  Text(
                    "Continue with email",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                    Text(
                    "sign in or sign up with your email",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Email Field

                  TitledInputField(
                    textEditingController:emailController,
                    title: "Email",
                    hintText: "Email Address",
                    backgroundColor: Color(0xff181a25),
                    fillColor:  Color(0xff181a25),
                    
                  ),
                  // Row(
                  //   children: [
                  //     SizedBox(height: 10),
                  //     Icon(Icons.email_outlined, color: Colors.grey),
                  //     const SizedBox(width: 8),
                  //     Expanded(
                  //       child: TextField(
                  //         controller:emailController ,
                  //         decoration: InputDecoration(
                  //           // prefixIcon: const Icon(Icons.email_outlined),
                  //           labelText: "Email ID",
                  //           labelStyle: TextStyle(color: Colors.grey),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 16),

                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: TextButton(
                  //     onPressed: () {},
                  //     child: const Text(
                  //       "Forgot Password?",
                  //       style: TextStyle(
                  //         color: Colors.blue,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                          context.read<AuthBloc>().add(
                                            SendOtpEvent(email: emailController.text),
                                          );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: 
                        emailController.text.isEmpty?
                        Color(0XFF657083):Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: 
                     isloading==true? Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Center(child: CircularProgressIndicator(color: Colors.white,)),
                     ):
                      const Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // OR Divider
                  // Row(
                  //   children: const [
                  //     Expanded(child: Divider()),
                  //     Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 8),
                  //       child: Text("OR"),
                  //     ),
                  //     Expanded(child: Divider()),
                  //   ],
                  // ),
                  // const SizedBox(height: 20),

                  // // Google Login
                  // SizedBox(
                  //   width: double.infinity,
                  //   height: 50,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: AppColors.kf1f6f7,
                  //       border: Border.all(color: Colors.grey, width: 1),
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //     child: Row(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           "Login with Google",
                  //           style: TextStyle(
                  //             color: Colors.grey,
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                    //   child: OutlinedButton.icon(

                    //     onPressed: () {},
                    // //    icon: Image.asset("assets/google.png", height: 24), // Add Google logo in assets
                    //     label: const Text("Login with Google"),
                    //     style: OutlinedButton.styleFrom(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(12),
                    //       ),
                    //     ),
                    //   ),
              //    ),
                  const SizedBox(height: 30),

                  // Register link
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Text("New to Eventify? "),
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: const Text(
                  //         "Register",
                  //         style: TextStyle(
                  //           color: Colors.blue,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
