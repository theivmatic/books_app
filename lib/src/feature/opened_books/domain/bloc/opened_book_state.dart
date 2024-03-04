part of 'opened_book_bloc.dart';

sealed class OpenedBookBlocState extends Equatable {
  const OpenedBookBlocState();
  
  @override
  List<Object> get props => [];
}

final class OpenedBookBlocInitialState extends OpenedBookBlocState {}

class DisplayFetchedFromLibraryCard extends OpenedBookBlocState {
  final List<BookCard> bookCard;

  const DisplayFetchedFromLibraryCard({
    required this.bookCard,
  });

  @override
  List<Object> get props => [bookCard];
}
