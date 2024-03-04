part of 'opened_book_bloc.dart';

sealed class OpenedBookBlocState extends Equatable {
  const OpenedBookBlocState();

  @override
  List<Object> get props => [];
}

final class OpenedBookBlocInitialState extends OpenedBookBlocState {}

final class OpenedBookBlocLoadedState extends OpenedBookBlocState {
  final List<BookCard> openedBooks;

  const OpenedBookBlocLoadedState({
    required this.openedBooks,
  });
}
