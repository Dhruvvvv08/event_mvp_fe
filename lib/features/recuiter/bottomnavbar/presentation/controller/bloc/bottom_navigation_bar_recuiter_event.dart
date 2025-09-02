part of 'bottom_navigation_bar_recuiter_bloc.dart';

// sealed class BottomNavigationBarRecuiterEvent extends Equatable {
//   const BottomNavigationBarRecuiterEvent();

//   @override
//   List<Object> get props => [];
// }


sealed class BottomNavigationBarRecuiterEvent extends Equatable {
  const BottomNavigationBarRecuiterEvent();

  @override
  List<Object> get props => [];
}
 class BottomNavTabchanged extends BottomNavigationBarRecuiterEvent{
  final int index;
  const BottomNavTabchanged(this.index);
  @override
  List<Object> get props=> [index];
}