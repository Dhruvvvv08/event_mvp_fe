part of 'bottom_navigation_bar_bloc.dart';

sealed class BottomNavigationBarEvent extends Equatable {
  const BottomNavigationBarEvent();

  @override
  List<Object> get props => [];
}
 class BottomNavTabchanged extends BottomNavigationBarEvent{
  final int index;
  const BottomNavTabchanged(this.index);
  @override
  List<Object> get props=> [index];
}