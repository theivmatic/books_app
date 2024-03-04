part of 'opened_book_bloc.dart';

sealed class OpenedBookBlocEvent extends Equatable {
  const OpenedBookBlocEvent();

  @override
  List<Object> get props => [];
}

class DisplayOpenedBooks extends OpenedBookBlocEvent {
  final List<BookCard>? openedBooks;

  const DisplayOpenedBooks({
    this.openedBooks,
  });
}
