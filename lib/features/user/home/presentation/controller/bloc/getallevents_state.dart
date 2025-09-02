part of 'getallevents_bloc.dart';

sealed class GetalleventsState extends Equatable {
  const GetalleventsState();
  
  @override
  List<Object> get props => [];
}

final class GetalleventsInitial extends GetalleventsState {}

final class   getalleventsloading extends GetalleventsState{
  const getalleventsloading();
   @override
  List<Object> get props => [];
}

final class getalleventsloaded extends GetalleventsState{
  final GetallEvents getalleventsdata;
  const getalleventsloaded(this.getalleventsdata);
  @override
  List<Object> get props => [getalleventsdata];
}
final class getalleventserror extends GetalleventsState{
  final String error;
   getalleventserror(this.error);
  @override
  List<Object> get props => [error];
}