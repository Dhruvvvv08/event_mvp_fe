part of 'addevent_bloc.dart';

 class AddeventEvent extends Equatable {
  const AddeventEvent();

  @override
  List<Object> get props => [];
}

class uploadataEvent extends AddeventEvent {
  final Map body;
  const uploadataEvent(this.body);
  @override
  List<Object> get props => [];
}
