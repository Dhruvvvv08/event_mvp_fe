import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_demo_mac/features/recuiter/addevent/data/repo/addeventrepo.dart';
import 'package:flutter/material.dart';

part 'addevent_event.dart';
part 'addevent_state.dart';

class AddeventBloc extends Bloc<AddeventEvent, AddeventState> {
  final Addeventrepo addeventrepo;
  AddeventBloc(this.addeventrepo) : super(AddeventInitial()) {
    on<uploadataEvent>((event, emit) async{
      emit(uploaddataloading());
      var res= await addeventrepo.uploadevent(event.body);
      if(res.isSuccessed!){
        emit(uploaddataloaded());
      }else{
        emit(uploaddataerror(res.message!));
      }
    
    });
  }
}
