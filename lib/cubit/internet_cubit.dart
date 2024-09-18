import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? streamSubscription;
  InternetCubit() : super(InternetInitial());

  void conectnig() {
    emit(Conect(mes: 'Connected') as InternetState);
  }

  void notconectnig() {
    emit(NotConect(mes: 'Connected') as InternetState);
  }

  void checkConection() {
    streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
          if (result == ConnectivityResult.wifi ||
              result == ConnectivityResult.mobile) {
            conectnig();
          } else {
            notconectnig();
          }
        } as void Function(List<ConnectivityResult> event)?);
  }
}
