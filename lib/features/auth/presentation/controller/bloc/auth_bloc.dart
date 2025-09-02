import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_demo_mac/core/constants/shared_pref.dart';
import 'package:event_demo_mac/features/auth/data/models/email_login.dart';
import 'package:event_demo_mac/features/auth/data/models/verify_otp.dart';
import 'package:event_demo_mac/features/auth/data/repo/login_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginRepo loginrepo;

  AuthBloc({required this.loginrepo}) : super(AuthInitial()) {
    on<SendOtpEvent>((event, emit) async {
      emit(Otpsending());
      final res = await loginrepo.emaillogin(event.email);
      if (res.isSuccessed!) {
        emit(otpsended(emailOtpModel: res.data!));
        final userid= res.data?.userId;
        SharedPreferences sharedpref= await SharedPreferences.getInstance();
        final sucess= await sharedpref.setString(Prefrences.userId,userid.toString() );
        print(sucess);
      } else {
        emit(otpsendingerror());
      }
    });
    on<VerifyOtpEvent>((event, emit) async {
      emit(otpverifyloading());
      final res = await loginrepo.verifyotp(event.otp, event.userid);
      if (res.isSuccessed!) {
        emit(otpverified(res.data));
        final token=res.data?.token;
      SharedPref.prefs?.setString(Prefrences.token, token??"");
      print("Token saved to Shared Preferences: $token");

    final bool? isNewUser = res.data?.isNewUser;
    SharedPref.prefs?.setBool(Prefrences.isnewuser, isNewUser ?? false);
    print(isNewUser);
    


      } else {
        emit(
          otpverifyfailed(message: res.message ?? "OTP verification failed"),
        );
      }
    });
  }
}
