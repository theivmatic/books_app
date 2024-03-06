part of 'about_books_bloc.dart';

sealed class AboutBooksBlocState {}

final class AboutBooksBlocInitialState extends AboutBooksBlocState {}

final class AboutBooksBlocLoadingState extends AboutBooksBlocState {}

final class AboutBooksBlocLoadedState extends AboutBooksBlocState {
  final ArticleEntity articlesLoaded;

  AboutBooksBlocLoadedState({
    required this.articlesLoaded,
  });
}

final class AboutBooksBlocErrorState extends AboutBooksBlocState {
  final String errorMessage;

  AboutBooksBlocErrorState({
    required this.errorMessage,
  });
}
