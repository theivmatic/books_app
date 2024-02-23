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
  final List<Card> card;
  final String imagePath;

  const DisplayCards({
    required this.card,
    required this.imagePath,
  });

  @override
  List<Object> get props => [card];
}

class DisplaySpecificCards extends CardBlocState {
  final Card card;

  const DisplaySpecificCards({
    required this.card,
  });

  @override
  List<Object> get props => [card];
}
