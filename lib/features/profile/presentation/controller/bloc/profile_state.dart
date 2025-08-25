part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}
final class Profileupdateloading extends ProfileState {}
final class Profileupdatesuccess extends ProfileState {}
final class Profileupdateerror extends ProfileState {
  final String message;
  const Profileupdateerror(this.message);
   @override
  List<Object> get props => [message];
}

