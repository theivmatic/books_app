import 'dart:developer';

import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'opened_book_event.dart';
part 'opened_book_state.dart';

class OpenedBookBloc extends Bloc<OpenedBookBlocEvent, OpenedBookBlocState> {
  OpenedBookBloc() : super(OpenedBookBlocInitialState()) {
    var bookCards = <BookCard>[];
    on<DisplayOpenedBooks>((event, emit) {
      bookCards = event.openedBooks ?? bookCards;

      emit(
        OpenedBookBlocInitialState(),
      );
      emit(
        OpenedBookBlocLoadedState(openedBooks: bookCards),
      );
      log(
        'BOOKCARDS: $bookCards',
      );
    });
  }
}
