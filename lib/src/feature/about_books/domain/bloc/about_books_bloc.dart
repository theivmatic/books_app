import 'package:books_app/src/feature/about_books/data/fetch_article.dart';
import 'package:books_app/src/feature/about_books/domain/models/article_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'about_books_event.dart';
part 'about_books_state.dart';

class AboutBooksBloc extends Bloc<AboutBooksBlocEvent, AboutBooksBlocState> {
  AboutBooksBloc() : super(AboutBooksBlocInitialState()) {
    on<FetchArticlesEvent>(
      (event, emit) async {
        try {
          final articlesLoaded = await fetchArticles();
          emit(
            AboutBooksBlocLoadedState(
              articlesLoaded: articlesLoaded,
            ),
          );
        } on Exception catch (e) {
          emit(
            AboutBooksBlocErrorState(
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
  }
}
