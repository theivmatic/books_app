part of 'card_bloc.dart';

@immutable
sealed class CardBlocEvent extends Equatable {
  const CardBlocEvent();
}

class AddNoteEvent extends CardBlocEvent {
  final String? imagePath;
  final String? title;
  final String? author;
  final String? genre;
  final int? publishedYear;
  final int? pagesQuantity;
  final String? description;
  final String? status;
  final int? pageBookmark;
  final String? comment;

  const AddNoteEvent({
    required this.imagePath,
    required this.title,
    required this.author,
    required this.genre,
    required this.publishedYear,
    required this.pagesQuantity,
    required this.description,
    required this.status,
    required this.pageBookmark,
    required this.comment,
  });

  @override
  List<Object?> get props => [
        imagePath,
        title,
        author,
        genre,
        publishedYear,
        pagesQuantity,
        description,
        status,
        pageBookmark,
        comment,
      ];
}

class FetchCardsEvent extends CardBlocEvent {
  const FetchCardsEvent();

  @override
  List<Object?> get props => [];
}

class FetchSpecificCardEvent extends CardBlocEvent {
  final int id;

  const FetchSpecificCardEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

class UpdateCardEvent extends CardBlocEvent {
  final Card updatedCard;

  const UpdateCardEvent({
    required this.updatedCard,
  });

  @override
  List<Object?> get props => [];
}

class DeleteCardEvent extends CardBlocEvent {
  final int id;

  const DeleteCardEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
