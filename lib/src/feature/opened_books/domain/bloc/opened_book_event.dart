part of 'opened_book_bloc.dart';

sealed class OpenedBookBlocEvent extends Equatable {
  const OpenedBookBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchFromLibraryEvent extends OpenedBookBlocEvent {
  final int id;

  const FetchFromLibraryEvent({
    required this.id,
  });
}
