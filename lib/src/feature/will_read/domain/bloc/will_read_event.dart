part of 'will_read_bloc.dart';

sealed class WillReadBlocEvent extends Equatable {
  const WillReadBlocEvent();

  @override
  List<Object> get props => [];
}

class DisplayWillReadBooks extends WillReadBlocEvent {
  final List<BookCard>? openedBooks;

  const DisplayWillReadBooks({
    this.openedBooks,
  });
}
