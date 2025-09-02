part of 'request_recuiter_bloc.dart';

 class RequestRecuiterState extends Equatable {
  final int currentindex;
  const RequestRecuiterState(this.currentindex);
  
  @override
  List<Object> get props => [currentindex];
}

