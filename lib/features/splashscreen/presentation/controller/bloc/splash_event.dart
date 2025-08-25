part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class Appstarted extends SplashEvent{
  @override
  List<Object> get props=>[];

}
