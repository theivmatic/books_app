part of 'search_bloc.dart';

sealed class SearchBlocEvent {}

class SearchWord extends SearchBlocEvent {
  final String keyword;

  SearchWord({
    required this.keyword,
  });
}
