part of 'card_bloc.dart';

@immutable
sealed class CardBlocState extends Equatable {
  const CardBlocState();
}

final class CardBlocInitialState extends CardBlocState {
  @override
  List<Object?> get props => [];
}

class DisplayCards extends CardBlocState {
  final List<BookCard> bookCard;
  final String imagePath;

  const DisplayCards({
    required this.bookCard,
    required this.imagePath,
  });

  @override
  List<Object> get props => [bookCard];
}

class DisplaySpecificCards extends CardBlocState {
  final BookCard bookCard;

  const DisplaySpecificCards({
    required this.bookCard,
  });

  @override
  List<Object> get props => [bookCard];
}
