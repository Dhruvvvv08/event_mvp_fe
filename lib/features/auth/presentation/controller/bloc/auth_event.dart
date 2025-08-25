part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SendOtpEvent extends AuthEvent{
  final String email;
   const SendOtpEvent({required this.email});

   @override
   List<Object>get props=>[email];
}
class VerifyOtpEvent extends AuthEvent{
  final String userid;
  final String otp;
  const VerifyOtpEvent({required this.userid, required this.otp});
  @override
  List<Object> get props => [userid, otp];
}