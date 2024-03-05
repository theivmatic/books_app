part of 'will_read_bloc.dart';

sealed class WillReadBlocState extends Equatable {
  const WillReadBlocState();
  
  @override
  List<Object> get props => [];
}

final class WillReadBlocInitialState extends WillReadBlocState {}

final class WillReadBlocLoadedState extends WillReadBlocState {
  final List<BookCard> openedBooks;

  const WillReadBlocLoadedState({
    required this.openedBooks,
  });
}
