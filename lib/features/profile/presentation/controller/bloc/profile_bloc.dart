import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_demo_mac/features/profile/data/repo/updateprofilerepo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Updateprofilerepo updateprofilerepo;
  ProfileBloc(this.updateprofilerepo) : super(ProfileInitial()) {
    on<ProfileUpdateevent>((event, emit) async {
      emit(Profileupdateloading());
      var resp = await updateprofilerepo.updateprofile(event.body,event.images);
      if (resp.isSuccessed!) {
        emit(Profileupdatesuccess());
      } else {
        emit(Profileupdateerror(resp.message!));
      }
    });
  }
}
