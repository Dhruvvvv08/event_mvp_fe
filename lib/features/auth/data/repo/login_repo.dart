import 'package:event_demo_mac/core/network/bases.dart';
import 'package:event_demo_mac/core/network/error_handling.dart';
import 'package:event_demo_mac/features/auth/data/models/email_login.dart';
import 'package:event_demo_mac/features/auth/data/models/login_model.dart';
import 'package:event_demo_mac/features/auth/data/models/verify_otp.dart';

class LoginRepo {
    Future<OnComplete<LoginApiResponse>> login(final String email,final String pasword) async {
    try {
      ApiResponse response = await apiRequest(
        request: postDataa(url: "auth/login", body: {"email": email,"password":pasword}),
      );

      if (response.success == true) {
        return OnComplete.success(LoginApiResponse.fromJson(response.result));
      } else {
        return OnComplete.error(response.message ?? "Service Not Available");
      }
    } catch (e) {
      return OnComplete.error(e.toString());
    }
  }

   Future<OnComplete<EmailOtpModel>> emaillogin(final String email) async {
    try {
      ApiResponse response = await apiRequest(
        request: postDataa(url: "auth/request-otp", body: {"email": email}),
      );

      if (response.success == true) {
        return OnComplete.success(EmailOtpModel.fromJson(response.result));
      } else {
        return OnComplete.error(response.message ?? "Service Not Available");
      }
    } catch (e) {
      return OnComplete.error(e.toString());
    }
  }
   Future<OnComplete<VerifyOtpModel>> verifyotp(final String otp,final String userid) async {
    try {
      ApiResponse response = await apiRequest(
        request: postDataa(url: "auth/verify-otp", body: {"userId":userid,"otp":otp}),
      );

      if (response.success == true) {
        return OnComplete.success(VerifyOtpModel.fromJson(response.result));
      } else {
        return OnComplete.error(response.message ?? "Service Not Available");
      }
    } catch (e) {
      return OnComplete.error(e.toString());
    }
  }
}