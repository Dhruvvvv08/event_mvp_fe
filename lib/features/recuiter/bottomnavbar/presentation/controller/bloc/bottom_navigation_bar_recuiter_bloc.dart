import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_bar_recuiter_event.dart';
part 'bottom_navigation_bar_recuiter_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarRecuiterEvent, BottomNavigationBarRecuiterState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarRecuiterState(0)) {
    on<BottomNavTabchanged>((event, emit) {
    emit(BottomNavigationBarRecuiterState(event.index));
    });
  }
}
