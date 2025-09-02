part of 'addevent_bloc.dart';

abstract class AddeventState extends Equatable {
  const AddeventState();
  
  @override
  List<Object> get props => [];
}

final class AddeventInitial extends AddeventState {}
final class uploaddataloading extends AddeventState{}
final class uploaddataloaded extends AddeventState{}

final class uploaddataerror extends AddeventState{
  final String message;
  uploaddataerror(this.message);

  @override
  List<Object> get props=>[message];
}

