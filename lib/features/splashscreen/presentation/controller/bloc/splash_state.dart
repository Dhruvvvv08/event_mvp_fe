part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
  
  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}
final class Splashloading extends SplashState {}
final class Splashloaded extends SplashState {}

