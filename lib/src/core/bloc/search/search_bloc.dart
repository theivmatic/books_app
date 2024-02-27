import 'package:books_app/src/feature/library/data/cards_db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  SearchBloc() : super(SearchBlocInitialState()) {
    on<SearchWord>((event, emit) async {
      await CardsDatabase.instance.searchCards(event.keyword);
      emit(SearchBlocLoadedState());
    });
  }
}
