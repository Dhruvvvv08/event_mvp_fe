import 'package:flutter/material.dart';


class OtpBoxScreen extends StatefulWidget {
  const OtpBoxScreen({super.key});

  @override
  State<OtpBoxScreen> createState() => _OtpBoxScreenState();
}

class _OtpBoxScreenState extends State<OtpBoxScreen> {


  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> textControllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (final node in focusNodes) {
      node.dispose();
    }
    for (final ctrl in textControllers) {
      ctrl.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  void _verifyOtp() {
    final otp = textControllers.map((c) => c.text).join();
    if (otp.length == 4) {
     // controller.verifyOtp(otp); // Your controller logic
    } else {
      //Get.snackbar("Invalid", "Please enter a 4-digit OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Enter the 4-digit code sent to your email",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF666666),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 55,
                        child: TextField(
                          controller: textControllers[index],
                          focusNode: focusNodes[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: const Color(0xFFF1F1F1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (value) => _onOtpChanged(value, index),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _verifyOtp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF667eea),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Verify OTP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                   //   controller.resendOtp();
                    },
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                        color: Color(0xFF764ba2),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
