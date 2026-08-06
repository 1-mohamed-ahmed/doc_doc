import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:doc_doc/cubit/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInit()){
      checkInternet();
  }

  late final StreamSubscription<InternetStatus> _subscription;

  void checkInternet() {
    _subscription = InternetConnection().onStatusChange.listen((status) {
      if (status == InternetStatus.connected) {
        emit(InternetConnected());
      } else {
        emit(InternetDisConnected());
      }
    });
  }



  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
