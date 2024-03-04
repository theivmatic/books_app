import 'package:books_app/src/feature/library/data/cards_db.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'opened_book_event.dart';
part 'opened_book_state.dart';

class OpenedBookBloc extends Bloc<OpenedBookBlocEvent, OpenedBookBlocState> {
  OpenedBookBloc() : super(OpenedBookBlocInitialState()) {
    var bookCards = <BookCard>[];
    on<AddFromLibraryEvent>((event, emit) async {
      bookCards = await CardsDatabase.instance.readAllCards();
      emit(
        DisplayFetchedFromLibraryCard(
          bookCard: bookCards,
        ),
      );
    });

    on<FetchOpenedBooksEvent>((event, emit) async {
      bookCards = await CardsDatabase.instance.readAllCards();
      emit(
        DisplayFetchedFromLibraryCard(
          bookCard: bookCards,
        ),
      );
    });
  }
}
