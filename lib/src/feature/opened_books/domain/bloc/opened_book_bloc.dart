import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'opened_book_event.dart';
part 'opened_book_state.dart';

class OpenedBookBloc extends Bloc<OpenedBookEvent, OpenedBookState> {
  OpenedBookBloc() : super(OpenedBookInitial()) {
    on<OpenedBookEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
