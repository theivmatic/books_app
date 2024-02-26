part of 'search_bloc.dart';

sealed class SearchBlocEvent {}

class SearchWord extends SearchBlocEvent {
  final String word;

  SearchWord({
    required this.word,
  });
}
