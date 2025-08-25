part of 'bottom_navigation_bar_bloc.dart';

class BottomNavigationBarState extends Equatable {
  final int currentindex;
  const BottomNavigationBarState(this.currentindex);
  
  @override
  List<Object> get props => [currentindex];
}
