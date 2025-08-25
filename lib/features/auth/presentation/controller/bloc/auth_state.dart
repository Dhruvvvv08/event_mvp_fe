part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class Otpsending extends AuthState {}

final class otpsended extends AuthState {
  final EmailOtpModel emailOtpModel;
  const otpsended({required this.emailOtpModel});
  @override
  List<Object> get props => [emailOtpModel];
}

final class otpsendingerror extends AuthState {
  final String error;
  const otpsendingerror({this.error = "An error occurred while sending OTP"});
  @override
  List<Object> get props => [error];
}

final class otpverifyloading extends AuthState {}

final class otpverified extends AuthState {
  final VerifyOtpModel? verifyotpmodel;
  otpverified(this.verifyotpmodel);

  @override
  List<Object> get props => [verifyotpmodel!];
}

final class otpverifyfailed extends AuthState {
  final String message;
  const otpverifyfailed({this.message = "OTP verification failed"});

  @override
  List<Object> get props => [message];
}
