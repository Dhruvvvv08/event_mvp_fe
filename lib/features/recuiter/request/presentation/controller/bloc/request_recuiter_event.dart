part of 'request_recuiter_bloc.dart';

abstract class RequestRecuiterEvent extends Equatable {
  const RequestRecuiterEvent();

  @override
  List<Object> get props => [];
}

class TabchangedEvent extends RequestRecuiterEvent{
  final int index;
  const TabchangedEvent(this.index);

  @override
  List<Object> get props=>[index];
}
