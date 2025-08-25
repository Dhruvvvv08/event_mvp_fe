import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarState(0)) {
    on<BottomNavTabchanged>((event, emit) {
    emit(BottomNavigationBarState(event.index));
    });
  }
}
