import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  SearchBloc() : super(SearchBlocInitialState()) {
    on<SearchBlocEvent>((event, emit) {});
  }
}
