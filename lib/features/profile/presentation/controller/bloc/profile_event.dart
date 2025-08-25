part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}
class ProfileUpdateevent extends ProfileEvent{
 Map<String, String> body;
 List<File> images;
   ProfileUpdateevent(this.body,this.images);
   @override
  List<Object> get props => [];

}