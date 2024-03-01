import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<Object?> bloc) {
    super.onCreate(bloc);
    log('Created $bloc');
  }

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    super.onEvent(bloc, event);
    log('Event in $bloc: $event');
  }

  @override
  void onChange(BlocBase<Object?> bloc, Change<Object?> change) {
    super.onChange(bloc, change);
    log('Changed state in $bloc from ${change.currentState} to ${change.nextState}');
  }

  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    log('Transition in $bloc : ${transition.currentState} -> ${transition.nextState}');
  }

  @override
  void onClose(BlocBase<Object?> bloc) {
    super.onClose(bloc);
    log('Closed $bloc');
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('Error in $bloc: $error\nStacktrace: $stackTrace');
  }
}
