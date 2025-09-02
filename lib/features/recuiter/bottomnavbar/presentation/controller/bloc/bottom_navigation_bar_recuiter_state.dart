part of 'bottom_navigation_bar_recuiter_bloc.dart';

class BottomNavigationBarRecuiterState extends Equatable {
  final int currentindex;
  const BottomNavigationBarRecuiterState(this.currentindex);
  
  @override
  List<Object> get props => [currentindex];
}
