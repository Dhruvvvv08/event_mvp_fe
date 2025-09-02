import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_recuiter_event.dart';
part 'request_recuiter_state.dart';

class RequestRecuiterBloc extends Bloc<RequestRecuiterEvent, RequestRecuiterState> {
  RequestRecuiterBloc() : super(RequestRecuiterState(0)) {
    on<TabchangedEvent>((event, emit) {
      emit(RequestRecuiterState(event.index));

    });
  }
}
