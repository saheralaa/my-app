import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'inter_net_event.dart';
part 'inter_net_state.dart';

class InterNetBloc extends Bloc<InterNetEvent, InterNetState> {
  StreamSubscription? streamSubscription;
  InterNetBloc() : super(InterNetInitial()) {
    on<InterNetEvent>((event, emit) {
      if (event is ConectedInterNet) {
        emit(ConnectedInterNet(mes: 'Conected'));
      } else if (event is NotConectedInterNet) {
        emit(NotConnectedInterNetState(mes: 'Not Conected'));
      }
    });
    streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
          if (result == ConnectivityResult.wifi ||
              result == ConnectivityResult.mobile) {
            add(ConectedInterNet());
          } else {
            add(NotConectedInterNet());
          }
        } as void Function(List<ConnectivityResult> event)?);
  }

  @override
  Future<void> close() {
    streamSubscription!.cancel();
    return super.close();
  }
}
