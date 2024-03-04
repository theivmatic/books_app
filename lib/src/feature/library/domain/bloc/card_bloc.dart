import 'package:books_app/src/feature/library/data/cards_db.dart';
import 'package:books_app/src/feature/library/domain/models/card.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardBlocEvent, CardBlocState> {
  CardBloc() : super(CardBlocInitialState()) {
    var bookCards = <BookCard>[];
    on<AddCardEvent>((event, emit) async {
      await CardsDatabase.instance.createCard(
        BookCard(
          imagePath: event.imagePath,
          title: event.title,
          author: event.author,
          genre: event.genre,
          publishedYear: event.publishedYear,
          pagesQuantity: event.pagesQuantity,
          description: event.description,
          status: event.status,
          pageBookmark: event.pageBookmark,
          comment: event.comment,
        ),
      );
    });

    on<FetchCardsEvent>((event, emit) async {
      bookCards = await CardsDatabase.instance.readAllCards();
      emit(
        DisplayCards(
          bookCard: bookCards,
          imagePath: CardFields.imagePath,
        ),
      );
    });

    on<FetchSpecificCardEvent>((event, emit) async {
      final bookCard = await CardsDatabase.instance.readCard(id: event.id);
      emit(
        DisplaySpecificCards(
          bookCard: bookCard,
        ),
      );
    });

    on<FetchFromLibraryEvent>((event, emit) async {
      bookCards = await CardsDatabase.instance.readAllCards();
      emit(
        DisplayFetchedFromLibraryCard(
          bookCard: bookCards,
        ),
      );
    });

    on<UpdateCardEvent>((event, emit) async {
      await CardsDatabase.instance.updateCard(
        bookCard: event.updatedCard,
      );
    });

    on<DeleteCardEvent>((event, emit) async {
      await CardsDatabase.instance.deleteCard(id: event.id);
      add(
        const FetchCardsEvent(),
      );
    });
  }
}
