import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:event_demo_mac/features/user/home/data/models/getalleventsmodel.dart';
import 'package:event_demo_mac/features/user/home/data/repo/homerepo.dart';

part 'getallevents_event.dart';
part 'getallevents_state.dart';

class GetalleventsBloc extends Bloc<GetalleventsEvent, GetalleventsState> {
  final Homerepo homerepo;
  GetalleventsBloc(this.homerepo) : super(GetalleventsInitial()) {
    on<getallevents>((event, emit) async{
      emit(getalleventsloading());
      var resp= await homerepo.getevents();
      if(resp.isSuccessed!){
        emit(getalleventsloaded(resp.data!));
      }


    });
  }
}
