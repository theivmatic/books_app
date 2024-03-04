part of 'opened_book_bloc.dart';

sealed class OpenedBookBlocEvent extends Equatable {
  const OpenedBookBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchOpenedBooksEvent extends OpenedBookBlocEvent {
  const FetchOpenedBooksEvent();
}

class AddFromLibraryEvent extends OpenedBookBlocEvent {
  final int id;

  const AddFromLibraryEvent({
    required this.id,
  });
}
