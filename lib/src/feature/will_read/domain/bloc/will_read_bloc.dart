import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'will_read_event.dart';
part 'will_read_state.dart';

class WillReadBloc extends Bloc<WillReadEvent, WillReadState> {
  WillReadBloc() : super(WillReadInitial()) {
    on<WillReadEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
